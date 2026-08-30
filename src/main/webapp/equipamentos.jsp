<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Lista de Equipamentos</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light p-5">
    <div class="container bg-white p-4 rounded shadow">
        <div class="d-flex justify-content-between align-items-center mb-3">
            <h2>Equipamentos Cadastrados</h2>
            <div>
                <a href="equipamentos?acao=novo" class="btn btn-success">Novo Equipamento</a>
                <a href="laboratorios" class="btn btn-secondary">Ver Laboratórios</a>
            </div>
        </div>
        <hr>
        <table class="table table-striped mt-3 align-middle">
            <thead>
                <tr>
                    <th>ID</th>
                    <th>Número de Série</th>
                    <th>Tipo</th>
                    <th>Laboratório</th>
                    <th class="text-end">Ações</th>
                </tr>
            </thead>
            <tbody>
                <c:forEach var="equip" items="${equipamentos}">
                    <tr>
                        <td>${equip.id}</td>
                        <td>${equip.numeroSerie}</td>
                        <td>${equip.tipo}</td>
                        <td>${equip.laboratorio.nome} (Bloco ${equip.laboratorio.bloco})</td>
                        <td class="text-end">
                            <!-- Botão de Editar -->
                            <a href="equipamentos?acao=editar&id=${equip.id}" class="btn btn-warning btn-sm">Editar</a>
                            <!-- Botão de Excluir com caixinha de confirmação em JavaScript -->
                            <a href="equipamentos?acao=excluir&id=${equip.id}" class="btn btn-danger btn-sm" onclick="return confirm('Deseja realmente excluir este equipamento?')">Excluir</a>
                        </td>
                    </tr>
                </c:forEach>
            </tbody>
        </table>
    </div>
</body>
</html>