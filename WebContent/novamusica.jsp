<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="mp3class.*, java.io.*, java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link href="./style/style.css" rel="stylesheet" type="text/css" />
<link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
	<div id="header">
		<h1>MP3 Player <i class="fa fa-play-circle"></i></h1>
	</div>
	<div id="cssmenu">
        <ul>
            <li class="active"><a href="./index.jsp"><span><i class="fa fa-home"></i> Inicio</span></a></li>
            <li class="last"><a href="./listareproducao.jsp"><span><i class="fa fa-headphones"></i> Reprodução</span></a></li>
            <li class="has-sub"><a href=""><span><i class="fa fa-search"></i> Pesquisar</span></a>
            	<ul>
                    <li class="last"><a href="./musicanome.jsp"><span><i class="fa fa-search"></i> Música por Nome</span></a></li>
                    <li class="last"><a href="./musicacodigo.jsp"><span><i class="fa fa-search"></i> Música por Código</span></a></li>
                    <li class="last"><a href="./musicagenero.jsp"><span><i class="fa fa-search"></i> Músicas por Gênero</span></a></li>
                    <li class="last"><a href="./musicaartista.jsp"><span><i class="fa fa-search"></i> Músicas por Artista</span></a></li>
                    <li class="last"><a href="./musicaalbum.jsp"><span><i class="fa fa-search"></i> Músicas por Album</span></a></li>
                </ul>
            </li>
            <li class="has-sub"><a href=""><span><i class="fa fa-music"></i> Músicas</span></a>
                <ul>
                    <li class="last"><a href="./novamusica.jsp"><span><i class="fa fa-plus"></i> Nova Música</span></a></li>
                    <li class="last"><a href="./todasasmusicas.jsp"><span><i class="fa fa-music"></i> Todas as Músicas</span></a></li>
                    <li class="last"><a href="./relacionarmusica.jsp"><span><i class="fa fa-exchange"></i> Relacionar Música</span></a></li>
                </ul>
            </li>
            <li class="has-sub"><a href=""><span><i class="fa fa-user"></i> Artistas</span></a>
            	<ul>
                    <li class="last"><a href="./novoartista.jsp"><span><i class="fa fa-plus"></i> Novo Artista</span></a></li>
                    <li class="last"><a href="./todososartistas.jsp"><span><i class="fa fa-user"></i> Todos os Artistas</span></a></li>
                </ul>
            </li>
            <li class="has-sub"><a href=""><span><i class="fa fa-folder-open-o"></i> Album</span></a>
            	<ul>
                    <li class="last"><a href="./novoalbum.jsp"><span><i class="fa fa-plus"></i> Novo Album</span></a></li>
                    <li class="last"><a href="./todososalbums.jsp"><span><i class="fa fa-folder-open-o"></i> Todos os Albums</span></a></li>
                </ul>
            </li>            
        </ul>
    </div>
    <div id="content" align="center">
    	<h1>Adicionar Nova Música no Repositório</h1>
	    <form method="get">
	    	<p>Nome da Música: </p><input type="text" name="nome"><br/>
	    	<p>Duração em segundos: </p><input type="text" name="segundos"><br/>
	    	<p>Gênero: </p><input type="text" name="genero"><br/>
	    	<p>Artista: </p>
	    	<select name="artista">
	    		<%
	    		for(Artista artista : MP3Player.repositorio.ListaArtistas) {
	    			if(artista == null) {
	    				break;
	    			} else {
	    				%><option value="<%=artista.getCodigo() %>"><%=artista.getNome() + " - " + Pais.deEnumParaString(artista.getPais()) %></option><%
	    			}
	    		}	
	    		%>
	    	</select><br/>
	    	<p>Url da Música mp3: </p><input type="text" name="url"><br/>
	    	<button class="btn" type="submit">Adicionar</button>
	    </form>
	    <%
	    String nome = null;
	    String url = null;
	    int segundos = 0;
	    Genero genero = null;
	    Artista artista = null;
	    Musica musica = null;
	    
	    try {
			if(request.getParameter("nome") != null) {
				nome = request.getParameter("nome");
			}
		    if(request.getParameter("segundos") != null) {
		    	segundos = Integer.parseInt(request.getParameter("segundos"));
		    }
		    if(request.getParameter("genero") != null) {
		    	genero = Genero.deStringParaEnum(request.getParameter("genero"));	
		    }
		    if(request.getParameter("artista") != null) {
		    	artista = MP3Player.repositorio.localizarArtista(Integer.parseInt(request.getParameter("artista")));	
		    }
		    if(request.getParameter("url") != null) {
		    	url = request.getParameter("url");	
		    }
			
		    if(nome != null && segundos > 0 && genero != null && artista != null) {
		    	musica = new Musica(nome, segundos, genero, artista, url);
		    	MP3Player.repositorio.adicionarMusica(musica);		    	
		    	response.sendRedirect("./sucesso.html");
		    }
		    
	    } catch (Exception e) { 
	    	throw new Exception("Falha ao tentar cadastrar Música"); 
	    }
	    %>
    </div>
    <div id="footer">
		<h4>MP3Player &copy; 2014 - Desenvolvido por Eric e Caio</h4>
	</div>
</body>
</html>