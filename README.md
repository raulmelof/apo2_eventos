# Sistema de Gerenciamento de Eventos - ENCOAD

![Java](https://img.shields.io/badge/Java-8%2B-blue.svg?style=for-the-badge&logo=java)
![Servlet](https://img.shields.io/badge/Java%20Servlet-4.0-orange.svg?style=for-the-badge)
![JSP](https://img.shields.io/badge/JSP-2.3-orange.svg?style=for-the-badge)
![MySQL](https://img.shields.io/badge/MySQL-8.0-blue.svg?style=for-the-badge&logo=mysql)
![Status](https://img.shields.io/badge/Status-Concluído-brightgreen.svg?style=for-the-badge)

## 📖 Visão Geral

O ENCOAD é uma aplicação web full-stack para gerenciamento de eventos, desenvolvida como projeto de estudo para demonstrar competências em **Java para Web**. A plataforma simula um portal para um congresso acadêmico, com um fluxo completo para participantes e um painel administrativo robusto para a gestão do conteúdo.

O foco foi a construção de uma **arquitetura back-end sólida e segura**, com interações de front-end dinâmicas e assíncronas, refletindo práticas de desenvolvimento web modernas.

---

## ✨ Funcionalidades Principais

### 👤 Fluxo do Participante
- **Jornada Completa:** O usuário pode se cadastrar, fazer login, navegar pela programação, inscrever-se em palestras, visualizar seu perfil com as inscrições, obter um QR Code para check-in e, após a validação da presença, acessar e visualizar seus certificados.
- **Experiência Dinâmica:** A interface é atualizada em tempo real sem recarregar a página, graças ao uso intensivo de **AJAX** para ações como inscrições e carregamento de listas.
- **Segurança:** Acesso às páginas de perfil e certificados protegido por um sistema de autenticação baseado em sessão.

###  administrative Panel
- **Controle Total:** Uma área administrativa (`/admin`) protegida por um filtro de autorização, permitindo o gerenciamento completo do evento.
- **Gerenciamento de Entidades (CRUD):** Interfaces para criar, visualizar, atualizar e desativar/deletar todos os dados essenciais: Eventos, Palestras, Usuários (com diferentes níveis), Palestrantes e Colaboradores.
- **Ferramenta de Check-in:** Uma página dedicada que utiliza a câmera do dispositivo para escanear QR Codes dos participantes, registrando a presença de forma instantânea e automatizando a liberação de certificados.

---

## 🏗️ Arquitetura e Padrões de Projeto

A aplicação foi estruturada seguindo o padrão **MVC (Model-View-Controller)** para garantir a separação de responsabilidades e alta manutenibilidade.

`Navegador (JSP com AJAX)` -> **[ Camada de Controle (Servlets & Filters) ]** -> `[ Camada de Acesso a Dados (DAO) ]` -> `Banco de Dados MySQL`

1.  **Apresentação (View):** Construída com **JSP** e **Bootstrap 5**. Os JSPs atuam como templates, e o conteúdo é, em sua maioria, renderizado no cliente por **JavaScript (JQuery)**, que consome os dados de endpoints JSON fornecidos pelo back-end.

2.  **Controle (Controller):** Implementada com **Java Servlets** e **Filters**.
    - **Servlets:** Atuam como endpoints para as requisições, orquestrando a lógica de negócio. Alguns servem dados (`...JsonServlet`), enquanto outros manipulam dados (`...Servlet`).
    - **Filters:** Interceptam requisições para implementar lógicas transversais, como a autenticação (`AutenticaFilter`) e a autorização (`AdminFilter`).

3.  **Modelo e Acesso a Dados (Model & DAO):**
    - **Model:** Classes Java (POJOs) que espelham a estrutura do banco de dados.
    - **DAO (Data Access Object):** Padrão de projeto utilizado para abstrair e centralizar toda a lógica de persistência de dados. Cada DAO é responsável por uma entidade, contendo o código **JDBC** e as queries SQL.

---

## 🔌 Principais Endpoints da Aplicação

| Servlet | Método | Rota | Descrição |
| :--- | :--- | :--- | :--- |
| `UsuarioServlet` | POST | `/UsuarioServlet` | Gerencia o CRUD de usuários e o cadastro público. |
| `AutenticaServlet`| POST | `/AutenticaServlet`| Processa o login e cria a sessão do usuário. |
| `InscricaoServlet`| POST | `/InscricaoServlet` | Realiza a inscrição de um usuário em uma palestra. |
| `CheckinServlet` | POST | `/admin/CheckinServlet`| Valida o QR Code e registra a presença. |
| `QRCodeServlet` | GET | `/QRCodeServlet` | Gera e serve a imagem do QR Code do usuário logado. |
| `PalestraJsonServlet` | GET | `/PalestraJsonServlet`| Fornece a lista de palestras em formato JSON. |
| `MinhasInscricoesJsonServlet` | GET | `/MinhasInscricoesJsonServlet` | Fornece a lista de inscrições do usuário logado. |

---

## 🛠️ Tecnologias e Ferramentas

- **Back-end:** Java 8+, Servlets 4.0, JSP 2.3, JDBC
- **Servidor de Aplicação:** Apache Tomcat 9.0
- **Front-end:** HTML5, CSS3, Bootstrap 5, JavaScript, JQuery
- **Banco de Dados:** MySQL
- **Bibliotecas:** Gson (JSON), ZXing (QR Code), html5-qrcode (JS)
- **IDE:** Eclipse IDE for Enterprise Java and Web Developers

---

## 🚀 Como Executar

**1. Pré-requisitos:**
   - Java JDK 8+, MySQL Server, Apache Tomcat 9, Eclipse IDE (EE).

**2. Passos de Configuração:**
   1. Clone o repositório.
   2. Importe o projeto no Eclipse como "Existing Projects into Workspace".
   3. Crie um schema `bd_apo2` no MySQL e execute o script SQL para criar as tabelas.
   4. Configure a conexão em `src/main/java/database/DBConnection.java`.
   5. Configure o servidor Tomcat no Eclipse e adicione o projeto.
   6. Execute o projeto com `Run As > Run on Server`.
