<%@ page language="java"
    contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<!DOCTYPE html>
<html lang="pt-BR">

<head>

    <meta charset="UTF-8">

    <meta name="viewport"
          content="width=device-width, initial-scale=1">

    <title>Inventory-IT</title>

    <link
        href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css"
        rel="stylesheet">

</head>

<body class="bg-light">

    <div class="container py-5">

        <!-- Cabeçalho -->
        <div class="text-center mb-5">

            <h1 class="display-5 fw-bold">
                Inventory-IT
            </h1>

            <p class="lead text-muted">
                Sistema de gerenciamento de equipamentos
                e laboratórios de TI.
            </p>

        </div>


        <!-- Opções principais -->
        <div class="row g-4 justify-content-center">

            <!-- Laboratórios -->
            <div class="col-md-5">

                <div class="card shadow-sm h-100">

                    <div class="card-body p-4">

                        <h3 class="card-title">
                            Laboratórios
                        </h3>

                        <p class="card-text text-muted">
                            Cadastre, edite e gerencie os
                            laboratórios disponíveis.
                        </p>

                        <a href="laboratorios"
                           class="btn btn-primary">

                            Gerenciar Laboratórios

                        </a>

                    </div>

                </div>

            </div>


            <!-- Equipamentos -->
            <div class="col-md-5">

                <div class="card shadow-sm h-100">

                    <div class="card-body p-4">

                        <h3 class="card-title">
                            Equipamentos
                        </h3>

                        <p class="card-text text-muted">
                            Gerencie os equipamentos e visualize
                            em qual laboratório estão alocados.
                        </p>

                        <a href="equipamentos"
                           class="btn btn-success">

                            Gerenciar Equipamentos

                        </a>

                    </div>

                </div>

            </div>

        </div>


        <!-- Informações -->
        <div class="text-center mt-5">

            <p class="text-muted small mb-0">
                Inventory-IT • Sistema de Controle de Inventário
            </p>

        </div>

    </div>

</body>

</html>