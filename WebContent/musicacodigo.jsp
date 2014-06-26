<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="mp3class.*, java.io.*, java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Insert title here</title>
<link rel="stylesheet" href="./style/style.css" type="text/css" />
<link href="//netdna.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css" rel="stylesheet">
</head>
<body>
	<div id="header">
		<h1>MP3 Player <i class="fa fa-play-circle"></i></h1>
	</div>
	<div id="cssmenu">
        <ul>
            <li class="active"><a href="./index.jsp"><span><i class="fa fa-home"></i> Inicio</span></a></li>
            <li class="last"><a href="./listareproducao.jsp"><span><i class="fa fa-headphones"></i> Reprodu��o</span></a></li>
            <li class="has-sub"><a href=""><span><i class="fa fa-search"></i> Pesquisar</span></a>
            	<ul>
                    <li class="last"><a href="./musicanome.jsp"><span><i class="fa fa-search"></i> M�sica por Nome</span></a></li>
                    <li class="last"><a href="./musicacodigo.jsp"><span><i class="fa fa-search"></i> M�sica por C�digo</span></a></li>
                    <li class="last"><a href="./musicagenero.jsp"><span><i class="fa fa-search"></i> M�sicas por G�nero</span></a></li>
                    <li class="last"><a href="./musicaartista.jsp"><span><i class="fa fa-search"></i> M�sicas por Artista</span></a></li>
                    <li class="last"><a href="./musicaalbum.jsp"><span><i class="fa fa-search"></i> M�sicas por Album</span></a></li>
                </ul>
            </li>
            <li class="has-sub"><a href=""><span><i class="fa fa-music"></i> M�sicas</span></a>
                <ul>
                    <li class="last"><a href="./novamusica.jsp"><span><i class="fa fa-plus"></i> Nova M�sica</span></a></li>
                    <li class="last"><a href="./todasasmusicas.jsp"><span><i class="fa fa-music"></i> Todas as M�sicas</span></a></li>
                    <li class="last"><a href="./relacionarmusica.jsp"><span><i class="fa fa-exchange"></i> Relacionar M�sica</span></a></li>
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
		<form method="get">
			<h1><i class="fa fa-search"></i> Pesquisar M�sica por C�digo</h1>
			<input type="text" name="cod" value="<%=request.getParameter("cod") != null ? request.getParameter("cod") : ""%>">
			<button class="btn" type="submit">Pesquisar <i class="fa fa-search"></i></button>		
			<%
			int cod = 0;
			boolean adicionar = false;
			//Musica locMusica = null;
			try 
			{
				if(request.getParameter("cod") != null) {
					cod = Integer.parseInt(request.getParameter("cod"));
					Musica locMusica = MP3Player.repositorio.localizarMusica(cod);
					if(locMusica != null) {
						%>
						<h3>M�sica encontrada <i class="fa fa-check"></i></h3>
						<table class="table">
							<tr>
								<td><p>ID</p></td>
								<td><p>M�sica</p></td>
								<td><p>Artista</p></td>
								<td><p>G�nero</p></td>
								<td><p>Player</p></td>
							</tr>
							<tr>
								<td><p><%=locMusica.getCodigo()%></p></td>								
								<td><p><%=locMusica.toString()%></p></td>
								<td><p><%=locMusica.getArtista().getNome()%></p></td>
								<td><p><%=Genero.deEnumParaString(locMusica.getGenero())%></p></td>
								<td><audio preload="auto" controls src="./mp3/<%=locMusica.getUrl()%>"></audio></td>
							</tr>	
						</table>	
						<button class="btn" type="submit" name="add" value="S">Adicionar na lista de reprodu��o 
							<i class="fa fa-plus"></i> <i class="fa fa-headphones"></i></button>					
						<%
					}
				}
				
				if(request.getParameter("add") != null) {
					cod = Integer.parseInt(request.getParameter("cod"));
					Musica locMusica = MP3Player.repositorio.localizarMusica(cod);
					if (MP3Player.repositorio.ListaReproducao.size() == 100) {
						%><p style="color: red;">Imposs�vel realizar opera��o, Lista de Reprodu��o lotada [100 m�sicas]</p><%
					} else {
						if(!MP3Player.repositorio.jaExisteNaLista(locMusica)) {
							MP3Player.repositorio.adicionarMusicaListaReproducao(locMusica);
							%><p class="success">M�sica adicionada na Lista de Reprodu��o</p><%
						}											
					}
				}
			} catch(Exception e) {}
			%>
		</form>
	</div>
	<div id="footer">
		<h4>MP3Player &copy; 2014 - Desenvolvido por Eric e Caio</h4>
	</div>
</body>
</html>