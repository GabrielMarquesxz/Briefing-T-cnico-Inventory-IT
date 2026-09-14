package br.com.inventory.dao;

import java.util.List;

import br.com.inventory.modelo.Equipamento;
import jakarta.persistence.EntityManager;
import jakarta.persistence.EntityTransaction;

public class EquipamentoDAO {

    public void salvar(Equipamento equipamento) {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            EntityTransaction transacao = em.getTransaction();
            transacao.begin();

            try {
                em.persist(equipamento);
                transacao.commit();
            } finally {
                if (transacao.isActive()) {
                    transacao.rollback();
                }
            }
        }
    }

    public List<Equipamento> listarTodos() {
        try (EntityManager em = JPAUtil.getEntityManager()) {
            return em.createQuery(
                    "SELECT e FROM Equipamento e ORDER BY e.id",
                    Equipamento.class
            ).getResultList();
        }
    }
}
