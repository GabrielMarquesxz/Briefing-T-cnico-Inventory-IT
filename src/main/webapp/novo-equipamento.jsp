<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>
        ${empty equipamento ? 'Novo Equipamento' : 'Editar Equipamento'} - Inventory-IT
    </title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
        rel="stylesheet">
</head>

<body class="bg-light">

    <div class="container py-5">

        <div class="bg-white p-4 rounded shadow mx-auto"
             style="max-width: 600px;">

            <h2>
                ${empty equipamento
                    ? 'Cadastrar Equipamento'
                    : 'Editar Equipamento'}
            </h2>

            <p class="text-muted">
                Preencha os dados do equipamento e selecione
                o laboratório onde ele está alocado.
            </p>

            <hr>

            <form action="equipamentos" method="post">

                <!--
                    Quando existe um ID, o Servlet entende
                    que se trata da edição de um equipamento.
                -->
                <input type="hidden"
                       name="id"
                       value="${equipamento.id}">

                <div class="mb-3">

                    <label for="numeroSerie"
                           class="form-label">
                        Número de Série
                    </label>

                    <input
                        type="text"
                        id="numeroSerie"
                        name="numeroSerie"
                        value="<c:out value='${equipamento.numeroSerie}' />"
                        class="form-control"
                        maxlength="100"
                        placeholder="Ex: PC-2026-001"
                        required>

                </div>

                <div class="mb-3">

                    <label for="tipo"
                           class="form-label">
                        Tipo
                    </label>

                    <input
                        type="text"
                        id="tipo"
                        name="tipo"
                        value="<c:out value='${equipamento.tipo}' />"
                        class="form-control"
                        maxlength="100"
                        placeholder="Ex: Computador, Monitor, Projetor"
                        required>

                </div>

                <div class="mb-3">

                    <label for="laboratorio_id"
                           class="form-label">
                        Laboratório Alocado
                    </label>

                    <select
                        id="laboratorio_id"
                        name="laboratorio_id"
                        class="form-select"
                        required>

                        <option value="">
                            Selecione um laboratório...
                        </option>

                        <c:forEach var="lab"
                                   items="${laboratorios}">

                            <option
                                value="${lab.id}"
                                ${equipamento.laboratorio.id == lab.id
                                    ? 'selected'
                                    : ''}>

                                <c:out value="${lab.nome}" />
                                - Bloco
                                <c:out value="${lab.bloco}" />

                            </option>

                        </c:forEach>

                    </select>

                </div>

                <!-- Aviso caso nenhum laboratório esteja cadastrado -->
                <c:if test="${empty laboratorios}">

                    <div class="alert alert-warning" role="alert">

                        Nenhum laboratório está cadastrado.

                        <a href="novo-laboratorio.jsp"
                           class="alert-link">
                            Cadastre um laboratório primeiro.
                        </a>

                    </div>

                </c:if>

                <div class="d-flex gap-2">

                    <button
                        type="submit"
                        class="btn btn-primary"
                        ${empty laboratorios ? 'disabled' : ''}>
                        Salvar
                    </button>

                    <a href="equipamentos"
                       class="btn btn-secondary">
                        Cancelar
                    </a>

                </div>

            </form>

        </div>

    </div>

</body>
</html>