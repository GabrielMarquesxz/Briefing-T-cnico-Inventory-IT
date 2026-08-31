package br.com.inventory.dao;

import br.com.inventory.model.Equipamento;
import br.com.inventory.util.JPAUtil;

import jakarta.persistence.EntityManager;

import java.util.List;

public class EquipamentoDAO {

    public void salvar(Equipamento equipamento) {

        EntityManager em = JPAUtil.getEntityManager();

        try {
            em.getTransaction().begin();

            if (equipamento.getId() == null) {
                em.persist(equipamento);
            } else {
                em.merge(equipamento);
            }

            em.getTransaction().commit();

        } catch (Exception e) {

            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }

            throw e;

        } finally {
            em.close();
        }
    }

    public List<Equipamento> listarTodos() {

        EntityManager em = JPAUtil.getEntityManager();

        try {
            return em.createQuery(
                    "SELECT e FROM Equipamento e " +
                    "JOIN FETCH e.laboratorio",
                    Equipamento.class
            ).getResultList();

        } finally {
            em.close();
        }
    }

    public List<Equipamento> filtrar(String filtro) {

        EntityManager em = JPAUtil.getEntityManager();

        try {
            return em.createQuery(
                    "SELECT e FROM Equipamento e " +
                    "JOIN FETCH e.laboratorio l " +
                    "WHERE LOWER(e.numeroSerie) LIKE LOWER(:filtro) " +
                    "OR LOWER(e.tipo) LIKE LOWER(:filtro) " +
                    "OR LOWER(l.nome) LIKE LOWER(:filtro) " +
                    "OR LOWER(l.bloco) LIKE LOWER(:filtro)",
                    Equipamento.class
            )
            .setParameter("filtro", "%" + filtro + "%")
            .getResultList();

        } finally {
            em.close();
        }
    }

    public Equipamento buscarPorId(Long id) {

        EntityManager em = JPAUtil.getEntityManager();

        try {
            return em.createQuery(
                    "SELECT e FROM Equipamento e " +
                    "JOIN FETCH e.laboratorio " +
                    "WHERE e.id = :id",
                    Equipamento.class
            )
            .setParameter("id", id)
            .getResultStream()
            .findFirst()
            .orElse(null);

        } finally {
            em.close();
        }
    }

    public void excluir(Long id) {

        EntityManager em = JPAUtil.getEntityManager();

        try {
            em.getTransaction().begin();

            Equipamento equipamento = em.find(Equipamento.class, id);

            if (equipamento != null) {
                em.remove(equipamento);
            }

            em.getTransaction().commit();

        } catch (Exception e) {

            if (em.getTransaction().isActive()) {
                em.getTransaction().rollback();
            }

            throw e;

        } finally {
            em.close();
        }
    }
}