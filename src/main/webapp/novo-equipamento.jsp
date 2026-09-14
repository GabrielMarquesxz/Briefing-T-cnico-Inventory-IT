<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib uri="jakarta.tags.core" prefix="c" %>
<!DOCTYPE html>
<html lang="pt-BR">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Novo equipamento - Inventory-IT</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <main class="container py-5">
        <div class="card shadow-sm mx-auto" style="max-width: 760px;">
            <div class="card-body p-4">
                <h1 class="h2 mb-4">Cadastrar equipamento</h1>

                <form action="${pageContext.request.contextPath}/equipamentos" method="post">
                    <div class="row g-3">
                        <div class="col-md-6">
                            <label for="numeroSerie" class="form-label">Número de série</label>
                            <input id="numeroSerie" name="numeroSerie" type="text" class="form-control" required>
                        </div>
                        <div class="col-md-6">
                            <label for="tipo" class="form-label">Tipo</label>
                            <input id="tipo" name="tipo" type="text" class="form-control" required>
                        </div>
                        <div class="col-12">
                            <label for="laboratorio_id" class="form-label">Laboratório</label>
                            <select id="laboratorio_id" name="laboratorio_id" class="form-select" required>
                                <option value="">Selecione...</option>
                                <c:forEach var="laboratorio" items="${laboratorios}">
                                    <option value="${laboratorio.id}">
                                        <c:out value="${laboratorio.nome}" /> - Bloco <c:out value="${laboratorio.bloco}" />
                                    </option>
                                </c:forEach>
                            </select>
                        </div>
                        <div class="col-12 d-flex gap-2">
                            <button type="submit" class="btn btn-primary">Salvar</button>
                            <a class="btn btn-secondary" href="${pageContext.request.contextPath}/equipamentos">Voltar</a>
                        </div>
                    </div>
                </form>
            </div>
        </div>
    </main>
</body>
</html>
