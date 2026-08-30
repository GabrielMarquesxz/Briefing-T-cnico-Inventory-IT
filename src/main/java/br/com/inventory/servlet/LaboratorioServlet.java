package br.com.inventory.servlet;

import br.com.inventory.dao.LaboratorioDAO;
import br.com.inventory.model.Laboratorio;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/laboratorios")
public class LaboratorioServlet extends HttpServlet {
    private LaboratorioDAO dao = new LaboratorioDAO();

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String acao = request.getParameter("acao");

        if ("excluir".equals(acao)) {
            Long id = Long.parseLong(request.getParameter("id"));
            dao.excluir(id);
            response.sendRedirect("laboratorios");
            return;
        } else if ("editar".equals(acao)) {
            Long id = Long.parseLong(request.getParameter("id"));
            Laboratorio lab = dao.buscarPorId(id);
            request.setAttribute("laboratorio", lab);
            request.getRequestDispatcher("novo-laboratorio.jsp").forward(request, response);
            return;
        }

        request.setAttribute("laboratorios", dao.listarTodos());
        request.getRequestDispatcher("laboratorios.jsp").forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String idStr = request.getParameter("id");
        
        Laboratorio lab = new Laboratorio();
        if (idStr != null && !idStr.isEmpty()) {
            lab.setId(Long.parseLong(idStr));
        }
        lab.setNome(request.getParameter("nome"));
        lab.setBloco(request.getParameter("bloco"));
        
        dao.salvar(lab);
        response.sendRedirect("laboratorios");
    }
}