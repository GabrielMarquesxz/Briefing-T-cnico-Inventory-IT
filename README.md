# Inventory-IT

Sistema web para gerenciamento de laboratórios e equipamentos de TI, desenvolvido em Java utilizando Servlets, JSP, JPA/Hibernate e banco de dados H2.

O projeto permite controlar em qual laboratório cada equipamento está alocado, realizando operações de cadastro, edição, consulta e exclusão por meio de uma interface web responsiva.

---

## 📌 Sobre o Projeto

O **Inventory-IT** foi desenvolvido como solução para um desafio de gerenciamento de inventário de TI.

O sistema possui duas entidades principais:

- **Laboratório**
- **Equipamento**

Todo equipamento deve obrigatoriamente estar associado a um laboratório.

Além dos requisitos principais do desafio, foram implementadas funcionalidades adicionais, como edição, exclusão, busca de equipamentos e tratamento de integridade entre os registros.

---

## 🔗 Repositório

GitHub:

https://github.com/GabrielMarquesxz/Briefing-T-cnico-Inventory-IT

---

## ✅ Funcionalidades

### Laboratórios

- Cadastrar laboratório
- Listar laboratórios cadastrados
- Editar laboratório
- Excluir laboratório
- Validação antes da exclusão
- Impedir exclusão de laboratório que ainda possui equipamentos vinculados
- Exibição de mensagens de sucesso e erro

### Equipamentos

- Cadastrar equipamento
- Listar equipamentos
- Editar equipamento
- Excluir equipamento
- Associar equipamento a um laboratório
- Exibir o laboratório responsável por cada equipamento

### Sistema de Busca

A tela de equipamentos possui um filtro que permite realizar buscas por:

- Número de série
- Tipo do equipamento
- Nome do laboratório
- Bloco do laboratório

A pesquisa aceita também valores parciais.

Exemplo:

```text
PC
```

pode localizar equipamentos como:

```text
PC-001
PC-002
PC-LAB-03
```

---

## 🔗 Relacionamento entre Entidades

O sistema utiliza um relacionamento **Many-to-One** entre `Equipamento` e `Laboratorio`.

Isso significa que:

```text
Laboratório
    │
    ├── Equipamento 1
    ├── Equipamento 2
    ├── Equipamento 3
    └── ...
```

Um laboratório pode possuir vários equipamentos, enquanto cada equipamento pertence a um único laboratório.

No código:

```java
@ManyToOne(fetch = FetchType.LAZY)
@JoinColumn(name = "laboratorio_id", nullable = false)
private Laboratorio laboratorio;
```

O campo `laboratorio_id` é obrigatório.

---

## 🛡️ Integridade dos Dados

O sistema impede que um laboratório seja excluído enquanto existirem equipamentos associados a ele.

Por exemplo:

```text
Laboratório de Informática
        │
        ├── PC-001
        ├── PC-002
        └── Projetor-01
```

Ao tentar excluir esse laboratório, o sistema bloqueia a operação e informa ao usuário que os equipamentos devem ser removidos ou transferidos antes.

Isso evita registros inconsistentes no banco de dados.

---

## 🛠️ Tecnologias Utilizadas

### Back-end

- Java 21
- Jakarta Servlet
- Jakarta Persistence API - JPA
- Hibernate ORM
- Maven

### Front-end

- JSP
- JSTL
- HTML5
- Bootstrap 5

### Banco de Dados

- H2 Database

### Servidor

- Apache Tomcat 11

---

## 📦 Principais Dependências

O projeto utiliza as seguintes dependências Maven:

| Tecnologia | Versão |
|---|---|
| Java | 21 |
| Jakarta Servlet API | 6.1.0 |
| JSTL API | 3.0.0 |
| JSTL Implementation | 3.0.1 |
| Hibernate ORM | 6.4.4.Final |
| H2 Database | 2.2.224 |
| Bootstrap | 5.3.0 |

---

## 📁 Estrutura do Projeto

```text
inventory-it/
│
├── src/
│   └── main/
│       │
│       ├── java/
│       │   └── br/
│       │       └── com/
│       │           └── inventory/
│       │               │
│       │               ├── dao/
│       │               │   ├── EquipamentoDAO.java
│       │               │   └── LaboratorioDAO.java
│       │               │
│       │               ├── model/
│       │               │   ├── Equipamento.java
│       │               │   └── Laboratorio.java
│       │               │
│       │               ├── servlet/
│       │               │   ├── EquipamentoServlet.java
│       │               │   └── LaboratorioServlet.java
│       │               │
│       │               └── util/
│       │                   └── JPAUtil.java
│       │
│       ├── resources/
│       │   └── META-INF/
│       │       └── persistence.xml
│       │
│       └── webapp/
│           ├── index.jsp
│           ├── laboratorios.jsp
│           ├── novo-laboratorio.jsp
│           ├── equipamentos.jsp
│           └── novo-equipamento.jsp
│
├── .gitignore
├── pom.xml
└── README.md
```

---

## 🧱 Organização da Aplicação

O projeto foi dividido em diferentes responsabilidades.

### Model

Contém as entidades JPA responsáveis pela representação dos dados.

```text
Laboratorio.java
Equipamento.java
```

---

### DAO

Responsável pela comunicação com o banco de dados.

```text
LaboratorioDAO.java
EquipamentoDAO.java
```

Os DAOs realizam operações como:

```text
salvar
listar
buscar
filtrar
excluir
```

---

### Servlet

Responsável por receber as requisições HTTP e controlar o fluxo da aplicação.

