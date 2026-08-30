package br.com.inventory.dao;

import br.com.inventory.model.Laboratorio;
import br.com.inventory.util.JPAUtil;
import jakarta.persistence.EntityManager;
import java.util.List;

public class LaboratorioDAO {
    public void salvar(Laboratorio laboratorio) {
        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        if (laboratorio.getId() == null) {
            em.persist(laboratorio);
        } else {
            em.merge(laboratorio); // Atualiza se já existir ID
        }
        em.getTransaction().commit();
        em.close();
    }

    public List<Laboratorio> listarTodos() {
        EntityManager em = JPAUtil.getEntityManager();
        List<Laboratorio> labs = em.createQuery("SELECT l FROM Laboratorio l", Laboratorio.class).getResultList();
        em.close();
        return labs;
    }

    public Laboratorio buscarPorId(Long id) {
        EntityManager em = JPAUtil.getEntityManager();
        Laboratorio lab = em.find(Laboratorio.class, id);
        em.close();
        return lab;
    }

    public void excluir(Long id) {
        EntityManager em = JPAUtil.getEntityManager();
        em.getTransaction().begin();
        Laboratorio lab = em.find(Laboratorio.class, id);
        if (lab != null) {
            em.remove(lab);
        }
        em.getTransaction().commit();
        em.close();
    }
}