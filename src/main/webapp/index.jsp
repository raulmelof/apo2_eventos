<%@ page import="model.Usuario" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="pt-br">

<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Semana do Conhecimento</title>
    <link rel="icon" href="https://novaextranet.crasp.gov.br/encoad/_lib/file/img/favicon.ico" type="image/x-icon">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/css/bootstrap.min.css" rel="stylesheet">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.3/dist/js/bootstrap.bundle.min.js"></script>
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.5.0/css/all.min.css">
    <script src="https://cdn.jsdelivr.net/npm/sweetalert2@11"></script>
    <link href="https://cdn.datatables.net/2.2.2/css/dataTables.dataTables.css" rel="stylesheet">
	<script src="https://code.jquery.com/jquery-3.7.1.js"></script>
	<script src="https://cdn.datatables.net/2.2.2/js/dataTables.js"></script>
    <style type="text/css">
    
.banner{
    position: relative;
    height: 100%;
    flex-shrink: 0;
}



.navbar {

    background: black;
    height: 5.5%;
    position: -webkit-sticky;
    position: sticky;
    top: 0;
    z-index: 1000;

}

#corpo {
    padding-left: 15%;
    padding-right: 15%;
    align-items: center;
    justify-content: center;
    text-align: center;
}

.textoo {

    padding-top: 3vh;
    padding-left: 10%;
    padding-right: 10%;
    height: 50%;

}

.h1 {
    color: white;
    font-size: 2rem;

}

#texto_speakers {
    margin-bottom: 1.5rem;
}

#vejamais {
    margin-top: 1.5rem;
}


.container-fluid {
    padding-left: 15%;
    padding-right: 15%;
}

.navbar-brand {

    color: rgb(255, 255, 255);
    font-weight: 700;

}

.nav-link {

    font-weight: 700;
    color: rgba(255, 255, 255, 0.87);

}

.btn {
    border-radius: 1.2rem;
    height: 4rem;
    width: 100%;
    display: flex;
    align-items: center;
    justify-content: center;
    text-align: center;
}

#texto_botao {
    text-decoration: none;
    color: white;
    font-weight: 700;
    font-size: 1.3rem;
}

#botao1 {
    background-color: #000;
}

#botao2 {
    background-color: #0571af;
}

#botao3 {
    background-color: #0b9236;
}


#speakers {

    background: linear-gradient(to bottom right, #3333ff 0%, #ffccff 100%);
    width: 100%;
    padding-top: 2vh;
    padding-left: 15%;
    padding-right: 15%;
    padding-bottom: 0.5vh;
    scroll-margin-top: 3.8rem;

}

.card {

    width: 100%;
    height: 100%;
    transition: transform 0.5s ease, filter 0.5s ease;
    object-fit: cover;

}

.img-container {
    width: 100%;
    max-width: 15.625rem;
    overflow: hidden;
    position: relative;
}

.img-container img {
    border: none;
    width: 100%;
    display: block;
    transition: transform 0.5s ease, filter 0.5s ease;
    border-radius: 0;
    object-fit: cover;
}

.img-container:hover img {
    transform: scale(1.1);
    filter: grayscale(100%);
}

.overlay {
    position: absolute;
    bottom: 0;
    left: 0;
    width: 100%;
    background: rgba(0, 51, 102, 0.85);
    color: white;
    text-align: center;
    padding: 10px;
    transform: translateY(100%);
    transition: transform 0.4s ease;
}

.img-container:hover .overlay {
    transform: translateY(0);
}

.overlay h5 {
    font-size: 1rem;
    font-weight: bold;
    margin: 0;
}

.overlay p {
    margin: 5px 0;
    font-size: 0.9rem;
}

.overlay a {
    color: white;
    font-size: 1.2rem;
    margin-top: 5px;
    display: inline-block;
}

#programacao {
    padding-left: 15%;
    padding-right: 15%;
    scroll-margin-top: 5rem;
}

#infoprogramacao {
    margin-top: 5vh;
}

.title_programacao {
    font-size: 2rem;
    font-weight: 700;
    color: #183d90;
}

#programacao_texto1 {
    font-size: 1.2rem;
    color: #183d90;
}

#programacao_texto2 {
    font-weight: bolder;
    color: #256f67;
    font-size: 1.2rem;
}

#programacao_texto3 {
    font-size: 1rem;
    font-weight: 900;
    color: #183d90;
}

.dias_palestras {
    height: 2.2em;
    border-radius: 1em;
    background: linear-gradient(90deg, #000000 1.1%, #04fde9 100%);
    color: White;
    display: flex;
    align-items: center;
    padding-left: 2rem;
    margin-bottom: .5rem;
}

.palestra {
    all: unset;
    display: flex;
    align-items: center;
    gap: 1rem;
    cursor: pointer;
    margin-bottom: 1rem;
    flex-wrap: wrap;
}

.palestra:hover{
    color:  #0a58ca;;
}

.h2{
    font-size: 1rem;
    font-weight: 600;
    margin-bottom: 0;
}

.h3{
    font-size: 1.2rem;
    font-weight: 600;
    margin-bottom: 0;
}


.hora_palestra{
    background: #256f67;
    width: 9rem;
    display: flex;
    align-items: center;
    justify-content: center;
    border-radius: 1rem;
    color: white;
    height: 1.5rem;
    flex-shrink: 0;
}



#formsinscricao{
    text-align: center;
    padding-left: 15%;
    padding-right: 15%;
    scroll-margin-top: 1rem;
}

.row {
    margin-bottom: 3vh;
    text-align: start;
}

#btnFinalizar{
    border-radius: 2rem;
    margin-left: 30%;
    margin-right: 30%;
    width: 40%;
    height: 3rem;
}

#btnFinalizar:hover{
    background-color: #0b9236;
}



.blocos_img{
    display: flex;
    justify-content: center;
}

.h4{
    color: #183d90;
    font-size: 1.2rem;
    font-weight: 700;
    text-align: center;
}

#logo{
    max-width: 15rem;
}

#apoiadores{
    max-width: 37.5rem;
    margin: auto;
}

.apoiadoresimg{
    max-height: 12.5rem;
}

.carousel-indicators{
    position: static;
    margin-top: 10px;
}


.redessociais{
    justify-content: center;
    padding-left: 45%;
    padding-right: 45%;
    margin-bottom: 0;
}

footer{
    margin-top: 3rem;
    text-align: center;
}

i {
    font-size: 28px;
    margin: 0 10px;
}

.formscertificado{
    padding-left: 45%;
    padding-right: 45%;
}

.botaocertificado{
    padding-left: 35%;
    padding-right: 35%;
}

.buttoncertificado{
    padding: 3rem;
}


.btn-inscrever {
    width: auto !important;
    height: auto !important;
    padding: 0.375rem 0.75rem;
    font-size: 1rem;
    display: inline-block;
    vertical-align: middle;
}


@media (max-width: 768px) {

    .card {

        width: 10rem;


    }

    .textoo {
        font-size: smaller;
    }

    #speakers .col-sm-6:nth-child(n+5) {
        display: none !important;
    }

    .hora_palestra {
        width: auto;
        padding: 0 0.75rem;
        font-size: 0.8rem;
    }

    .titulo_palestra {
        flex: 1;
    }

    .h3 {
        font-size: 1rem;
    }

    .h2 {
        font-size: 0.9rem;
    }

    #admpro{
        max-width: 20rem;
    }

    .redessociais{
        padding-left: 25%;
        padding-right: 25%;
    }

    .formscertificado{
        padding-left: 15%;
        padding-right: 15%;
    }

    .botaocertificado{
        padding-left: 15%;
        padding-right: 15%;
    }

    .buttoncertificado{
        padding: 1rem;
    }

}

@media (max-width: 950px){

    .hora_palestra {
        width: auto;
        padding: 0 0.75rem;
        font-size: 0.8rem;
    }

    .titulo_palestra {
        flex: 1;
    }

    .h3 {
        font-size: 1rem;
    }

    .h2 {
        font-size: 0.9rem;
    }

    .formscertificado{
        padding-left: 15%;
        padding-right: 15%;
    }

    .botaocertificado{
        padding-left: 15%;
        padding-right: 15%;
    }

    .buttoncertificado{
        padding: 1rem;
    }
    
    

}

    </style>
