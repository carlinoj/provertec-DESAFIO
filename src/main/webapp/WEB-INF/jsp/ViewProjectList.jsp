<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="fmt" uri="jakarta.tags.fmt" %>
<%@ page import="java.text.SimpleDateFormat" %>
<%@ page import="java.util.Date" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Lista de Projetos</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <style>
        a{color: white;}
        a:hover{text-decoration: underline!important;}
    </style>
</head>
<body>
    <div class="container">
        <h1 class="p-3">Lista de Projetos</h1>
        <form:form>
            <table class="table table-bordered" aria-describedby="Lista de Projetos">
                <thead>
                    <tr>
                        <th>Nome</th>
                        <th>Data de Início</th>
                        <th>Gerente Responsável</th>
                        <th>Previsão de Término</th>
                        <th>Término Real</th>
                        <th>Orçamento</th>
                        <th>Descrição</th>
                        <th>Risco</th>
                        <th>Status</th>
                        <th>Editar</th>
                        <th>Deletar</th>
                    </tr>
                </thead>
                <tbody>
                    <c:forEach var="project" items="${projectList}">
                        <tr>
                            <td>${project.nome}</td>
                            <td><fmt:formatDate     value="${project.inicio}"       pattern="dd/MM/yyyy" /></td>
                            <td>${project.gerente}</td>
                            <td><fmt:formatDate     value="${project.prevFim}"      pattern="dd/MM/yyyy" /></td>
                            <td><fmt:formatDate     value="${project.realFim}"      pattern="dd/MM/yyyy" /></td>
                            <td><fmt:formatNumber   value="${project.orcamento}"    type="currency" currencyCode="BRL" /></td>
                            <td>${project.descricao}</td>
                            <td>${project.risco}</td>
                            <td>${project.status}</td>
                            <td>
                                <a  href="/editProject/${project.id}" class="btn btn-warning" title="Editar">
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-pencil-square" viewBox="0 0 16 16">
                                        <path d="M15.502 1.94a.5.5 0 0 1 0 .706L14.459 3.69l-2-2L13.502.646a.5.5 0 0 1 .707 0l1.293 1.293zm-1.75 2.456-2-2L4.939 9.21a.5.5 0 0 0-.121.196l-.805 2.414a.25.25 0 0 0 .316.316l2.414-.805a.5.5 0 0 0 .196-.12l6.813-6.814z"/>
                                        <path fill-rule="evenodd" d="M1 13.5A1.5 1.5 0 0 0 2.5 15h11a1.5 1.5 0 0 0 1.5-1.5v-6a.5.5 0 0 0-1 0v6a.5.5 0 0 1-.5.5h-11a.5.5 0 0 1-.5-.5v-11a.5.5 0 0 1 .5-.5H9a.5.5 0 0 0 0-1H2.5A1.5 1.5 0 0 0 1 2.5v11z"/>
                                    </svg>
                                </a>
                            </td>
                            <td>
                                <a href="/delete/${project.id}" class="btn btn-danger" title="Excluir" ${(project.status eq 'iniciado' || project.status eq 'em andamento' || project.status eq 'encerrado') ? 'disabled' : ''}>
                                    <svg xmlns="http://www.w3.org/2000/svg" width="16" height="16" fill="currentColor" class="bi bi-x-square" viewBox="0 0 16 16">
                                        <path d="M14 1a1 1 0 0 1 1 1v12a1 1 0 0 1-1 1H2a1 1 0 0 1-1-1V2a1 1 0 0 1 1-1h12zM2 0a2 2 0 0 0-2 2v12a2 2 0 0 0 2 2h12a2 2 0 0 0 2-2V2a2 2 0 0 0-2-2H2z"/>
                                        <path d="M4.646 4.646a.5.5 0 0 1 .708 0L8 7.293l2.646-2.647a.5.5 0 0 1 .708.708L8.707 8l2.647 2.646a.5.5 0 0 1-.708.708L8 8.707l-2.646 2.647a.5.5 0 0 1-.708-.708L7.293 8 4.646 5.354a.5.5 0 0 1 0-.708z"/>
                                    </svg>
                                </a>
                            </td>
                        </tr>
                    </c:forEach>
                </tbody>
            </table>
        </form:form>

        <a href="/addProject" class="btn btn-primary">Adicionar Projeto</a>
    </div>

    <!-- Mensagem-->
    <div aria-live="polite" aria-atomic="true" style="position: relative; min-height: 200px;">
        <div id="liveToast" class="toast" style="position: absolute; top: 0; right: 0;" data-delay="2000">
            <div class="toast-header">
                <strong class="mr-auto">Desafio</strong>
                <button type="button" class="ml-2 mb-1 close" data-dismiss="toast" aria-label="Close">
                    <span aria-hidden="true">&times;</span>
                </button>
            </div>
            <div class="toast-body">
            </div>
        </div>
    </div>

    <script th:inline="javascript">
        window.onload = function() {

            let msg = "${message}";
            let msgCompleta = "";
            console.log(msg);
            switch (msg) {
                case "Save Success":
                    msgCompleta = "Projeto criado com sucesso!";
                    break;
                case "Delete Success":
                    msgCompleta = "Projeto deletado com sucesso!";
                    break;
                case "Delete Failure":
                    msgCompleta = "Não conseguimos deletar seu projeto... um erro aconteceu!";
                    break;
                case "Edit Success":
                    msgCompleta = "Projeto salvo!";
                    break;
            }

            if(msgCompleta != ""){
                $(".toast-body").html(msgCompleta);
                $('#liveToast').toast('show')
            }

        }
    </script>
</body>
</html>