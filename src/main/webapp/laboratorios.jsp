<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Laboratórios</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light p-5">
    <div class="container bg-white p-4 rounded shadow">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2>Laboratórios Cadastrados</h2>
            <div>
                <a href="novo-laboratorio.jsp" class="btn btn-success">Novo Laboratório</a>
                <a href="equipamentos" class="btn btn-primary">Ir para Equipamentos</a>
            </div>
        </div>
        <hr>
        <table class="table table-striped mt-3 align-middle">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Nome</th>
                    <th>Bloco</th>
                    <th class="text-end">Ações</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="lab" items="${laboratorios}">
                    <tr>
                        <td>${lab.id}</td>
                        <td>${lab.nome}</td>
                        <td>${lab.bloco}</td>
                        <td class="text-end">
                            <!-- Botão de Editar (apontando para uma futura rota ou servlet) -->
                            <a href="laboratorios?acao=editar&id=${lab.id}" class="btn btn-warning btn-sm">Editar</a>
                            <!-- Botão de Excluir -->
                            <a href="laboratorios?acao=excluir&id=${lab.id}" class="btn btn-danger btn-sm" onclick="return confirm('Deseja realmente excluir este laboratório?')">Excluir</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>