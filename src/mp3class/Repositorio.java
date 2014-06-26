package mp3class;

import java.util.ArrayList;

public class Repositorio {
	
	public Musica ListaMusicas[];
	public Artista ListaArtistas[];
	public Album ListaAlbums[];
	public ArrayList<Musica> ListaReproducao;
	
	//	Construtor Reposist�rio
	public Repositorio() {
		ListaMusicas = new Musica[500];
		ListaArtistas = new Artista[250];
		ListaAlbums = new Album[100];
		ListaReproducao = new ArrayList<Musica>();
	}
	
	//	Adiciona Musica no Reposit�rio
	public void adicionarMusicaListaReproducao(Musica musica) {
		if(musica != null) {
			ListaReproducao.add(musica);
		}
	}
	
	//	Adiciona Album no Reposit�rio
	public void adicionarAlbumListaReproducao(Album album) {
		if(album != null) {
			for(Musica musica : album.MusicasAlbum) {
				adicionarMusicaListaReproducao(musica);
			}
		}
	}
	
	//	Adiciona Artista no Reposit�rio
	public void adicionarArtistaListaReproducao(Artista artista) {
		if(artista != null) {
			for(Musica musica : ListaMusicas) {
				if(artista.equals(musica.getArtista())) {
					ListaReproducao.add(musica);
				}
			}
		}
	}
	
	//	Remove Musica no Reposit�rio
	public void removerMusicaListaReproducao(Musica musica) throws Exception {
		Musica rmvMusica = localizarMusica(musica.getCodigo());
		if(rmvMusica != null) {
			ListaReproducao.remove(rmvMusica);
		}
	}
	
	//	Adiciona Artista no Reposit�rio
	public void adicionarArtista(Artista artista) {
		if (artista != null) {
			int pos = 0;
			for(int i = 0; i < ListaArtistas.length; i++) {
				if(ListaArtistas[i] == null) {
					pos = i;
					break;
				}
			}	
			ListaArtistas[pos] = artista;
		}
	}
	
	//	Adiciona M�sica no Reposit�rio
	public void adicionarMusica(Musica musica) {
		if (musica != null) {
			int pos = 0;
			for(int i = 0; i < ListaMusicas.length; i++) {
				if(ListaMusicas[i] == null) {
					pos = i;
					break;
				}
			}	
			ListaMusicas[pos] = musica;
		}
	}
	
	//	Adiciona Album no Reposit�rio
	public void adicionarAlbum(Album album) {
		if (album != null) {
			int pos = 0;
			for(int i = 0; i < ListaAlbums.length; i++) {
				if(ListaAlbums[i] == null) {
					pos = i;
					break;
				}
			}	
			ListaAlbums[pos] = album;
		}
	}
	
	//	Localiza Artista no Reposit�rio
	public Artista localizarArtista(String nome) throws Exception {
		int pos = 0;
		for(int i = 0; i < ListaArtistas.length; i++) {
			if(ListaArtistas[i] == null) {
				throw new Exception("Artista n�o encontrado");
			} else {
				if(nome.toUpperCase().equals(ListaArtistas[i].getNome().toUpperCase())) {
					pos = i;
					break;
				}
			}
		}
		Artista artista = ListaArtistas[pos];
		return artista;
	}
	
//	Localiza Artista no Reposit�rio
	public Artista localizarArtista(int cod) throws Exception {
		int pos = 0;
		for(int i = 0; i < ListaArtistas.length; i++) {
			if(ListaArtistas[i] == null) {
				throw new Exception("Artista n�o encontrado");
			} else {
				if(cod == ListaArtistas[i].getCodigo()) {
					pos = i;
					break;
				}
			}
		}
		Artista artista = ListaArtistas[pos];
		return artista;
	}
	
	//	Localiza M�sica pelo Nome no Reposit�rio
	public Musica localizarMusica(String nome) throws Exception {
		Musica musica = null;
		//int pos = 0;
		for(int i = 0; i < ListaMusicas.length; i++) {
			if(ListaMusicas[i] == null) {
				break;
			} else {
				if(nome.toUpperCase().equals(ListaMusicas[i].getNome().toUpperCase())) {
					musica = ListaMusicas[i];
					//pos = i;
					break;
				}
			}
		}
		//Musica musica = ListaMusicas[pos];
		return musica;
	}
	
