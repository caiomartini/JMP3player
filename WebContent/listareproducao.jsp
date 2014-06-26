<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="mp3class.*, java.io.*, java.util.*, javafx.scene.media.*;"%>

<!DOCTYPE html>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>Lista de Reprodução</title>
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
		<h1><i class="fa fa-headphones"></i> Lista de Reprodução</h1>		
		<form method="get">
			<%	
			if(MP3Player.repositorio.ListaReproducao.size() > 0) {
				%>				
				<button class="btn" type="submit" name="clear" value="l">Limpar <i class="fa fa-trash-o"></i></button>
				<table class="table">
					<tr>
						<td></td>
						<td><p>Artista</p></td>
						<td><p>Música</p></td>
						<td><p>Gênero</p></td>
						<td><p>Player</p></td>
					</tr>
					<%
					for(Musica musica : MP3Player.repositorio.ListaReproducao) {
						if(musica == null) {
							break;
						} else {
							%>
							<tr>
								<td><p><i class="fa fa-music"></i></p></td>
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
				<button class="btn" type="submit" name="export" value="s" title="Exportar arquivo .txt da Lista de Reprodução para o Disco Local">
					Exportar <i class="fa fa-level-down"> <i class="fa fa-hdd-o"></i></i></button>
				<%
			}					
			%>		
			<button class="btn" type="submit" name="import" value="s" title="Importar arquivo .txt do Disco Local para a Lista de Reprodução">
				Importar <i class="fa fa-hdd-o"></i> <i class="fa fa-level-up"></i></button>
		</form>
		<%
		if(request.getParameter("clear") != null) {
			MP3Player.repositorio.ListaReproducao.clear();
			response.sendRedirect("./listareproducao.jsp");
		}
		
		if(request.getParameter("export") != null) {			
			File file = new File("c:/ListaReproducao.txt");
			FileOutputStream fos = new FileOutputStream(file);
			for(Musica musica : MP3Player.repositorio.ListaReproducao) {
				if(musica == null) {
					break;
				} else {
					try {
						byte[] bytesMusica = musica.toStringFull().getBytes();
						fos.write(bytesMusica);
						byte[] byteSeparador = System.getProperty("line.separator").getBytes();
						fos.write(byteSeparador);
						fos.flush();
					} catch(Exception e) {}					
				}
			}
			fos.close();
		}
		
		if(request.getParameter("import") != null) {
			File file = new File("c:/ListaReproducao.txt");
			FileInputStream fis = new FileInputStream(file);
			byte[] b = new byte[fis.available()];
			fis.read(b);
			fis.close();
			String text = new String(b);
			%>
			<p><%=text%></p>
			<%
		}
		%>
	</div>
	<div id="footer">
		<h4>MP3Player &copy; 2014 - Desenvolvido por Eric e Caio</h4>
	</div>
</body>
</html>