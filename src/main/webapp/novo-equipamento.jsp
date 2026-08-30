<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
    <meta charset="UTF-8">
    <title>Gerenciar Equipamento</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light p-5">
    <div class="container bg-white p-4 rounded shadow" style="max-width: 600px;">
        <h2>${empty equipamento ? 'Cadastrar Equipamento' : 'Editar Equipamento'}</h2>
        <hr>
        <form action="equipamentos" method="post" class="mb-4">
            <!-- Campo oculto para identificar se é edição -->
            <input type="hidden" name="id" value="${equipamento.id}">

            <div class="mb-3">
                <label class="form-label">Número de Série</label>
                <input type="text" name="numeroSerie" value="${equipamento.numeroSerie}" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Tipo (Ex: PC, Projetor)</label>
                <input type="text" name="tipo" value="${equipamento.tipo}" class="form-control" required>
            </div>
            <div class="mb-3">
                <label class="form-label">Laboratório Alocado</label>
                <select name="laboratorio_id" class="form-select" required>
                    <option value="">Selecione...</option>
                    <c:forEach var="lab" items="${laboratorios}">
                        <option value="${lab.id}" ${equipamento.laboratorio.id == lab.id ? 'selected' : ''}>
                            ${lab.nome} - Bloco ${lab.bloco}
                        </option>
                    </c:forEach>
                </select>
            </div>
            <button type="submit" class="btn btn-success">Salvar</button>
            <a href="equipamentos" class="btn btn-secondary">Cancelar</a>
        </form>
    </div>
</body>
</html>