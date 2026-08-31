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
    protected void doGet(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        if ("excluir".equals(acao)) {

            Long id = Long.parseLong(
                    request.getParameter("id")
            );

            boolean excluido = dao.excluir(id);

            if (excluido) {

                response.sendRedirect(
                        "laboratorios?sucesso=excluido"
                );

            } else {

                response.sendRedirect(
                        "laboratorios?erro=possuiEquipamentos"
                );
            }

            return;

        } else if ("editar".equals(acao)) {

            Long id = Long.parseLong(
                    request.getParameter("id")
            );

            Laboratorio laboratorio =
                    dao.buscarPorId(id);

            request.setAttribute(
                    "laboratorio",
                    laboratorio
            );

            request.getRequestDispatcher(
                    "novo-laboratorio.jsp"
            ).forward(request, response);

            return;
        }

        request.setAttribute(
                "laboratorios",
                dao.listarTodos()
        );

        request.getRequestDispatcher(
                "laboratorios.jsp"
        ).forward(request, response);
    }


    @Override
    protected void doPost(
            HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");

        Laboratorio laboratorio =
                new Laboratorio();

        if (idStr != null && !idStr.isEmpty()) {

            laboratorio.setId(
                    Long.parseLong(idStr)
            );
        }

        laboratorio.setNome(
                request.getParameter("nome")
        );

        laboratorio.setBloco(
                request.getParameter("bloco")
        );

        dao.salvar(laboratorio);

        response.sendRedirect("laboratorios");
    }
}