package br.com.inventory.dao;

import java.util.List;

import br.com.inventory.modelo.Laboratorio;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

public class LaboratorioDAO {

    public void salvar(Laboratorio laboratorio) {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            EntityTransaction transacao = em.getTransaction();
            transacao.begin();

            try {
                em.persist(laboratorio);
                transacao.commit();
            } finally {
                if (transacao.isActive()) {
                    transacao.rollback();
                }
            }
        }
    }

    public List<Laboratorio> listarTodos() {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            return em.createQuery(
                    "SELECT l FROM Laboratorio l ORDER BY l.id",
                    Laboratorio.class
            ).getResultList();
        }
    }

    public Laboratorio buscarPorId(Long id) {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            return em.find(Laboratorio.class, id);
        }
    }
}
