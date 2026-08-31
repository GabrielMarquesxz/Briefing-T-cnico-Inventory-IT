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
        ${empty laboratorio ? 'Novo Laboratório' : 'Editar Laboratório'} - Inventory-IT
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
                ${empty laboratorio
                    ? 'Cadastrar Laboratório'
                    : 'Editar Laboratório'}
            </h2>

            <p class="text-muted">
                Preencha os dados do laboratório.
            </p>

            <hr>

            <form action="laboratorios" method="post">

                <!--
                    Quando existe um ID, o Servlet entende
                    que se trata da edição de um laboratório.
                -->
                <input type="hidden"
                       name="id"
                       value="${laboratorio.id}">

                <div class="mb-3">

                    <label for="nome"
                           class="form-label">
                        Nome do Laboratório
                    </label>

                    <input
                        type="text"
                        id="nome"
                        name="nome"
                        value="<c:out value='${laboratorio.nome}' />"
                        class="form-control"
                        maxlength="100"
                        placeholder="Ex: Laboratório de Informática 1"
                        required>

                </div>

                <div class="mb-3">

                    <label for="bloco"
                           class="form-label">
                        Bloco
                    </label>

                    <input
                        type="text"
                        id="bloco"
                        name="bloco"
                        value="<c:out value='${laboratorio.bloco}' />"
                        class="form-control"
                        maxlength="50"
                        placeholder="Ex: Bloco A"
                        required>

                </div>

                <div class="d-flex gap-2">

                    <button type="submit"
                            class="btn btn-success">
                        Salvar
                    </button>

                    <a href="laboratorios"
                       class="btn btn-secondary">
                        Cancelar
                    </a>

                </div>

            </form>

        </div>

    </div>

</body>
</html>