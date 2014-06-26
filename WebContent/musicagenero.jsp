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
		<form method="get">
			<h1><i class="fa fa-search"></i> Pesquisar Músicas por Gênero</h1>
			<input type="text" name="genero" value="<%=request.getParameter("genero") != null ? request.getParameter("genero") : ""%>">
			<button class="btn" type="submit">Pesquisar <i class="fa fa-search"></i></button>	
			<%
			Genero genero = null;
			boolean adicionar = false;
			//Musica locMusica = null;
			try 
			{
				if(request.getParameter("genero") != null) {
					genero = Genero.deStringParaEnum(request.getParameter("genero"));
					ArrayList<Musica> musicasGenero = new ArrayList<Musica>();
					if(genero != null) {
						musicasGenero = MP3Player.repositorio.localizarMusica(genero);
					}
					if(musicasGenero.size() > 0) {
						%>
						<h3>Músicas encontradas <i class="fa fa-check"></i></h3>
						<table class="table">
							<tr>
								<td><p><i class="fa fa-check-square-o"></i></p></td>
								<td><p>Música</p></td>
								<td><p>Artista</p></td>
								<td><p>Gênero</p></td>
								<td><p>Player</p></td>
							</tr>
						<%
						for(Musica musica : musicasGenero) {
							%>
							<tr>
								<td><input type="checkbox" name="music" value="<%=musica.getCodigo()%>"></td>
								<td><p><%=musica.getArtista().getNome()%></p></td>
								<td><p><%=musica.toString()%></p></td>
								<td><p><%=Genero.deEnumParaString(musica.getGenero())%></p></td>
								<td><audio preload="auto" controls src="./mp3/<%=musica.getUrl()%>"></audio></td>
							</tr>
							<%
						}
						%>
						</table>
						<button class="btn" type="submit" name="add" value="S">Adicionar na lista de reprodução 
							<i class="fa fa-plus"></i> <i class="fa fa-headphones"></i></button>
						<%
						if(request.getParameter("add") != null && request.getParameter("music") != null) {
							Map<String, String[]> parameters = request.getParameterMap();
							for(String parameter : parameters.keySet()) {
							    if(parameter.toLowerCase().startsWith("music")) {
							        String[] values = parameters.get(parameter);
							        for(String string : values) {
							        	Musica musica = MP3Player.repositorio.localizarMusica(Integer.parseInt(string));
							        	if (MP3Player.repositorio.ListaReproducao.size() == 100) {
											%><p style="color: red;">Impossível realizar operação, Lista de Reprodução lotada [100 músicas]</p><%
										} else {
											if(!MP3Player.repositorio.jaExisteNaLista(musica)) {
												MP3Player.repositorio.adicionarMusicaListaReproducao(musica);
											}
										}
							        }
							    }
							}
							%><p class="success">Músicas adicionadas na Lista de Reprodução</p><%
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