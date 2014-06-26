<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="mp3class.*, java.io.*, java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Relacionar M�sica</title>
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
    	<h1><i class="fa fa-exchange"></i> Relacionar M�sica e Album</h1>
    	<form method="get">
	    	<%
	    	ArrayList<Musica> musicasSemAlbum = MP3Player.repositorio.musicasSemAlbum();
			if(musicasSemAlbum.size() > 0) {
				%>
				<h2>M�sicas sem Album</h2>
				<table class="table">
					<tr>
						<td><p></p></td>
						<td><p>Artista</p></td>
						<td><p>M�sica</p></td>
						<td><p>G�nero</p></td>
						<td><p>Player</p></td>
					</tr>
					<%
					for(Musica musica : musicasSemAlbum) {
						if(musica == null) {
							break;
						} else {
							%>
							<tr>
								<td><input type="radio" name="musica" value="<%=musica.getCodigo()%>"></td>
								<td><p><%=musica.getArtista().getNome()%></p></td>
								<td><p><%=musica.toString()%></p></td>
								<td><p><%=Genero.deEnumParaString(musica.getGenero())%></p></td>
								<td><audio preload="auto" controls src="./mp3/<%=musica.getUrl()%>"></audio></td>
							</tr>
							<%
						}
					}
					%>
				</table>
				<h2>Albums do Reposit�rio</h2>
				<table class="table">
					<tr>
						<td><p></p></td>
						<td><p>Album</p></td>
						<td><p>Lan�amento</p></td>
						<td><p>Total</p></td>
						<td><p>Tempo</p></td>
					</tr>
					<%
					for(Album album : MP3Player.repositorio.ListaAlbums) {
						if(album == null) {
							break;
						} else {
							%>
							<tr>
								<td><input type="radio" name="album" value="<%=album.getCodigo()%>"></td>
								<td><p><%=album.getAlbum()%></p></td>
								<td><p><%=album.getDataLancamento().get(Calendar.YEAR)%></p></td>
								<td><p><%=album.contarMusicas() + " m�sicas"%></p></td>
								<td><p><%=album.formataTempoExecucao(album.getTempoExecucao())%></p></td>
							</tr>
							<%
						}
					}
					%>
				</table>
				<button class="btn" type="submit">Relacionar</button>
				<%
			} else {
				%>
				<h3>Nenhuma M�sica sem Album foi encontrada</h3>
				<%
			}
	    	%>	    	
    	</form>    	
    	<%
    	int codmusica = 0;
    	int codalbum = 0;
    	try {
			if(request.getParameter("musica") != null) {
				codmusica = Integer.parseInt(request.getParameter("musica"));
			}
		    if(request.getParameter("album") != null) {
		    	codalbum = Integer.parseInt(request.getParameter("album"));
		    }		    
		    if(codmusica != 0 && codalbum != 0) {
		    	Musica musica = MP3Player.repositorio.localizarMusica(codmusica);
		    	Album album = MP3Player.repositorio.localizarAlbum(codalbum);
		    	album.adicionarMusica(musica);
		    	%>
		    	<p class="success">M�sica adicionada no Album</p>
		    	<%
		    	response.sendRedirect("./relacionarmusica.jsp");
		    }
    	} catch(Exception e) {}
		%>
    </div>
    <div id="footer">
		<h4>MP3Player &copy; 2014 - Desenvolvido por Eric e Caio</h4>
	</div>
</body>
</html>