# Inventory-IT — Atividade

Versão final e mínima do Inventory-IT para a atividade de Servlets, JPA e Bootstrap 5. O sistema cadastra e lista laboratórios e equipamentos, mantendo a associação de cada equipamento com seu laboratório.

> A página de apresentação do projeto fica em [`docs/index.html`](docs/index.html) e pode ser publicada pelo GitHub Pages.

## Escopo implementado

- Cadastro e listagem de laboratórios.
- Cadastro e listagem de equipamentos.
- Associação obrigatória entre equipamento e laboratório.
- Carregamento dos laboratórios no campo de seleção do equipamento.
- Exibição do laboratório associado na listagem de equipamentos.
- Padrão POST-Redirect-GET depois dos cadastros.

Para manter a atividade objetiva, não há edição, exclusão, pesquisa, filtros, camada de serviço ou regras adicionais.

## Arquitetura

```text
Navegador → Servlet → DAO → JPA/Hibernate → H2
```

- As JSPs formam a interface e usam Bootstrap 5 e JSTL.
- Os Servlets recebem as requisições e coordenam o fluxo.
- Os DAOs contêm apenas as operações necessárias à atividade.
- JPA/Hibernate realiza a persistência em um banco H2 em memória.

## Tecnologias

- Java 17+
- Jakarta Servlet 6
- Jakarta Persistence 3.1
- Hibernate ORM 6.4
- H2 Database 2.2
- JSP e JSTL 3
- Bootstrap 5
- Maven
- Apache Tomcat 11

O Maven é usado apenas para declarar dependências e gerar o WAR; não há arquivos JAR copiados manualmente para o projeto.

## Importar no Eclipse

1. Acesse `File > Import`.
2. Selecione `Maven > Existing Maven Projects`.
3. Escolha a pasta clonada deste repositório.
4. Confirme o `pom.xml` encontrado e clique em `Finish`.
5. Se necessário, clique com o botão direito no projeto e use `Maven > Update Project`.

## Executar no Tomcat 11

1. Tenha o JDK 17 ou superior instalado.
2. Cadastre o Tomcat 11 em `Window > Preferences > Server > Runtime Environments`.
3. Clique com o botão direito no projeto e selecione `Run As > Run on Server`.
4. Escolha o Tomcat 11 e conclua a configuração.
5. Abra `http://localhost:8080/Inventory-IT-Atividade/`.

Também é possível gerar o pacote pela linha de comando:

```bash
mvn clean package
```

O arquivo pronto para implantação será criado em:

```text
target/Inventory-IT-Atividade.war
```

## Decisão sobre transações

O projeto usa Jakarta Persistence 3.1, em que `EntityManager` implementa `AutoCloseable`. Por isso, os DAOs usam `try-with-resources`. Nas gravações, um `finally` mínimo executa rollback somente se a transação continuar ativa. Não há `catch (Exception)` genérico.

## GitHub Pages e screenshots

A vitrine estática está pronta na pasta [`docs`](docs). Os espaços reservados para screenshots ficam na seção “Demonstração” de `docs/index.html`. Depois de capturar as telas reais da aplicação, salve as imagens em `docs/assets/` e substitua cada bloco `.screenshot-placeholder` por uma tag `<img>` conforme o comentário existente no HTML.

