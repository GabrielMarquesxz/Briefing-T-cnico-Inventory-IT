<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%@ taglib uri="jakarta.tags.core" prefix="c" %>

<!DOCTYPE html>
<html lang="pt-BR">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>Laboratórios - Inventory-IT</title>

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
                    Laboratórios Cadastrados
                </h2>

                <div class="d-flex gap-2">

                    <a href="novo-laboratorio.jsp"
                       class="btn btn-success">

                        Novo Laboratório

                    </a>

                    <a href="equipamentos"
                       class="btn btn-primary">

                        Ir para Equipamentos

                    </a>

                </div>

            </div>

            <hr>


            <!-- Mensagem de exclusão realizada -->
            <c:if test="${param.sucesso == 'excluido'}">

                <div
                    class="alert alert-success alert-dismissible fade show"
                    role="alert">

                    Laboratório excluído com sucesso.

                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="alert"
                        aria-label="Fechar">
                    </button>

                </div>

            </c:if>


            <!-- Tentativa de excluir laboratório com equipamentos -->
            <c:if test="${param.erro == 'possuiEquipamentos'}">

                <div
                    class="alert alert-danger alert-dismissible fade show"
                    role="alert">

                    <strong>
                        Não foi possível excluir o laboratório.
                    </strong>

                    Existem equipamentos vinculados a ele.

                    Remova ou transfira os equipamentos antes
                    de excluir o laboratório.

                    <button
                        type="button"
                        class="btn-close"
                        data-bs-dismiss="alert"
                        aria-label="Fechar">
                    </button>

                </div>

            </c:if>


            <!-- Nenhum laboratório cadastrado -->
            <c:if test="${empty laboratorios}">

                <div class="alert alert-info"
                     role="alert">

                    Nenhum laboratório cadastrado.

                </div>

            </c:if>


            <!-- Lista de laboratórios -->
            <c:if test="${not empty laboratorios}">

                <div class="table-responsive">

                    <table
                        class="table table-striped
                               table-hover
                               align-middle mt-3">

                        <thead class="table-dark">

                            <tr>

                                <th>ID</th>

                                <th>Nome</th>

                                <th>Bloco</th>

                                <th class="text-end">
                                    Ações
                                </th>

                            </tr>

                        </thead>

                        <tbody>

                            <c:forEach
                                var="lab"
                                items="${laboratorios}">

                                <tr>

                                    <td>
                                        <c:out value="${lab.id}" />
                                    </td>

                                    <td>
                                        <c:out value="${lab.nome}" />
                                    </td>

                                    <td>
                                        <c:out value="${lab.bloco}" />
                                    </td>

                                    <td class="text-end">

                                        <a
                                            href="laboratorios?acao=editar&id=${lab.id}"
                                            class="btn btn-warning btn-sm">

                                            Editar

                                        </a>

                                        <a
                                            href="laboratorios?acao=excluir&id=${lab.id}"
                                            class="btn btn-danger btn-sm"
                                            onclick="return confirm('Deseja realmente excluir este laboratório?')">

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


    <script
        src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js">
    </script>

</body>

</html>