	//	Localiza M�sica pelo C�digo no Reposit�rio
	public Musica localizarMusica(int cod) throws Exception {
		Musica musica = null;
		//int pos = 0;
		for(int i = 0; i < ListaMusicas.length; i++) {
			if(ListaMusicas[i] == null) {
				System.out.println("\n> <Erro> M�sica n�o encontrada!");
				break;
			} else {
				if(cod == ListaMusicas[i].getCodigo()) {
					musica = ListaMusicas[i];
					//pos = i;
					break;
				}
			}
		}
		//Musica musica = ListaMusicas[pos];
		return musica;
	}
	
	//	Localiza M�sicas por Artista no Reposit�rio
	public ArrayList<Musica> localizarMusica(Artista artista) {
		ArrayList<Musica> musicas = new ArrayList<Musica>();
		for(int i = 0; i < ListaMusicas.length; i++) {
			if(ListaMusicas[i] == null) {
				break;
			} else {
				if(artista.getNome().toUpperCase().equals(ListaMusicas[i].getArtista().getNome().toUpperCase())) {
					musicas.add(ListaMusicas[i]);
				}
			}
		}
		return musicas;
	}
	
	//	Localiza M�sicas por G�nero no Reposit�rio
	public ArrayList<Musica> localizarMusica(Genero genero) {
		ArrayList<Musica> musicas = new ArrayList<Musica>();
		for(int i = 0; i < ListaMusicas.length; i++) {
			if(ListaMusicas[i] == null) {
				break;
			} else {
				if(genero.equals(ListaMusicas[i].getGenero())) {
					musicas.add(ListaMusicas[i]);
				}
			}
		}
		return musicas;
	}
	
	//	Localiza M�sicas por Tempo no Reposit�rio
	public ArrayList<Musica> localizarMusica(long tempo) {
		ArrayList<Musica> musicas = new ArrayList<Musica>();
		for(int i = 0; i < ListaMusicas.length; i++) {
			if(ListaMusicas[i] == null) {
				break;
			} else {
				if(tempo == ListaMusicas[i].getDuracao()) {
					musicas.add(ListaMusicas[i]);
				}
			}
		}
		return musicas;
	}
	
	//	Localiza M�sicas por Album no Reposit�rio
	public ArrayList<Musica> localizarMusica(Album album) {
		ArrayList<Musica> musicas = new ArrayList<Musica>();
		for(Musica musica : album.MusicasAlbum) {
			if(musica == null) {
				break;
			} else {
				musicas.add(musica);
			}
		}
		return musicas;
	}
	
	//	Localiza Album pelo Nome no Reposit�rio
	public Album localizarAlbum(String nome) throws Exception {
		int pos = 0;
		for(int i = 0; i < ListaAlbums.length; i++) {
			if(ListaAlbums[i] == null) {
				throw new Exception("Album n�o encontrado");
			} else {
				if(nome.toUpperCase().equals(ListaAlbums[i].getAlbum().toUpperCase())) {
					pos = i;
					break;
				}
			}
		}
		Album album = ListaAlbums[pos];
		return album;
	}
	
	//	Localiza Album pelo Codigo no Reposit�rio
	public Album localizarAlbum(int cod) throws Exception {
		int pos = 0;
		for(int i = 0; i < ListaAlbums.length; i++) {
			if(ListaAlbums[i] == null) {
				throw new Exception("Album n�o encontrado");
			} else {
				if(cod == ListaAlbums[i].getCodigo()) {
					pos = i;
					break;
				}
			}
		}
		Album album = ListaAlbums[pos];
		return album;
	}
	
	public boolean jaExisteNaLista(Musica musica) {
		boolean existe = false;
		for(Musica mus : ListaReproducao) {
			if(mus == null) {
				break;
			} else {
				if(musica.equals(mus)) {
					existe = true;
				}
			}
		}
		return existe;
	}
	
	public ArrayList<Musica> musicasSemAlbum() {		
		ArrayList<Musica> musicas = new ArrayList<Musica>();
		for(Musica musica : ListaMusicas) {
			int result = 0;
			if(musica == null) {
				break;
			} else {
				for(Album album : ListaAlbums) {
					if(album == null) {
						break;
					} else {
						if(album.pertenceAlbum(musica)) {
							result++;
							continue;
						}
					}
				}
			}
			if(result == 0) {
				musicas.add(musica);
			}
		}
		return musicas;
	}
}

