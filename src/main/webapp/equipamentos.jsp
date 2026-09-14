<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Equipamentos - Inventory-IT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <main class="container py-5">
        <div class="d-flex flex-wrap justify-content-between align-items-center gap-2 mb-4">
            <h1 class="h2 mb-0">Equipamentos</h1>
            <div class="d-flex gap-2">
                <a class="btn btn-secondary" href="${pageContext.request.contextPath}/laboratorios">Laboratórios</a>
                <a class="btn btn-primary" href="${pageContext.request.contextPath}/equipamentos?acao=novo">Novo equipamento</a>
            </div>
        </div>

        <div class="table-responsive">
            <table class="table table-striped align-middle">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Número de série</th>
                        <th>Tipo</th>
                        <th>Laboratório</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="equipamento" items="${equipamentos}">
                        <tr>
                            <td><c:out value="${equipamento.id}" /></td>
                            <td><c:out value="${equipamento.numeroSerie}" /></td>
                            <td><c:out value="${equipamento.tipo}" /></td>
                            <td><c:out value="${equipamento.laboratorio.nome}" /></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </main>
</body>
</html>
