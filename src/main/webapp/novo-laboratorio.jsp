<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gerenciar Laboratório</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light p-5">
    <div class="container bg-white p-4 rounded shadow" style="max-width: 600px;">
        <h2>${empty laboratorio ? 'Cadastrar Laboratório' : 'Editar Laboratório'}</h2>
        <hr>
        <form action="laboratorios" method="post">
            <!-- Campo oculto para identificar se é edição -->
            <input type="hidden" name="id" value="${laboratorio.id}">

            <div class="mb-3">
                <label class="form-label">Nome do Laboratório</label>
                <input type="text" name="nome" value="${laboratorio.nome}" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Bloco</label>
                <input type="text" name="bloco" value="${laboratorio.bloco}" class="form-control" required>
            </div>
            <button type="submit" class="btn btn-success">Salvar</button>
            <a href="laboratorios" class="btn btn-secondary">Cancelar</a>
        </form>
    </div>
</body>
</html>