<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Inventory-IT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <main class="container py-5 text-center">
        <h1 class="mb-3">Inventory-IT</h1>
        <p class="text-secondary mb-4">Cadastro de laboratórios e equipamentos.</p>
        <div class="d-flex justify-content-center gap-2">
            <a class="btn btn-primary" href="${pageContext.request.contextPath}/laboratorios">Laboratórios</a>
            <a class="btn btn-outline-primary" href="${pageContext.request.contextPath}/equipamentos">Equipamentos</a>
        </div>
    </main>
</body>
</html>