</head>

<body>
    <div id="carouselExampleSlidesOnly" class="carousel slide" data-bs-ride="carousel" data-bs-interval="3000">
        <div class="carousel-inner">
            <div class="carousel-item active banner">
                <img src="https://novaextranet.crasp.gov.br/encoad/_lib/file/img/banners/banner-site-ENCOAD-24(1).jpg"
                    class="d-block w-100" alt="...">
            </div>
        </div>
    </div>


    <jsp:include page="common/navbar.jsp" />


    <div id="corpo">
        <div class="textoo">
            <p>
                Muito tem se falado sobre como os conceitos e práticas associadas ao ESG vêm impactando o ecossistema de
                negócios e a sociedade em geral ao longo dos últimos anos. Agora, em 2024, o CRA-SP muda o foco e, por
                meio de
                seu maior evento anual, propõe uma nova abordagem e vivência prática sobre <b>como a Administração, como
                    ciência e profissão, pode impactar o ESG?</b></p>
        </div>

        <div class="textoo">
            <p>
                Com painéis, palestras e entrevistas, a 15ª edição do <b>Encontro do Conhecimento em Administração: “O
                    impacto da Administração no ESG”</b> discutirá como a Administração pode fazer a agenda ESG
                acontecer de
                fato,
                transformando as diversas iniciativas e boas intenções relacionadas ao meio-ambiente, ao social e à
                governança,
                <b>em planos de ações concretos nas estratégias e rotinas das organizações.</b>
            </p>
        </div>


        <div class="textoo">
            <p>Junte-se às pessoas que podem transformar o futuro dos negócios e da sociedade! Participe do <b>ENCOAD
                    2025</b>
            </p>
        </div>

        <div class="container my-4">
            <div class="ratio ratio-16x9" style="max-width: 960px; margin: 0 auto;">
                <iframe src="https://www.youtube.com/embed/CFzdFkkIe80?si=w2sVv_1gk64EqS2s" title="YouTube video"
                    allowfullscreen
                    allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture">
                </iframe>
            </div>
        </div>

        <div id="botoes" class="row">
            <div class="col-xl-4 d-flex justify-content-center align-items-center">
                <div id="botao1" type="button" class="btn btn-lg "><a id="texto_botao" href="#">24 E 25 DE SETEMBRO DE
                        2024</a></div>
            </div>
            <div class="col-xl-4 d-flex justify-content-center">
                <div id="botao2" type="button" class="btn btn-lg "><a id="texto_botao"
                        href="#programacao">PROGRAMAÇÃO</a></div>
            </div>
            <div class="col-xl-4 d-flex justify-content-center">
                <div id="botao3" type="button" class="btn btn-lg "><a id="texto_botao"
                        href="#formsinscricao">INSCREVA-SE</a>
                </div>
            </div>
        </div>
    </div>


    <div id="speakers">
	    <div id="texto_speakers" class="container-fluid text-center">
	        <p class="h1">Speakers</p>
	    </div>
	
	    <div class="row gy-4">
	        </div>
	
	    <div id="vejamais" class="container-fluid text-center">
	        <a class="h1" href="public/palestrantes.html">Veja +</a>
	    </div>
	</div>

    <!--  <div id="programacao">
        <div id="infoprogramacao" class="container-fluid text-center">
            <p class="title_programacao">Programação</p>
            <p id="programacao_texto1">Conheça as apresentações, preencha o formulário e inscreva-se!</p>
            <p id="programacao_texto3">Inscrições abertas</p>
        </div>
        <div class="dias_palestras">
            <p class="h2">24/09/2024 | TERÇA-FEIRA</p>
        </div>
        <button data-bs-toggle="collapse" data-bs-target="#conteudo_palestra" class="palestra">
            <div class="hora_palestra">
                <p class="h2">09h00 às 09h10</p>
            </div>
            <div class="titulo_palestra">
                <p class="h3">Abertura</p>
            </div>
        </button>

        <button data-bs-toggle="collapse" data-bs-target="#conteudo_palestra1" class="palestra">
            <div class="hora_palestra">
                <p class="h2">09h10 às 10h05</p>
            </div>
            <div class="titulo_palestra">
                <p class="h3">Painel | ESG: conceitos e contextos com a Administração</p>
            </div>
        </button>
        <div id="conteudo_palestra1" class="collapse">
            <p style="text-align: justify;color: black;"><strong>Carolina Costa</strong>| Chief Impact Officer - Stone
                CO, Conselheira de empresas e instituições, Professora</p>
            <p style="text-align: justify;color: black;"><strong>Rodrigo Brandão Fontoura</strong>| Consultor, Advogado
                e Professor na área de ESG no Setor Elétrico pela FIA</p>
            <p style="text-align: justify;color: black;"><strong>Denys Roman</strong>| Sócio fundador da blendON - ESG
                Services</p>
            <p style="text-align: justify;">
            <p>Faixa em parceria com:</p>
            <p><a href="https://crasp.gov.br/centro/site/grupos-de-excelencia/governanca--riscos-e-compliance"
                    target="_blank" rel="noopener"><strong>Grupo de Excelência em Governança, Riscos e Compliance do
                        CRA-SP </strong></a></p>
            <p><a href="https://crasp.gov.br/centro/site/grupos-de-excelencia/governanca-corporativa" target="_blank"
                    rel="noopener"><strong>Grupo de Excelência em Governança Corporativa </strong><strong>do
                        CRA-SP</strong></a></p>
            <p><a href="https://crasp.gov.br/centro/site/grupos-de-excelencia/negocios-de-energia" target="_blank"
                    rel="noopener"><strong>Grupo de Excelência em Negócios de Energia </strong><strong>do
                        CRA-SP</strong></a></p>
        </div>
    </div>-->
    
    <div id="programacao">
    	<div id="infoprogramacao" class="container-fluid text-center">
	        <p class="title_programacao">Programação</p>
	        <p id="programacao_texto1">Conheça as apresentações, preencha o formulário e inscreva-se!</p>
        </div>
    </div>



    <div id="formsinscricao">
        <br>
        <hr>
        <p class="title_programacao">Formulário de Inscrição</p>
        <hr>
        <form class="container" id="formCadastro" action="${pageContext.request.contextPath}/UsuarioServlet" method="post">

		    <input type="hidden" name="action" value="register">
		
		    <div class="row g-3">
		        <div class="col-md">
                    <label for="cpf" class="form-label">CPF:</label>
                    <input type="text" class="form-control" placeholder="CPF" name="cpf" id="cpf" required
                        maxlength="14" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}" title="Formato: XXX.XXX.XXX-XX">
                </div>
                <div class="col-md">
                    <label for="nome" class="form-label">Nome Completo:</label>
                    <input type="text" class="form-control" placeholder="Nome Completo" name="nome" id="nome" required>
                </div>
		    </div>
		    <div class="row g-3 mt-1">
		        <div class="col">
                    <label for="email" class="form-label">E-mail:</label>
                    <input type="email" class="form-control" placeholder="E-mail" name="email" id="email" required>
                </div>
                <div class="col-md">
                    <label for="emailConf" class="form-label">Confirme o e-mail:</label>
                    <input type="email" class="form-control" placeholder="Confirme o e-mail" name="emailConf"
                        id="emailConf" autocomplete="off" onpaste="return false;" spellcheck="false"
                        autocapitalize="none" required>
                </div>
		    </div>
		
		    <div class="row g-3 mt-1">
		        <div class="col-md">
		            <label for="senha" class="form-label">Crie uma Senha:</label>
		            <input type="password" class="form-control" name="senha" id="senha" required>
		        </div>
		        <div class="col-md">
		            <label for="senhaConf" class="form-label">Confirme a Senha:</label>
		            <input type="password" class="form-control" name="senhaConf" id="senhaConf" required>
		        </div>
		    </div>
		    <div class="row g-3 mt-1">
		        <div class="col-md">
                    <label for="celular" class="form-label">Celular:</label>
                    <input type="text" class="form-control" placeholder="Celular" name="celular" id="celular" required
                        maxlength="15" title="Formato: (11) 99999-9999" pattern="\(\d{2}\) \d{5}-\d{4}">
                </div>
		        <div class="col-md">
                    <label for="uf" class="form-label">Onde você reside (UF)?</label>
                    <select class="form-select" id="uf" name="uf" required>
                        <option disabled selected value>Selecione</option>
                        <option value="AC">Acre</option>
                        <option value="AL">Alagoas</option>
                        <option value="AP">Amapá</option>
                        <option value="AM">Amazonas</option>
                        <option value="BA">Bahia</option>
                        <option value="CE">Ceará</option>
                        <option value="DF">Distrito Federal</option>
                        <option value="ES">Espírito Santo</option>
                        <option value="GO">Goiás</option>
                        <option value="MA">Maranhão</option>
                        <option value="MT">Mato Grosso</option>
                        <option value="MS">Mato Grosso do Sul</option>
                        <option value="MG">Minas Gerais</option>
                        <option value="PA">Pará</option>
                        <option value="PB">Paraíba</option>
                        <option value="PR">Paraná</option>
                        <option value="PE">Pernambuco</option>
                        <option value="PI">Piauí</option>
                        <option value="RJ">Rio de janeiro</option>
                        <option value="RN">Rio Grande do Norte</option>
                        <option value="RS">Rio Grande do Sul</option>
                        <option value="RO">Rondônia</option>
                        <option value="RR">Roraima</option>
                        <option value="SC">Santa Catarina</option>
                        <option value="SP">São Paulo</option>
                        <option value="SE">Sergipe</option>
                        <option value="TO">Tocantins</option>
                        <option value="OP">Outro país</option>
                    </select>
                </div>
		    </div>
		    <div class="row g-3">
		        <div class="col-xl-6 col-md-12">
                    <label for="formacao" class="form-label">Qual é a sua formação?</label>
                    <select class="form-select" name="formacao" id="formacao" required>
                        <option disabled selected value>Selecione</option>
                        <option value="Profissional de Administração - Bacharel">Profissional de Administração -
                            Bacharel</option>
                        <option value="Profissional de Administração - Tecnólogo">Profissional de Administração -
                            Tecnólogo</option>
                        <option value="Profissional de Administração - Técnico">Profissional de Administração - Técnico
                        </option>
                        <option value="Profissional de outra área">Profissional de outra área</option>
                        <option value="Estudante de Administração - Curso Técnico">Estudante de Administração - Curso
                            Técnico</option>
                        <option value="Estudante de Administração - Curso Tecnólogo">Estudante de Administração - Curso
                            Tecnólogo</option>
                        <option value="Estudante de Administração - Bacharelado">Estudante de Administração -
                            Bacharelado</option>
                        <option value="Estudante de outra área">Estudante de outra área</option>
                    </select>
                </div>
		    </div>
		    <hr>
		
		    <button id="btnFinalizar" type="submit" class="btn btn-dark">Finalizar Inscrição</button>
		</form>
        <!--  <form class="container" action="${pageContext.request.contextPath}/UsuarioServlet" method="post">
            <div class="row g-3">
                <div class="col-md">
                    <label for="cpf" class="form-label">CPF:</label>
                    <input type="text" class="form-control" placeholder="CPF" name="cpf" id="cpf" required
                        maxlength="14" pattern="\d{3}\.\d{3}\.\d{3}-\d{2}" title="Formato: XXX.XXX.XXX-XX">
                </div>
                <div class="col-md">
                    <label for="nome" class="form-label">Nome Completo:</label>
                    <input type="text" class="form-control" placeholder="Nome Completo" name="nome" id="nome" required>
                </div>
            </div>
            <div class="row g-3 mt-1">
                <div class="col">
                    <label for="email" class="form-label">E-mail:</label>
                    <input type="email" class="form-control" placeholder="E-mail" name="email" id="email" required>
                </div>
                <div class="col-md">
                    <label for="emailConf" class="form-label">Confirme o e-mail:</label>
                    <input type="email" class="form-control" placeholder="Confirme o e-mail" name="emailConf"
                        id="emailConf" autocomplete="off" onpaste="return false;" spellcheck="false"
                        autocapitalize="none" required>
                </div>
            </div>
            <div class="row g-3 mt-1">
                <div class="col-md">
                    <label for="celular" class="form-label">Celular:</label>
                    <input type="text" class="form-control" placeholder="Celular" name="celular" id="celular" required
                        maxlength="15" title="Formato: (11) 99999-9999" pattern="\(\d{2}\) \d{5}-\d{4}">
                </div>
                <div class="col-md">
                    <label for="uf" class="form-label">Onde você reside (UF)?</label>
                    <select class="form-select" id="uf" name="uf" required>
                        <option disabled selected value>Selecione</option>
                        <option value="AC">Acre</option>
                        <option value="AL">Alagoas</option>
                        <option value="AP">Amapá</option>
                        <option value="AM">Amazonas</option>
                        <option value="BA">Bahia</option>
                        <option value="CE">Ceará</option>
                        <option value="DF">Distrito Federal</option>
                        <option value="ES">Espírito Santo</option>
                        <option value="GO">Goiás</option>
                        <option value="MA">Maranhão</option>
                        <option value="MT">Mato Grosso</option>
                        <option value="MS">Mato Grosso do Sul</option>
                        <option value="MG">Minas Gerais</option>
                        <option value="PA">Pará</option>
                        <option value="PB">Paraíba</option>
                        <option value="PR">Paraná</option>
                        <option value="PE">Pernambuco</option>
                        <option value="PI">Piauí</option>
                        <option value="RJ">Rio de janeiro</option>
                        <option value="RN">Rio Grande do Norte</option>
                        <option value="RS">Rio Grande do Sul</option>
                        <option value="RO">Rondônia</option>
                        <option value="RR">Roraima</option>
                        <option value="SC">Santa Catarina</option>
                        <option value="SP">São Paulo</option>
                        <option value="SE">Sergipe</option>
                        <option value="TO">Tocantins</option>
                        <option value="OP">Outro país</option>
                    </select>
                </div>
            </div>
            <hr>
            <div class="row g-3">
                <div class="col-xl-6 col-md-12">
                    <label for="formacao" class="form-label">Qual é a sua formação?</label>
                    <select class="form-select" name="formacao" id="formacao" required>
                        <option disabled selected value>Selecione</option>
                        <option value="Profissional de Administração - Bacharel">Profissional de Administração -
                            Bacharel</option>
                        <option value="Profissional de Administração - Tecnólogo">Profissional de Administração -
                            Tecnólogo</option>
                        <option value="Profissional de Administração - Técnico">Profissional de Administração - Técnico
                        </option>
                        <option value="Profissional de outra área">Profissional de outra área</option>
                        <option value="Estudante de Administração - Curso Técnico">Estudante de Administração - Curso
                            Técnico</option>
                        <option value="Estudante de Administração - Curso Tecnólogo">Estudante de Administração - Curso
                            Tecnólogo</option>
                        <option value="Estudante de Administração - Bacharelado">Estudante de Administração -
                            Bacharelado</option>
                        <option value="Estudante de outra área">Estudante de outra área</option>
                    </select>
                </div>
                <div class="col-xl-6 col-md-12">
                    <label for="registro" class="form-label">Possui registro do CRA-SP? <a
                            href="https://www.crasp.gov.br/crasp/site/registro-profissional/por-que-devo-me-registrar-"
                            target="_blank">Saiba mais</a></label>
                    <select class="form-select" name="registro" id="registro" required>
                        <option disabled selected value>Selecione</option>
                        <option value="1">SIM</option>
                        <option value="0">NÃO</option>
                    </select>
                </div>
            </div>
            <div class="row g-3 mt-1">
                <div class="col-xl-6 col-md-12">
                    <label for="comoSoube" class="form-label">Como soube do evento?</label>
                    <select class="form-select" name="comoSoube" id="comoSoube" required>
                        <option disabled selected value>Selecione</option>
                        <option value="Indicação de Amigos">Indicação de Amigos</option>
                        <option value="Indicação de Coordenadores ou Professores">Indicação de Coordenadores ou
                            Professores</option>
                        <option value="E-mail Marketing (convite)">E-mail Marketing (convite)</option>
                        <option value="Eventos realizados no CRA-SP">Eventos realizados no CRA-SP</option>
                        <option value="Portal do CRA-SP">Portal do CRA-SP</option>
                        <option value="Revista Administrador Profissional">Revista Administrador Profissional</option>
                        <option value="Redes Sociais do CRA-SP">Redes Sociais do CRA-SP</option>
                    </select>
                </div>
                <div class="col-xl-6 col-md-12">
                    <label for="primeiraVez" class="form-label">É a primeira vez que participa de um evento no
                        CRA-SP?</label>
                    <select class="form-select" name="primeiraVez" id="primeiraVez" required>
                        <option disabled selected value>Selecione</option>
                        <option value="1">SIM</option>
                        <option value="0">NÃO</option>
                    </select>
                </div>
            </div>
            <hr>
            <div class="mb-3">
                <label class="form-label">Quer receber conteúdos ligados à Administração? (Eventos, Revista, vídeos,
                    etc)</label><br>
                <label class="form-label">Termo de autorização de uso de dados - <a type="button" class="saibaMais"
                        data-bs-toggle="modal" data-bs-target="#exampleModal">Saiba mais</a>
                </label>
            </div>
            <div class="row justify-content-center text-center mb-3">
                <div class="col-auto">
                    <div class="form-check">
                        <input type="radio" class="form-check-input" id="termoAceita" name="termoUso" value="1"
                            required>Aceito
                        <label class="form-check-label" for="termoAceita"></label>
                    </div>
                </div>
                <div class="col-auto">
                    <div class="form-check">
                        <input type="radio" class="form-check-input" id="termoRejeita" name="termoUso" value="0"
                            required>Não aceito
                        <label class="form-check-label" for="termoRejeita"></label>
                    </div>
                </div>
            </div>
            <button id="btnFinalizar" type="submit" class="btn btn-dark">Finalizar</button>
        </form>-->
    </div>
    <br>
    <br>
    <div class="blocos_img" class="container-fluid">
        <a href="https://chat.whatsapp.com/KJFwDDlgMnMJei66UBCWMF" target="_blank">
            <img id="admpro" src="https://novaextranet.crasp.gov.br/encoad/_lib/file/img/admpro.jpg?20250430085346"
                alt="ADMPRO">
        </a>
    </div>
    <br>
    <br>
    <p class="h4">Realização</p>
    <br>
    <div class="blocos_img" class="container-fluid">
        <a href="https://www.crasp.gov.br/crasp/home/" target="_blank">
            <img id="logo" src="https://novaextranet.crasp.gov.br/encoad/_lib/file/img/logoCRA.svg"
                alt="Logotipo CRASP">
        </a>
    </div>
    <br>
    <br>
    <p class="h4">Apoiadores</p>
    <div id="apoiadores" class="carousel slide carousel-dark" data-bs-ride="carousel">

        <div class="carousel-indicators">
            <button type="button" data-bs-target="#apoiadores" data-bs-slide-to="0" class="active"></button>
            <button type="button" data-bs-target="#apoiadores" data-bs-slide-to="1"></button>
            <button type="button" data-bs-target="#apoiadores" data-bs-slide-to="2"></button>
            <button type="button" data-bs-target="#apoiadores" data-bs-slide-to="3"></button>
            <button type="button" data-bs-target="#apoiadores" data-bs-slide-to="4"></button>
            <button type="button" data-bs-target="#apoiadores" data-bs-slide-to="5"></button>
            <button type="button" data-bs-target="#apoiadores" data-bs-slide-to="6"></button>
            <button type="button" data-bs-target="#apoiadores" data-bs-slide-to="7"></button>
            <button type="button" data-bs-target="#apoiadores" data-bs-slide-to="8"></button>
            <button type="button" data-bs-target="#apoiadores" data-bs-slide-to="9"></button>
            <button type="button" data-bs-target="#apoiadores" data-bs-slide-to="10"></button>
            <button type="button" data-bs-target="#apoiadores" data-bs-slide-to="11"></button>
            <button type="button" data-bs-target="#apoiadores" data-bs-slide-to="12"></button>
            <button type="button" data-bs-target="#apoiadores" data-bs-slide-to="13"></button>
        </div>

        <div class="carousel-inner">
            <div class="carousel-item active">
                <a href="https://captadores.org.br/" target="_blank"><img
                        src="https://novaextranet.crasp.gov.br/encoad/_lib/file/img/apoiadores/ABCR.png?t=1685772800"
                        class="d-block mx-auto img-fluid apoiadoresimg"></a>
            </div>
            <div class="carousel-item">
                <a href="https://akatu.org.br/" target="_blank"><img alt=""
                        src="https://novaextranet.crasp.gov.br/encoad/_lib/file/img/apoiadores/AKATU.png?t=1685772800"
                        class="d-block mx-auto img-fluid apoiadoresimg"></a>
            </div>
            <div class="carousel-item">
                <a href="https://www.anefac.org.br/" target="_blank"><img alt=""
                        src="https://novaextranet.crasp.gov.br/encoad/_lib/file/img/apoiadores/ANEFAC.png?t=1685772800"
                        class="d-block mx-auto img-fluid apoiadoresimg"></a>
            </div>
            <div class="carousel-item">
                <a href="https://angrad.org.br/" target="_blank"><img alt=""
                        src="https://novaextranet.crasp.gov.br/encoad/_lib/file/img/apoiadores/ANGRAD.png?t=1685772800"
                        class="d-block mx-auto img-fluid apoiadoresimg"></a>
            </div>
            <div class="carousel-item">
                <a href="https://www.apimecbrasil.com.br/" target="_blank"><img
                        src="https://novaextranet.crasp.gov.br/encoad/_lib/file/img/apoiadores/APIMEC.png?t=1685772800"
                        class="d-block mx-auto img-fluid apoiadoresimg"></a>
            </div>
            <div class="carousel-item">
                <a href="https://ccbrasil.cc/" target="_blank"><img alt=""
                        src="https://novaextranet.crasp.gov.br/encoad/_lib/file/img/apoiadores/CAPITALISMO_CONSCIENTE.png?t=1685772800"
                        class="d-block mx-auto img-fluid apoiadoresimg"></a>
            </div>
            <div class="carousel-item">
                <a href="https://portal.ciee.org.br/" target="_blank"><img alt=""
                        src="https://novaextranet.crasp.gov.br/encoad/_lib/file/img/apoiadores/CIEE.png?t=1685772800"
                        class="d-block mx-auto img-fluid apoiadoresimg"></a>
            </div>
            <div class="carousel-item">
                <a href="https://online.crcsp.org.br/portal/index.asp" target="_blank"><img alt=""
                        src="https://novaextranet.crasp.gov.br/encoad/_lib/file/img/apoiadores/CRCSP.png?t=1685772800"
                        class="d-block mx-auto img-fluid apoiadoresimg"></a>
            </div>
            <div class="carousel-item">
                <a href="https://www.fiesp.com.br/" target="_blank"><img alt=""
                        src="https://novaextranet.crasp.gov.br/encoad/_lib/file/img/apoiadores/FIESP.png?t=1685772800"
                        class="d-block mx-auto img-fluid apoiadoresimg"></a>
            </div>
            <div class="carousel-item">
                <a href="https://www.financies.com.br/eventos/2024" target="_blank"><img alt=""
                        src="https://novaextranet.crasp.gov.br/encoad/_lib/file/img/apoiadores/FINANCIES.png?t=1685772800"
                        class="d-block mx-auto img-fluid apoiadoresimg"></a>
            </div>
            <div class="carousel-item">
                <a href="https://ibefsp.com.br/" target="_blank"><img alt=""
                        src="https://novaextranet.crasp.gov.br/encoad/_lib/file/img/apoiadores/IBEF-SP.png?t=1685772800"
                        class="d-block mx-auto img-fluid apoiadoresimg"></a>
            </div>
            <div class="carousel-item">
                <a href="https://www.ibgc.org.br/" target="_blank"><img alt=""
                        src="https://novaextranet.crasp.gov.br/encoad/_lib/file/img/apoiadores/IBGC.png?t=1685772800"
                        class="d-block mx-auto img-fluid apoiadoresimg"></a>
            </div>
            <div class="carousel-item">
                <a href="https://www.ibracon.com.br/" target="_blank"><img alt=""
                        src="https://novaextranet.crasp.gov.br/encoad/_lib/file/img/apoiadores/IBRACON.png?t=1685772800"
                        class="d-block mx-auto img-fluid apoiadoresimg"></a>
            </div>
            <div class="carousel-item">
                <a href="https://www.ibri.com.br/pt-br/" target="_blank"><img alt=""
                        src="https://novaextranet.crasp.gov.br/encoad/_lib/file/img/apoiadores/IBRI.png?t=1685772800"
                        class="d-block mx-auto img-fluid apoiadoresimg"></a>
            </div>
        </div>

        <button class="carousel-control-prev" type="button" data-bs-target="#apoiadores" data-bs-slide="prev">
            <span class="carousel-control-prev-icon"></span>
        </button>
        <button class="carousel-control-next" type="button" data-bs-target="#apoiadores" data-bs-slide="next">
            <span class="carousel-control-next-icon"></span>
        </button>
    </div>
    <br>
    <br>
    <br>
    
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.7.1/jquery.min.js"></script>
    <script src="${pageContext.request.contextPath}/js/scripts.js"></script>

	<script type="text/javascript">
	
	
	$(document).ready(function(){
		
		function carregarPalestrantes() {
            const speakersContainer = $('#speakers .row'); 
            speakersContainer.empty(); 

            $.ajax({
                url: '${pageContext.request.contextPath}/PalestranteJsonServlet',
                type: 'GET',
                dataType: 'json',
                success: function(palestrantes) {
                    if (palestrantes && palestrantes.length > 0) {
                        palestrantes.forEach(function(p) {
                            const palestranteCardHTML = `
                                <div class="col-xl-3 col-md-4 col-sm-6 d-flex justify-content-center align-items-center">
                                    <div class="img-container">
                                        <img class="card" src="${p.imagem}" alt="Foto de ${p.nome}">
                                        <div class="overlay">
                                            <h5>${p.nome.toUpperCase()}</h5>
                                            <p>${p.curriculo}</p>
                                            <a href="${p.linkedin}" target="_blank"><i class="fab fa-linkedin"></i></a>
                                        </div>
                                    </div>
                                </div>
                            `;
                            speakersContainer.append(palestranteCardHTML);
                        });
                    } else {
                        speakersContainer.append('<p class="text-white">Nenhum palestrante em destaque no momento.</p>');
                    }
                },
                error: function() {
                    speakersContainer.append('<p class="text-white">Não foi possível carregar os palestrantes.</p>');
                }
            });
        }

		 function carregarProgramacao() {
			    const programacaoContainer = $('#programacao');

			    $.ajax({
			        url: '${pageContext.request.contextPath}/PalestraJsonServlet',
			        type: 'GET',
			        dataType: 'json',
			        success: function(palestras) {
			            if (!palestras || palestras.length === 0) {
			                programacaoContainer.append('<p>A programação será divulgada em breve.</p>');
			                return;
			            }

			            const palestrasPorData = palestras.reduce((acc, palestra) => {
			                const data = palestra.dataPalestra;
			                if (!acc[data]) { acc[data] = []; }
			                acc[data].push(palestra);
			                return acc;
			            }, {});

			            for (const data in palestrasPorData) {
			                
			                const dataObj = new Date(data + 'T12:00:00'); 
			                const diaSemana = dataObj.toLocaleDateString('pt-BR', { weekday: 'long', timeZone: 'UTC' }).toUpperCase();
			                const dataFormatada = dataObj.toLocaleDateString('pt-BR', { day: '2-digit', month: '2-digit', year: 'numeric', timeZone: 'UTC' });
			                
			                const diaHTML = '<div class="dias_palestras"><p class="h2">' + dataFormatada + ' | ' + diaSemana + '</p></div>';
			                programacaoContainer.append(diaHTML);

			                palestrasPorData[data].forEach(function(p) {
			                    const horarioInicioFmt = p.horarioInicio ? p.horarioInicio.substring(0, 5) : '';
			                    const horarioFinalFmt = p.horarioFinal ? p.horarioFinal.substring(0, 5) : '';
			                    const collapseId = 'conteudo_palestra_' + p.idPalestra;
			                    
			                    let botaoInscricaoHTML = '';
			                    if (<%= session.getAttribute("usuarioLogado") != null %>) {
			                        botaoInscricaoHTML = '<button class="btn btn-sm btn-success btn-inscrever" data-id-palestra="' + p.idPalestra + '">Inscrever-se</button>';
			                    }

			                    
			                    const palestraHTML = 
			                        '<div class="palestra-container border-bottom pb-3 mb-3">' +
			                            '<button data-bs-toggle="collapse" data-bs-target="#' + collapseId + '" class="palestra">' +
			                                '<div class="hora_palestra">' +
			                                    '<p class="h2">' + horarioInicioFmt + ' às ' + horarioFinalFmt + '</p>' +
			                                '</div>' +
			                                '<div class="titulo_palestra">' +
			                                    '<p class="h3">' + p.nomePalestra + '</p>' +
			                                '</div>' +
			                            '</button>' +
			                            '<div id="' + collapseId + '" class="collapse p-3" style="color: black;">' +
			                                '<p>' + p.descricao + '</p>' +
			                                '<div class="mt-3 text-start">' + 
			                                     botaoInscricaoHTML +
			                                '</div>' +
			                            '</div>' +
			                        '</div>';
			                        
			                    programacaoContainer.append(palestraHTML);
			                });
			            }
			        },
			        error: function() {
			            programacaoContainer.append('<p>Não foi possível carregar a programação. Tente novamente mais tarde.</p>');
			        }
			    });
			}
		
		$('#programacao').on('click', '.btn-inscrever', function() {
	        const botao = $(this);
	        const idPalestra = botao.data('id-palestra');

	        botao.prop('disabled', true).text('Processando...');

	        $.ajax({
	            url: '${pageContext.request.contextPath}/InscricaoServlet',
	            type: 'POST',
	            data: { idPalestra: idPalestra },
	            dataType: 'json',
	            success: function(response) {
	                if (response.status === 'success') {
	                    Swal.fire('Sucesso!', response.message, 'success');
	                    botao.removeClass('btn-success').addClass('btn-secondary').text('Inscrito');
	                } else {
	                    Swal.fire('Erro!', response.message, 'error');
	                    botao.prop('disabled', false).text('Inscrever-se');
	                }
	            },
	            error: function(xhr) {
	                let errorMsg = 'Ocorreu um erro ao processar sua inscrição. Tente novamente.';
	                if (xhr.responseJSON && xhr.responseJSON.message) {
	                    errorMsg = xhr.responseJSON.message;
	                }
	                Swal.fire('Falha!', errorMsg, 'error');
	                botao.prop('disabled', false).text('Inscrever-se');
	            }
	        });
	    });
		

        carregarPalestrantes();
        carregarProgramacao();
        
        
        //-------------------------------- A PARTIR DAQUI É O JS DO CODIGO ANTIGO
		
		
		
		/*
		// $("#loginArea").hide();
		$("#lembrarSenhaArea").hide();
		$("#userArea").hide();
		$("#CadUserArea").hide();
		$("#ReadUserArea").hide();
		$("#AttUserArea").hide();
		$("#DelUserArea").hide();
		$("#tabelas").hide();
		
		$("#categoriaArea").hide();
		$("#CadCategoriaArea").hide();
		$("#ReadCategoriaArea").hide();
		$("#AttCategoriaArea").hide();
		$("#DelCategoriaArea").hide();
		$("#tabelaCategoria").hide();
		
		$("#estoqueArea").hide();
		$("#CadEstoqueArea").hide();
		$("#ReadEstoqueArea").hide();
		$("#AttEstoqueArea").hide();
		$("#DelEstoqueArea").hide();
		$("#tabelaEstoque").hide();
		
		$("#institucionalArea").hide();
		$("#CadInstitucionalArea").hide();
		$("#ReadInstitucionalArea").hide();
		$("#AttInstitucionalArea").hide();
		$("#DelInstitucionalArea").hide();
		$("#tabelaInstitucional").hide();
		
		$("#itemspedidoArea").hide();
		$("#CadItemspedidoArea").hide();
		$("#ReadItemspedidoArea").hide();
		$("#AttItemspedidoArea").hide();
		$("#DelItemspedidoArea").hide();
		$("#tabelaItemspedido").hide();
		
		$("#nivelusuariosArea").hide();
		$("#CadNivelusuariosArea").hide();
		$("#ReadNivelusuariosArea").hide();
		$("#AttNivelusuariosArea").hide();
		$("#DelNivelusuariosArea").hide();
		$("#tabelaNivelusuarios").hide();
		
		$("#pedidosArea").hide();
		$("#CadPedidosArea").hide();
		$("#ReadPedidosArea").hide();
		$("#AttPedidosArea").hide();
		$("#DelPedidosArea").hide();
		$("#tabelaPedidos").hide();
		
		$("#produtoArea").hide();
		$("#CadProdutoArea").hide();
		$("#ReadProdutoArea").hide();
		$("#AttProdutoArea").hide();
		$("#DelProdutoArea").hide();
		$("#tabelaProduto").hide();
		
		$("#btnLembrarSenha").click(function(event){
			event.preventDefault();
			$("#loginArea").hide();
			$("#lembrarSenhaArea").show();
		});
		
		
		
		
		
		
		
		
		
		
		$("#btnUser").click(function(event){
			event.preventDefault();
			$("#loginArea").hide();
			$("#userArea").show();
		});
		$("#btnCadUser").click(function(event){
			event.preventDefault();
			$("#CadUserArea").show();
			$("#ReadUserArea").hide();
			$("#AttUserArea").hide();
			$("#DelUserArea").hide();
		});
		$("#btnReadUser").click(function(event){
			event.preventDefault();
			$("#CadUserArea").hide();
			$("#ReadUserArea").show();
			$("#tabelas").show();
			$("#AttUserArea").hide();
			$("#DelUserArea").hide();
		});
		$("#btnAttUser").click(function(event){
			event.preventDefault();
			$("#CadUserArea").hide();
			$("#ReadUserArea").hide();
			$("#AttUserArea").show();
			$("#DelUserArea").hide();
		});
		$("#btnDelUser").click(function(event){
			event.preventDefault();
			$("#CadUserArea").hide();
			$("#ReadUserArea").hide();
			$("#AttUserArea").hide();
			$("#DelUserArea").show();
		});
		
		
		
		
		
		
		
		
		
		
		
		$("#btnCategorias").click(function(event){
			event.preventDefault();
			$("#loginArea").hide();
			$("#categoriaArea").show();
		});
		$("#btnCadCategoria").click(function(event){
			event.preventDefault();
			$("#CadCategoriaArea").show();
			$("#ReadCategoriaArea").hide();
			$("#AttCategoriaArea").hide();
			$("#DelCategoriaArea").hide();
		});
		$("#btnReadCategoria").click(function(event){
			event.preventDefault();
			$("#CadCategoriaArea").hide();
			$("#ReadCategoriaArea").show();
			$("#tabelaCategoria").show();
			$("#AttCategoriaArea").hide();
			$("#DelCategoriaArea").hide();
		});
		$("#btnAttCategoria").click(function(event){
			event.preventDefault();
			$("#CadCategoriaArea").hide();
			$("#ReadCategoriaArea").hide();
			$("#AttCategoriaArea").show();
			$("#DelCategoriaArea").hide();
		});
		$("#btnDelCategoria").click(function(event){
			event.preventDefault();
			$("#CadCategoriaArea").hide();
			$("#ReadCategoriaArea").hide();
			$("#AttCategoriaArea").hide();
			$("#DelCategoriaArea").show();
		});
		
		
		
		
		
		
		
		
		
		
		
		$("#btnEstoque").click(function(event){
			event.preventDefault();
			$("#loginArea").hide();
			$("#estoqueArea").show();
		});
		$("#btnCadEstoque").click(function(event){
			event.preventDefault();
			$("#CadEstoqueArea").show();
			$("#ReadEstoqueArea").hide();
			$("#AttEstoqueArea").hide();
			$("#DelEstoqueArea").hide();
		});
		$("#btnReadEstoque").click(function(event){
			event.preventDefault();
			$("#CadEstoqueArea").hide();
			$("#ReadEstoqueArea").show();
			$("#tabelaEstoque").show();
			$("#AttEstoqueArea").hide();
			$("#DelEstoqueArea").hide();
		});
		$("#btnAttEstoque").click(function(event){
			event.preventDefault();
			$("#CadEstoqueArea").hide();
			$("#ReadEstoqueArea").hide();
			$("#AttEstoqueArea").show();
			$("#DelEstoqueArea").hide();
		});
		$("#btnDelEstoque").click(function(event){
			event.preventDefault();
			$("#CadEstoqueArea").hide();
			$("#ReadEstoqueArea").hide();
			$("#AttEstoqueArea").hide();
			$("#DelEstoqueArea").show();
		});
		
		
		
		
		
		
		
		
		
		
		
		
		
		$("#btnInstitucional").click(function(event){
			event.preventDefault();
			$("#loginArea").hide();
			$("#institucionalArea").show();
		});
		$("#btnCadInstitucional").click(function(event){
			event.preventDefault();
			$("#CadInstitucionalArea").show();
			$("#ReadInstitucionalArea").hide();
			$("#AttInstitucionalArea").hide();
			$("#DelInstitucionalArea").hide();
		});
		$("#btnReadInstitucional").click(function(event){
			event.preventDefault();
			$("#CadInstitucionalArea").hide();
			$("#ReadInstitucionalArea").show();
			$("#tabelaInstitucional").show();
			$("#AttInstitucionalArea").hide();
			$("#DelInstitucionalArea").hide();
		});
		$("#btnAttInstitucional").click(function(event){
			event.preventDefault();
			$("#CadInstitucionalArea").hide();
			$("#ReadInstitucionalArea").hide();
			$("#AttInstitucionalArea").show();
			$("#DelInstitucionalArea").hide();
		});
		$("#btnDelInstitucional").click(function(event){
			event.preventDefault();
			$("#CadInstitucionalArea").hide();
			$("#ReadInstitucionalArea").hide();
			$("#AttInstitucionalArea").hide();
			$("#DelInstitucionalArea").show();
		});
		
		
		
		
		
		
		
		
		
		
		
		$("#btnItemspedido").click(function(event){
			event.preventDefault();
			$("#loginArea").hide();
			$("#itemspedidoArea").show();
		});
		$("#btnCadItemspedido").click(function(event){
			event.preventDefault();
			$("#CadItemspedidoArea").show();
			$("#ReadItemspedidoArea").hide();
			$("#AttItemspedidoArea").hide();
			$("#DelItemspedidoArea").hide();
		});
		$("#btnReadItemspedido").click(function(event){
			event.preventDefault();
			$("#CadItemspedidoArea").hide();
			$("#ReadItemspedidoArea").show();
			$("#tabelaItemspedido").show();
			$("#AttItemspedidoArea").hide();
			$("#DelItemspedidoArea").hide();
		});
		$("#btnAttItemspedido").click(function(event){
			event.preventDefault();
			$("#CadItemspedidoArea").hide();
			$("#ReadItemspedidoArea").hide();
			$("#AttItemspedidoArea").show();
			$("#DelItemspedidoArea").hide();
		});
		$("#btnDelItemspedido").click(function(event){
			event.preventDefault();
			$("#CadItemspedidoArea").hide();
			$("#ReadItemspedidoArea").hide();
			$("#AttItemspedidoArea").hide();
			$("#DelItemspedidoArea").show();
		});
		
		
		
		
		
		
		
		
		
		
		
		
		$("#btnNivelusuarios").click(function(event){
			event.preventDefault();
			$("#loginArea").hide();
			$("#nivelusuariosArea").show();
		});
		$("#btnCadNivelusuarios").click(function(event){
			event.preventDefault();
			$("#CadNivelusuariosArea").show();
			$("#ReadNivelusuariosArea").hide();
			$("#AttNivelusuariosArea").hide();
			$("#DelNivelusuariosArea").hide();
		});
		$("#btnReadNivelusuarios").click(function(event){
			event.preventDefault();
			$("#CadNivelusuariosArea").hide();
			$("#ReadNivelusuariosArea").show();
			$("#tabelaNivelusuarios").show();
			$("#AttNivelusuariosArea").hide();
			$("#DelNivelusuariosArea").hide();
		});
		$("#btnAttNivelusuarios").click(function(event){
			event.preventDefault();
			$("#CadNivelusuariosArea").hide();
			$("#ReadNivelusuariosArea").hide();
			$("#AttNivelusuariosArea").show();
			$("#DelNivelusuariosArea").hide();
		});
		$("#btnDelNivelusuarios").click(function(event){
			event.preventDefault();
			$("#CadNivelusuariosArea").hide();
			$("#ReadNivelusuariosArea").hide();
			$("#AttNivelusuariosArea").hide();
			$("#DelNivelusuariosArea").show();
		});
		
		
		
		
		
		
		
		
		
		
		$("#btnPedidos").click(function(event){
			event.preventDefault();
			$("#loginArea").hide();
			$("#pedidosArea").show();
		});
		$("#btnCadPedidos").click(function(event){
			event.preventDefault();
			$("#CadPedidosArea").show();
			$("#ReadPedidosArea").hide();
			$("#AttPedidosArea").hide();
			$("#DelPedidosArea").hide();
		});
		$("#btnReadPedidos").click(function(event){
			event.preventDefault();
			$("#CadPedidosArea").hide();
			$("#ReadPedidosArea").show();
			$("#tabelaPedidos").show();
			$("#AttPedidosArea").hide();
			$("#DelPedidosArea").hide();
		});
		$("#btnAttPedidos").click(function(event){
			event.preventDefault();
			$("#CadPedidosArea").hide();
			$("#ReadPedidosArea").hide();
			$("#AttPedidosArea").show();
			$("#DelPedidosArea").hide();
		});
		$("#btnDelPedidos").click(function(event){
			event.preventDefault();
			$("#CadPedidosArea").hide();
			$("#ReadPedidosArea").hide();
			$("#AttPedidosArea").hide();
			$("#DelPedidosArea").show();
		});
		
		
		
		
		
		
		
		
		
		
		
		
		
		$("#btnProduto").click(function(event){
			event.preventDefault();
			$("#loginArea").hide();
			$("#produtoArea").show();
		});
		$("#btnCadProduto").click(function(event){
			event.preventDefault();
			$("#CadProdutoArea").show();
			$("#ReadProdutoArea").hide();
			$("#AttProdutoArea").hide();
			$("#DelProdutoArea").hide();
		});
		$("#btnReadProduto").click(function(event){
			event.preventDefault();
			$("#CadProdutoArea").hide();
			$("#ReadProdutoArea").show();
			$("#tabelaProduto").show();
			$("#AttProdutoArea").hide();
			$("#DelProdutoArea").hide();
		});
		$("#btnAttProduto").click(function(event){
			event.preventDefault();
			$("#CadProdutoArea").hide();
			$("#ReadProdutoArea").hide();
			$("#AttProdutoArea").show();
			$("#DelProdutoArea").hide();
		});
		$("#btnDelProduto").click(function(event){
			event.preventDefault();
			$("#CadProdutoArea").hide();
			$("#ReadProdutoArea").hide();
			$("#AttProdutoArea").hide();
			$("#DelProdutoArea").show();
		});
		
		
		
		
		
		
		
		
		
		
		$(".btnCancelar").click(function(){
			event.preventDefault();
			$("#loginArea").show();
			$("#lembrarSenhaArea").hide();
			$("#userArea").hide();
			$("#CadUserArea").hide();
			$("#ReadUserArea").hide();
			$("#AttUserArea").hide();
			$("#DelUserArea").hide();
			$("#tabelas").hide();
			
			$("#categoriaArea").hide();
			$("#CadCategoriaArea").hide();
			$("#ReadCategoriaArea").hide();
			$("#AttCategoriaArea").hide();
			$("#DelCategoriaArea").hide();
			$("#tabelaCategoria").hide();
			
			$("#estoqueArea").hide();
			$("#CadEstoqueArea").hide();
			$("#ReadEstoqueArea").hide();
			$("#AttEstoqueArea").hide();
			$("#DelEstoqueArea").hide();
			$("#tabelaEstoque").hide();
			
			$("#institucionalArea").hide();
			$("#CadInstitucionalArea").hide();
			$("#ReadInstitucionalArea").hide();
			$("#AttInstitucionalArea").hide();
			$("#DelInstitucionalArea").hide();
			$("#tabelaInstitucional").hide();
			
			$("#itemspedidoArea").hide();
			$("#CadItemspedidoArea").hide();
			$("#ReadItemspedidoArea").hide();
			$("#AttItemspedidoArea").hide();
			$("#DelItemspedidoArea").hide();
			$("#tabelaItemspedido").hide();
			
			$("#nivelusuariosArea").hide();
			$("#CadNivelusuariosArea").hide();
			$("#ReadNivelusuariosArea").hide();
			$("#AttNivelusuariosArea").hide();
			$("#DelNivelusuariosArea").hide();
			$("#tabelaNivelusuarios").hide();
			
			$("#pedidosArea").hide();
			$("#CadPedidosArea").hide();
			$("#ReadPedidosArea").hide();
			$("#AttPedidosArea").hide();
			$("#DelPedidosArea").hide();
			$("#tabelaPedidos").hide();
			
			$("#produtoArea").hide();
			$("#CadProdutoArea").hide();
			$("#ReadProdutoArea").hide();
			$("#AttProdutoArea").hide();
			$("#DelProdutoArea").hide();
			$("#tabelaProduto").hide();
		});		
		

		$("#frmLogin").submit(function(event){
			event.preventDefault();
			//var formData = $(this).serialize();
			var formData = $("#frmLogin").serialize();
			//console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'autentica.jsp', 
	            data: formData,
	            success: function(response) {
	            	console.log(response);
	            	var data = JSON.parse(response);
	            	
	            	if( data.login == 'true'){
	            		$("#msgLogin").css("color", "green");
           				$("#msgLogin").html("Usuário Autenticado!");
           				new DataTable('#tabelas', {
           				    ajax: 'usuariosJson.jsp'
           				});
           				new DataTable('#tabelaCategoria', {
           				    ajax: 'categoriasJson.jsp'
           				});
           				new DataTable('#tabelaEstoque', {
           				    ajax: 'estoqueJson.jsp'
           				});
	            	} else {
	            		$("#msgLogin").css("color", "red");
           				$("#msgLogin").html("Usuário ou Senha incorretos!");
	            	}
	            	$("#msgLogin").show();
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
		});	
		
		
		
		
		
		
		
		
		
		//usuario
		$("#frmCadUser").submit(function(event){
			event.preventDefault();
			var formData = $("#frmCadUser").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'cadastrar_create.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.insert == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
			
		});			
		
		$("#frmAttUser").submit(function(event){
			event.preventDefault();
			var formData = $("#frmAttUser").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'cadastro_update.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.update == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
			
		});
		
		$("#frmDelUser").submit(function(event){
			event.preventDefault();
			var formData = $("#frmDelUser").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'cadastro_delete.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.update == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
		});
		
		
		
		
		
		
		
		
		
		
		
		
		//categoria
		$("#frmCadCategoria").submit(function(event){
			event.preventDefault();
			var formData = $("#frmCadCategoria").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'categoria_create.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.insert == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
			
		});			
		
		$("#frmAttCategoria").submit(function(event){
			event.preventDefault();
			var formData = $("#frmAttCategoria").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'categoria_update.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.update == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
			
		});
		
		$("#frmDelCategoria").submit(function(event){
			event.preventDefault();
			var formData = $("#frmDelCategoria").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'categoria_delete.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.update == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
		});
		
		
		
		
		
		
		
		
		
		
		
		
		
		//estoque
		$("#frmCadEstoque").submit(function(event){
			event.preventDefault();
			var formData = $("#frmCadEstoque").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'estoque_create.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.insert == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
			
		});			
		
		$("#frmAttEstoque").submit(function(event){
			event.preventDefault();
			var formData = $("#frmAttEstoque").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'estoque_update.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.update == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
			
		});
		
		$("#frmDelEstoque").submit(function(event){
			event.preventDefault();
			var formData = $("#frmDelEstoque").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'estoque_delete.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.update == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
		});
		
		
		
		
		
		
		
		
		
		
		
		
		//institucional
		$("#frmCadInstitucional").submit(function(event){
			event.preventDefault();
			var formData = $("#frmCadInstitucional").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'institucional_create.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.insert == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
			
		});			
		
		$("#frmAttInstitucional").submit(function(event){
			event.preventDefault();
			var formData = $("#frmAttInstitucional").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'institucional_update.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.update == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
			
		});
		
		$("#frmDelInstitucional").submit(function(event){
			event.preventDefault();
			var formData = $("#frmDelInstitucional").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'institucional_delete.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.update == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
		});
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//itemspedido
		$("#frmCadItemspedido").submit(function(event){
			event.preventDefault();
			var formData = $("#frmCadItemspedido").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'itemspedido_create.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.insert == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
			
		});			
		
		$("#frmAttItemspedido").submit(function(event){
			event.preventDefault();
			var formData = $("#frmAttItemspedido").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'itemspedido_update.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.update == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
			
		});
		
		$("#frmDelItemspedido").submit(function(event){
			event.preventDefault();
			var formData = $("#frmDelItemspedido").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'itemspedido_delete.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.update == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
		});
		
		
		
		
		
		
		
		
		
		
		//nivelusuarios
		$("#frmCadNivelusuarios").submit(function(event){
			event.preventDefault();
			var formData = $("#frmCadNivelusuarios").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'nivelusuarios_create.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.insert == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
			
		});			
		
		$("#frmAttNivelusuarios").submit(function(event){
			event.preventDefault();
			var formData = $("#frmAttNivelusuarios").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'nivelusuarios_update.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.update == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
			
		});
		
		$("#frmDelNivelusuarios").submit(function(event){
			event.preventDefault();
			var formData = $("#frmDelNivelusuarios").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'nivelusuarios_delete.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.update == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
		});
		
		
		
		
		
		
		
		
		
		
		
		//pedidos
		$("#frmCadPedidos").submit(function(event){
			event.preventDefault();
			var formData = $("#frmCadPedidos").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'pedidos_create.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.insert == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
			
		});			
		
		$("#frmAttPedidos").submit(function(event){
			event.preventDefault();
			var formData = $("#frmAttPedidos").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'pedidos_update.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.update == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
			
		});
		
		$("#frmDelPedidos").submit(function(event){
			event.preventDefault();
			var formData = $("#frmDelPedidos").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'pedidos_delete.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.update == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
		});
		
		
		
		
		
		
		
		
		
		
		
		
		
		
		//produtos
		$("#frmCadProduto").submit(function(event){
			event.preventDefault();
			var formData = $("#frmCadProduto").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'produto_create.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.insert == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
			
		});			
		
		$("#frmAttProduto").submit(function(event){
			event.preventDefault();
			var formData = $("#frmAttProduto").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'produto_update.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.update == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
			
		});
		
		$("#frmDelProduto").submit(function(event){
			event.preventDefault();
			var formData = $("#frmDelProduto").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'produto_delete.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
			
	                var objResponse =  JSON.parse(response);
	                if (objResponse.update == 'true' ){
	                	alert("foi");
	                }else{
	                	alert("não foi");
	                }
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
		});
		
		
		
		
		
		
		
		
		
		
		

		$("#frmLembrarSenha").submit(function(event){
			event.preventDefault();
			var formData = $("#frmLembrarSenha").serialize();
			console.log(formData);
			$.ajax({
	            type: 'POST',
	            url: 'lembrarSenha.jsp', 
	            data: formData,
	            success: function(response) {
	                console.log(response);
	            },
	            error: function() {
	                alert('Erro ao enviar o formulário.');
	            }
	        });
			
		});	
		$("#cep").blur(function() {

            //Nova variável "cep" somente com dígitos.
            var cep = $(this).val().replace(/\D/g, '');

            //Verifica se campo cep possui valor informado.
            if (cep != "") {

                //Expressão regular para validar o CEP.
                var validacep = /^[0-9]{8}$/;

                //Valida o formato do CEP.
                if(validacep.test(cep)) {

                    //Preenche os campos com "..." enquanto consulta webservice.
                    $("#endereco").val("...");
                    $("#bairro").val("...");
                    $("#cidade").val("...");
                    $("#uf").val("...");

                    //Consulta o webservice viacep.com.br/
                    $.getJSON("https://viacep.com.br/ws/"+ cep +"/json/?callback=?", function(dados) {
                        if (!("erro" in dados)) {
                            //Atualiza os campos com os valores da consulta.
                            $("#endereco").val(dados.logradouro);
                            $("#bairro").val(dados.bairro);
                            $("#cidade").val(dados.localidade);
                            $("#uf").val(dados.uf);
                        } //end if.
                        else {
                            //CEP pesquisado não foi encontrado.
                            alert("CEP não encontrado.");
                        }
                    });
                } //end if.
                else {
                    //cep é inválido.
                    alert("Formato de CEP inválido.");
                }
            } //end if.
            else {
                //cep sem valor, limpa formulário.
            }
        });
		
		
		
		
		
		
		
		
		
		document.addEventListener("DOMContentLoaded", function () {
			  var navLinks = document.querySelectorAll('.navbar-collapse .nav-link');
			  var navbarCollapse = document.querySelector('.navbar-collapse');

			  navLinks.forEach(function (link) {
			    link.addEventListener('click', function () {
			      // Fecha o menu colapsado
			      var bsCollapse = new bootstrap.Collapse(navbarCollapse, {
			        toggle: false
			      });
			      bsCollapse.hide();
			    });
			  });
			});

			*/
			document.getElementById("cpf").addEventListener("input", function (e) {
			  let value = e.target.value.replace(/\D/g, ''); // remove tudo que não é dígito
			  if (value.length > 11) value = value.slice(0, 11); // limita a 11 dígitos
			  value = value.replace(/(\d{3})(\d)/, "$1.$2");
			  value = value.replace(/(\d{3})(\d)/, "$1.$2");
			  value = value.replace(/(\d{3})(\d{1,2})$/, "$1-$2");
			  e.target.value = value;
			});

			document.getElementById("celular").addEventListener("input", function (e) {
			  let value = e.target.value.replace(/\D/g, '');
			  if (value.length > 11) value = value.slice(0, 11);
			  value = value.replace(/^(\d{2})(\d)/g, "($1) $2");
			  value = value.replace(/(\d{5})(\d{1,4})$/, "$1-$2");
			  e.target.value = value;
			});
			
		
		
	});

