<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Laboratórios - Inventory-IT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <main class="container py-5">
        <div class="d-flex justify-content-between align-items-center mb-4">
            <h1 class="h2 mb-0">Laboratórios</h1>
            <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/equipamentos">Ver equipamentos</a>
        </div>

        <div class="card shadow-sm mb-4">
            <div class="card-body">
                <h2 class="h5 mb-3">Cadastrar laboratório</h2>
                <form action="${pageContext.request.contextPath}/laboratorios" method="post">
                    <div class="row g-3 align-items-end">
                        <div class="col-md-6">
                            <label for="nome" class="form-label">Nome</label>
                            <input id="nome" name="nome" type="text" class="form-control" required>
                        </div>
                        <div class="col-md-4">
                            <label for="bloco" class="form-label">Bloco</label>
                            <input id="bloco" name="bloco" type="text" class="form-control" required>
                        </div>
                        <div class="col-md-2 d-grid">
                            <button type="submit" class="btn btn-primary">Salvar</button>
                        </div>
                    </div>
                </form>
            </div>
        </div>

        <div class="table-responsive">
            <table class="table table-striped align-middle">
                <thead>
                    <tr>
                        <th>ID</th>
                        <th>Nome</th>
                        <th>Bloco</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="laboratorio" items="${laboratorios}">
                        <tr>
                            <td><c:out value="${laboratorio.id}" /></td>
                            <td><c:out value="${laboratorio.nome}" /></td>
                            <td><c:out value="${laboratorio.bloco}" /></td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </div>
    </main>
</body>
</html>
