package br.com.inventory.dao;

import br.com.inventory.model.Laboratorio;
import br.com.inventory.util.JPAUtil;

import jakarta.persistence.EntityManager;

import java.util.List;

public class LaboratorioDAO {

    public void salvar(Laboratorio laboratorio) {

        EntityManager em = JPAUtil.getEntityManager();

        try {
            em.getTransaction().begin();

            if (laboratorio.getId() == null) {
                em.persist(laboratorio);
            } else {
                em.merge(laboratorio);
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


    public List<Laboratorio> listarTodos() {

        EntityManager em = JPAUtil.getEntityManager();

        try {

            return em.createQuery(
                    "SELECT l FROM Laboratorio l ORDER BY l.id",
                    Laboratorio.class
            ).getResultList();

        } finally {
            em.close();
        }
    }


    public Laboratorio buscarPorId(Long id) {

        EntityManager em = JPAUtil.getEntityManager();

        try {

            return em.find(Laboratorio.class, id);

        } finally {
            em.close();
        }
    }


    public boolean possuiEquipamentos(Long laboratorioId) {

        EntityManager em = JPAUtil.getEntityManager();

        try {

            Long quantidade = em.createQuery(
                    "SELECT COUNT(e) " +
                    "FROM Equipamento e " +
                    "WHERE e.laboratorio.id = :laboratorioId",
                    Long.class
            )
            .setParameter("laboratorioId", laboratorioId)
            .getSingleResult();

            return quantidade > 0;

        } finally {
            em.close();
        }
    }


    public boolean excluir(Long id) {

        /*
         * Se existirem equipamentos vinculados,
         * o laboratório não pode ser excluído.
         */
        if (possuiEquipamentos(id)) {
            return false;
        }

        EntityManager em = JPAUtil.getEntityManager();

        try {

            em.getTransaction().begin();

            Laboratorio laboratorio =
                    em.find(Laboratorio.class, id);

            if (laboratorio == null) {

                em.getTransaction().rollback();

                return false;
            }

            em.remove(laboratorio);

            em.getTransaction().commit();

            return true;

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