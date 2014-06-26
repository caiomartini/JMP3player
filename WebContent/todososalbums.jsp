<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="mp3class.*, java.io.*, java.util.*"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Albums</title>
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
		<h1><i class="fa fa-folder-open-o"></i> Albums do Repositório</h1>
		<%
		for (Album album : MP3Player.repositorio.ListaAlbums) {
			if (album == null) {
				break;
			} else {
				%>
				<table class="table">
					<tr>
						<td><p></p></td>
						<td><p>ID</p></td>
						<td><p>Album</p></td>
						<td><p>Ano</p></td>
						<td><p>Total</p></td>
						<td><p>Tempo</p></td>
					</tr>
					<tr>
						<td><i class="fa fa-folder-open-o"></i></td>
						<td><p><%=album.getCodigo()%></p></td>
						<td><p><%=album.getAlbum()%></p></td>
						<td><p><%=album.getDataLancamento().get(Calendar.YEAR)%></p></td>
						<td><p><%=album.contarMusicas() + " músicas"%></p></td>
						<td><p><%=album.formataTempoExecucao(album.getTempoExecucao())%></p></td>
					</tr>
					<tr>						
						<table class="table" style="border-bottom: 3px solid #276873; padding: 5px 0px;">
							<tr>
								<td><p></p></td>
								<td><p>ID</p></td>
								<td><p>Música</p></td>
								<td><p>Artista</p></td>
								<td><p>Gênero</p></td>
								<td><p>Tempo</p></td>
								<td><p></p></td>
							</tr>
							<%				
							for (Musica musica : album.MusicasAlbum) {
								if (musica == null) {
									break;
								} else {
									%>
									<tr>
										<td><i class="fa fa-music"></i></td>
										<td><p><%=musica.getCodigo()%></p></td>
										<td><p><%=musica.toString()%></p></td>
										<td><p><%=musica.getArtista().getNome()%></p></td>
										<td><p><%=Genero.deEnumParaString(musica.getGenero())%></p></td>
										<td><p><%=Musica.formataDuracao(musica.getDuracao())%></p></td>
										<td><audio preload="auto" controls src="./mp3/<%=musica.getUrl()%>"></audio></td>
									</tr>
									<%
								}
							}
						%>
						</table>						
					</tr>
				</table>
				<%
			}
		}
		%>
	</div>
	<div id="footer">
		<h4>MP3Player &copy; 2014 - Desenvolvido por Eric e Caio</h4>
	</div>
</body>
</html>