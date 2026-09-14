# Inventory-IT

O Inventory-IT é uma aplicação web acadêmica para o gerenciamento de laboratórios e equipamentos. O sistema permite registrar os laboratórios disponíveis, cadastrar equipamentos e associar cada equipamento ao laboratório em que está localizado.

## Objetivo

Demonstrar o desenvolvimento de uma aplicação Java Web utilizando Servlets, JSP, persistência com JPA/Hibernate e banco de dados H2, com separação de responsabilidades entre interface, controle e acesso a dados.

## Funcionalidades

- Cadastro de laboratórios com nome e bloco.
- Listagem dos laboratórios cadastrados.
- Cadastro de equipamentos com número de série e tipo.
- Seleção do laboratório no cadastro do equipamento.
- Listagem dos equipamentos com o respectivo laboratório associado.
- Redirecionamento após os cadastros pelo padrão POST-Redirect-GET.

## Tecnologias

- Java 17
- Jakarta Servlet 6
- Jakarta Persistence 3.1
- Hibernate ORM 6.4
- H2 Database 2.2
- JSP e JSTL 3
- Bootstrap 5
- Maven
- Apache Tomcat 11

## Arquitetura

O fluxo principal da aplicação segue a estrutura:

```text
Navegador → Servlet → DAO → JPA/Hibernate → H2
```

- **JSP e Bootstrap:** interface apresentada no navegador.
- **Servlets:** processamento das requisições HTTP e controle da navegação.
- **DAOs:** operações de persistência dos laboratórios e equipamentos.
- **JPA/Hibernate:** mapeamento e gerenciamento das entidades.
- **H2:** armazenamento dos dados em memória durante a execução.

## Estrutura principal

```text
Inventory-IT/
├── pom.xml
├── src/main/java/br/com/inventory/
│   ├── dao/
│   │   ├── JPAUtil.java
│   │   ├── LaboratorioDAO.java
│   │   └── EquipamentoDAO.java
│   ├── modelo/
│   │   ├── Laboratorio.java
│   │   └── Equipamento.java
│   └── servlet/
│       ├── LaboratorioServlet.java
│       └── EquipamentoServlet.java
├── src/main/resources/META-INF/
│   └── persistence.xml
├── src/main/webapp/
│   ├── index.jsp
│   ├── laboratorios.jsp
│   ├── novo-equipamento.jsp
│   └── equipamentos.jsp
└── docs/
    └── index.html
```

## Como executar no Eclipse e Tomcat 11

### Requisitos

- JDK 17 ou superior.
- Eclipse IDE for Enterprise Java and Web Developers.
- Apache Tomcat 11.
- Maven integrado ao Eclipse.

### Importação do projeto

1. No Eclipse, acesse `File > Import`.
2. Selecione `Maven > Existing Maven Projects`.
3. Escolha a pasta deste repositório.
4. Confirme o arquivo `pom.xml` e clique em `Finish`.
5. Se necessário, clique com o botão direito no projeto e selecione `Maven > Update Project`.

### Execução

1. Cadastre o Tomcat 11 em `Window > Preferences > Server > Runtime Environments`.
2. Clique com o botão direito no projeto e selecione `Run As > Run on Server`.
3. Escolha o servidor Tomcat 11 e conclua a configuração.
4. Acesse `http://localhost:8080/Inventory-IT-Atividade/`.

Para gerar o WAR pela linha de comando, execute:

```bash
mvn clean package
```

O pacote será criado em `target/Inventory-IT-Atividade.war`.

## Página de apresentação

A apresentação do projeto está disponível no [GitHub Pages](https://gabrielmarquesxz.github.io/Briefing-T-cnico-Inventory-IT/).

