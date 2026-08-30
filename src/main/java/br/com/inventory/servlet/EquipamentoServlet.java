package br.com.inventory.servlet;

import br.com.inventory.dao.EquipamentoDAO;
import br.com.inventory.dao.LaboratorioDAO;
import br.com.inventory.model.Equipamento;
import br.com.inventory.model.Laboratorio;
import br.com.inventory.util.JPAUtil;
import jakarta.persistence.EntityManager;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/equipamentos")
public class EquipamentoServlet extends HttpServlet {
    private EquipamentoDAO dao = new EquipamentoDAO();
    private LaboratorioDAO labDao = new LaboratorioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acao = request.getParameter("acao");
        
        if ("novo".equals(acao)) {
            request.setAttribute("laboratorios", labDao.listarTodos());
            request.getRequestDispatcher("novo-equipamento.jsp").forward(request, response);
            return;
        } else if ("excluir".equals(acao)) {
            Long id = Long.parseLong(request.getParameter("id"));
            dao.excluir(id);
            response.sendRedirect("equipamentos");
            return;
        } else if ("editar".equals(acao)) {
            Long id = Long.parseLong(request.getParameter("id"));
            Equipamento eq = dao.buscarPorId(id);
            request.setAttribute("equipamento", eq);
            request.setAttribute("laboratorios", labDao.listarTodos());
            request.getRequestDispatcher("novo-equipamento.jsp").forward(request, response);
            return;
        }

        request.setAttribute("equipamentos", dao.listarTodos());
        request.getRequestDispatcher("equipamentos.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        EntityManager em = JPAUtil.getEntityManager();
        
        String idStr = request.getParameter("id");
        Equipamento equipamento = new Equipamento();
        if (idStr != null && !idStr.isEmpty()) {
            equipamento.setId(Long.parseLong(idStr));
        }
        
        equipamento.setNumeroSerie(request.getParameter("numeroSerie"));
        equipamento.setTipo(request.getParameter("tipo"));
        
        Long labId = Long.parseLong(request.getParameter("laboratorio_id"));
        Laboratorio lab = em.find(Laboratorio.class, labId);
        em.close();
        
        equipamento.setLaboratorio(lab);
        
        dao.salvar(equipamento);
        response.sendRedirect("equipamentos");
    }
}