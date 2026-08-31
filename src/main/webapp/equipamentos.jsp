<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-BR">

<head>
    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>Equipamentos - Inventory-IT</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
        rel="stylesheet">
</head>

<body class="bg-light">

    <div class="container py-5">

        <div class="bg-white p-4 rounded shadow">

            <div class="d-flex flex-wrap
                        justify-content-between
                        align-items-center
                        gap-2 mb-3">

                <h2 class="mb-0">
                    Equipamentos Cadastrados
                </h2>

                <div class="d-flex gap-2">

                    <a href="equipamentos?acao=novo"
                       class="btn btn-success">

                        Novo Equipamento

                    </a>

                    <a href="laboratorios"
                       class="btn btn-secondary">

                        Ver Laboratórios

                    </a>

                </div>

            </div>

            <hr>

            <!-- Filtro de equipamentos -->
            <form action="equipamentos"
                  method="get"
                  class="row g-2 mb-4">

                <div class="col-md-8">

                    <input
                        type="text"
                        name="filtro"
                        class="form-control"
                        value="<c:out value='${filtro}' />"
                        placeholder="Buscar por número de série, tipo, laboratório ou bloco">

                </div>

                <div class="col-md-auto">

                    <button
                        type="submit"
                        class="btn btn-primary">

                        Buscar

                    </button>

                </div>

                <div class="col-md-auto">

                    <a href="equipamentos"
                       class="btn btn-outline-secondary">

                        Limpar

                    </a>

                </div>

            </form>

            <c:if test="${not empty filtro}">

                <div class="alert alert-secondary py-2">

                    Resultado da busca por:

                    <strong>
                        <c:out value="${filtro}" />
                    </strong>

                </div>

            </c:if>

            <!-- Caso não existam resultados -->
            <c:if test="${empty equipamentos}">

                <div class="alert alert-info">

                    Nenhum equipamento encontrado.

                </div>

            </c:if>

            <!-- Tabela -->
            <c:if test="${not empty equipamentos}">

                <div class="table-responsive">

                    <table class="table table-striped
                                  table-hover
                                  align-middle">

                        <thead class="table-dark">

                            <tr>

                                <th>ID</th>

                                <th>
                                    Número de Série
                                </th>

                                <th>
                                    Tipo
                                </th>

                                <th>
                                    Laboratório
                                </th>

                                <th class="text-end">
                                    Ações
                                </th>

                            </tr>

                        </thead>

                        <tbody>

                            <c:forEach
                                var="equip"
                                items="${equipamentos}">

                                <tr>

                                    <td>
                                        <c:out
                                            value="${equip.id}" />
                                    </td>

                                    <td>
                                        <c:out
                                            value="${equip.numeroSerie}" />
                                    </td>

                                    <td>
                                        <c:out
                                            value="${equip.tipo}" />
                                    </td>

                                    <td>

                                        <c:out
                                            value="${equip.laboratorio.nome}" />

                                        -
                                        Bloco

                                        <c:out
                                            value="${equip.laboratorio.bloco}" />

                                    </td>

                                    <td class="text-end">

                                        <a
                                            href="equipamentos?acao=editar&id=${equip.id}"
                                            class="btn btn-warning btn-sm">

                                            Editar

                                        </a>

                                        <a
                                            href="equipamentos?acao=excluir&id=${equip.id}"
                                            class="btn btn-danger btn-sm"
                                            onclick="return confirm('Deseja realmente excluir este equipamento?')">

                                            Excluir

                                        </a>

                                    </td>

                                </tr>

                            </c:forEach>

                        </tbody>

                    </table>

                </div>

            </c:if>

        </div>

    </div>

</body>
</html>