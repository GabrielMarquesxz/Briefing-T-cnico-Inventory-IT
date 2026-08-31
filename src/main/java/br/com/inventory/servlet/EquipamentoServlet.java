package br.com.inventory.servlet;

import br.com.inventory.dao.EquipamentoDAO;
import br.com.inventory.dao.LaboratorioDAO;
import br.com.inventory.model.Equipamento;
import br.com.inventory.model.Laboratorio;

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
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String acao = request.getParameter("acao");

        if ("novo".equals(acao)) {

            request.setAttribute(
                    "laboratorios",
                    labDao.listarTodos()
            );

            request.getRequestDispatcher(
                    "novo-equipamento.jsp"
            ).forward(request, response);

            return;

        } else if ("excluir".equals(acao)) {

            Long id = Long.parseLong(
                    request.getParameter("id")
            );

            dao.excluir(id);

            response.sendRedirect("equipamentos");

            return;

        } else if ("editar".equals(acao)) {

            Long id = Long.parseLong(
                    request.getParameter("id")
            );

            Equipamento equipamento =
                    dao.buscarPorId(id);

            request.setAttribute(
                    "equipamento",
                    equipamento
            );

            request.setAttribute(
                    "laboratorios",
                    labDao.listarTodos()
            );

            request.getRequestDispatcher(
                    "novo-equipamento.jsp"
            ).forward(request, response);

            return;
        }

        String filtro = request.getParameter("filtro");

        if (filtro != null && !filtro.trim().isEmpty()) {

            request.setAttribute(
                    "equipamentos",
                    dao.filtrar(filtro.trim())
            );

            request.setAttribute(
                    "filtro",
                    filtro.trim()
            );

        } else {

            request.setAttribute(
                    "equipamentos",
                    dao.listarTodos()
            );
        }

        request.getRequestDispatcher(
                "equipamentos.jsp"
        ).forward(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        String idStr = request.getParameter("id");

        Equipamento equipamento =
                new Equipamento();

        if (idStr != null && !idStr.isEmpty()) {

            equipamento.setId(
                    Long.parseLong(idStr)
            );
        }

        equipamento.setNumeroSerie(
                request.getParameter("numeroSerie")
        );

        equipamento.setTipo(
                request.getParameter("tipo")
        );

        Long labId = Long.parseLong(
                request.getParameter("laboratorio_id")
        );

        Laboratorio laboratorio =
                labDao.buscarPorId(labId);

        equipamento.setLaboratorio(
                laboratorio
        );

        dao.salvar(equipamento);

        response.sendRedirect("equipamentos");
    }
}