```text
LaboratorioServlet.java
EquipamentoServlet.java
```

Os Servlets recebem os dados enviados pelas páginas JSP, utilizam os DAOs e encaminham os resultados novamente para a interface.

---

### JSP

Responsável pela interface exibida no navegador.

O projeto utiliza JSP em conjunto com JSTL para renderização dinâmica das informações.

Exemplo:

```jsp
<c:forEach var="lab" items="${laboratorios}">
    ...
</c:forEach>
```

---

## 🗄️ Configuração do Banco de Dados

O projeto utiliza o banco H2 em memória.

Configuração utilizada:

```text
jdbc:h2:mem:inventorydb;DB_CLOSE_DELAY=-1
```

Usuário:

```text
sa
```

Senha:

```text
vazia
```

O Hibernate está configurado para atualizar automaticamente a estrutura das tabelas:

```xml
<property
    name="hibernate.hbm2ddl.auto"
    value="update" />
```

### Observação

Como o H2 está configurado em memória, os dados não são destinados à persistência permanente.

Ao encerrar completamente o servidor/JVM, os registros podem ser perdidos.

Essa configuração é adequada para desenvolvimento, testes e demonstração do projeto.

---

## ▶️ Como Executar o Projeto

### Pré-requisitos

Antes de executar, é necessário possuir:

- JDK 21
- Maven
- Apache Tomcat 11
- Eclipse IDE ou outra IDE compatível com projetos Maven Web

---

### 1. Clone o repositório

```bash
git clone https://github.com/GabrielMarquesxz/Briefing-T-cnico-Inventory-IT.git
```

Entre na pasta:

```bash
cd Briefing-T-cnico-Inventory-IT
```

---

### 2. Baixe as dependências

Execute:

```bash
mvn clean package
```

O Maven realizará o download das dependências e gerará:

```text
target/inventory-it.war
```

---

### 3. Executando pelo Eclipse

Importe o projeto como:

```text
File
→ Import
→ Maven
→ Existing Maven Projects
```

Selecione a pasta do projeto.

Depois configure o Apache Tomcat 11.

Para executar:

```text
Botão direito no projeto
→ Run As
→ Run on Server
```

Selecione o Tomcat 11.

---

## 🌐 Acessando a Aplicação

Com o servidor executando, acesse:

```text
http://localhost:8080/inventory-it/
```

A página inicial possui acesso às duas principais áreas do sistema:

```text
Gerenciar Laboratórios
Gerenciar Equipamentos
```

Também é possível acessar diretamente:

### Laboratórios

```text
http://localhost:8080/inventory-it/laboratorios
```

### Equipamentos

```text
http://localhost:8080/inventory-it/equipamentos
```

---

## 🔍 Exemplo de Fluxo de Uso

### 1. Cadastrar um laboratório

Exemplo:

```text
Nome: Laboratório de Informática 1
Bloco: Bloco A
```

### 2. Cadastrar um equipamento

Exemplo:

```text
Número de Série: PC-001
Tipo: Computador
Laboratório: Laboratório de Informática 1
```

### 3. Consultar os equipamentos

O sistema exibirá:

```text
PC-001 | Computador | Laboratório de Informática 1 - Bloco A
```

### 4. Pesquisar

No campo de pesquisa, digite:

```text
Computador
```

ou:

```text
Bloco A
```

ou:

```text
PC-001
```

O sistema retornará os equipamentos correspondentes.

---

## ⚠️ Regra de Exclusão de Laboratórios

Caso um laboratório possua equipamentos vinculados, sua exclusão será bloqueada.

O sistema exibirá uma mensagem informando que existem equipamentos associados ao laboratório.

Para excluí-lo será necessário primeiro:

1. excluir os equipamentos vinculados; ou
2. editar os equipamentos e transferi-los para outro laboratório.

Depois disso, o laboratório poderá ser excluído normalmente.

---

## 💡 Funcionalidades Adicionais

Além do fluxo básico solicitado pelo desafio, o projeto possui:

- Edição de laboratórios
- Exclusão de laboratórios
- Edição de equipamentos
- Exclusão de equipamentos
- Busca dinâmica de equipamentos
- Busca por múltiplos atributos
- Tratamento de integridade referencial
- Mensagens amigáveis de erro
- Confirmação antes de exclusões
- Interface responsiva com Bootstrap
- Página inicial para navegação

---

## 🧪 Testes Manuais Realizados

Foram testados os seguintes fluxos:

- Cadastro de laboratório
- Listagem de laboratórios
- Edição de laboratório
- Exclusão de laboratório vazio
- Bloqueio da exclusão de laboratório com equipamentos
- Cadastro de equipamento
- Associação entre equipamento e laboratório
- Listagem de equipamentos
- Edição de equipamento
- Exclusão de equipamento
- Busca por número de série
- Busca por tipo
- Busca por laboratório
- Busca por bloco
- Reinicialização da aplicação no Tomcat

---

## 📚 Conceitos Aplicados

Durante o desenvolvimento foram utilizados conceitos como:

- Programação Orientada a Objetos
- Persistência de dados
- JPA
- Hibernate ORM
- Relacionamento entre entidades
- Chave estrangeira
- Integridade referencial
- DAO Pattern
- Servlets
- JSP
- JSTL
- Requisições GET e POST
- Arquitetura em camadas
- Maven
- Desenvolvimento de aplicações Web Java

---

## 📄 Licença

Projeto desenvolvido para fins acadêmicos e educacionais.