</script>

</body>
<footer>
    <p class="h4">Siga o CRA-SP nas redes sociais</p>
    <br>
    <div class="row redessociais mx-auto">
        <div class="col-4 text-center">
            <a href="https://www.facebook.com/oficial.crasp" target="_blank">
                <i class="fa-brands fa-facebook" style="color: #3b5998;"></i>
            </a>
        </div>
        <div class="col-4 text-center">
            <a href="https://twitter.com/cra_sp" target="_blank">
                <i class="fa-brands fa-x-twitter" style="color: #000000;"></i>
            </a>
        </div>
        <div class="col-4 text-center">
            <a href="https://www.linkedin.com/company/cra-sp" target="_blank">
                <i class="fa-brands fa-linkedin-in" style="color: #0e76a8;"></i>
            </a>
        </div>
    </div>
    <br>
    <div class="row redessociais mx-auto">
        <div class="col-6 text-center">
            <a href="https://www.instagram.com/cra_sp/" target="_blank">
                <i class="fa-brands fa-instagram" style="color: #000000;"></i>
            </a>
        </div>
        <div class="col-6 text-center">
            <a href="https://www.youtube.com/user/crasp2010" target="_blank">
                <i class="fa-brands fa-youtube" style="color: #c4302b;"></i>
            </a>
        </div>
    </div>
    <br>
    <p class="h4">Contato</p>
    <p class="text-center">e-mail: eventos.participe@crasp.gov.br</p>
</footer>
</html>

