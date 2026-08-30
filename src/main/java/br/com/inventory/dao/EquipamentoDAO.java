package br.com.inventory.dao;

import br.com.inventory.model.Equipamento;
import br.com.inventory.util.JPAUtil;
import jakarta.persistence.EntityManager;
import java.util.List;

public class EquipamentoDAO {
    public void salvar(Equipamento equipamento) {
        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        if (equipamento.getId() == null) {
            em.persist(equipamento);
        } else {
            em.merge(equipamento);
        }
        em.getTransaction().commit();
        em.close();
    }

    public List<Equipamento> listarTodos() {
        EntityManager em = JPAUtil.getEntityManager();
        List<Equipamento> equipamentos = em.createQuery("SELECT e FROM Equipamento e", Equipamento.class).getResultList();
        em.close();
        return equipamentos;
    }

    public Equipamento buscarPorId(Long id) {
        EntityManager em = JPAUtil.getEntityManager();
        Equipamento eq = em.find(Equipamento.class, id);
        em.close();
        return eq;
    }

    public void excluir(Long id) {
        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        Equipamento eq = em.find(Equipamento.class, id);
        if (eq != null) {
            em.remove(eq);
        }
        em.getTransaction().commit();
        em.close();
    }
}