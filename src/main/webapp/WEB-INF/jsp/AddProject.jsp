<%@ page language="java" contentType="text/html; UTF-8" pageEncoding="UTF-8" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
<html lang="pt-br">
<head>
    <meta charset="UTF-8">
    <title>Cadastro de Projetos</title>
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css" integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js" integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj" crossorigin="anonymous"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js" integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct" crossorigin="anonymous"></script>
    <style>
        .row{
            padding: 5px!important;
        }
    </style>
</head>
<body>
    <div class="container">
        <h1 class="p-3">Cadastro de Projetos</h1>
        <form:form action="/saveProject" method="post" modelAttribute="project">
            <div class="row">
                <label class="col-md-3 text-right col-form-label" for="nome">Nome:</label>
                <form:input path="nome" id="nome" type="text" class="form-control col-md-6" required="required"/>
            </div>
            <div class="row">
                <label class="col-md-3 text-right col-form-label" for="inicio">Data início:</label>
                <form:input path="inicio" id="inicio" type="date" class="form-control col-md-2" required="required"/>
            </div>
            <div class="row">
                <label class="col-md-3 text-right col-form-label" for="gerente">Gerente responsável:</label>
                <form:input path="gerente" id="gerente" type="text" class="form-control col-md-6" required="required"/>
            </div>
            <div class="row">
                <label class="col-md-3 text-right col-form-label" for="prevFim">Previsão de término:</label>
                <form:input path="prevFim" id="prevFim" type="date" class="form-control col-md-2" required="required"/>
            </div>
            <div class="row">
                <label class="col-md-3 text-right col-form-label" for="orcamento">Orçamento total em R$:</label>
                <form:input path="orcamento" id="orcamento" type="text" class="form-control col-md-3" required="required"/>
            </div>
            <div class="row">
                <label class="col-md-3 text-right col-form-label" for="descricao">Descrição:</label>
                <form:input path="descricao" id="descricao" type="text" class="form-control col-md-9" required="required"/>
            </div>
            <div class="row">
                <label class="col-md-3 text-right col-form-label" for="risco">Risco:</label>
                <div class="col-md-9">
                    <form:select path="risco" id="risco" class="form-control col-md-3" required="required">
                        <form:options items="${riscoOptions}" />
                    </form:select>
                </div>
            </div>

            <form:hidden path="status" id="status" value="em análise"/>

            <div class="row">
                <form:button type="submit" class="btn btn-success btn-lg btn-block">SALVAR PROJETO</form:button>
            </div>

        </form:form>
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