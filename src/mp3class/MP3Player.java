package mp3class;

import java.util.ArrayList;
import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Random;

public class MP3Player {
	
	public static Repositorio repositorio;
	
	public static void iniciaMP3Player() throws Exception {
		Random random = new Random();
		String strRandom = "0123456789aAbBcCdDeEfFgGhHiIjJkKlLmMnNoOpPqQrRsStTuUvVwWxXyYzZ";
		final List<Genero> GENEROS = Collections.unmodifiableList(Arrays.asList(Genero.values()));
		final List<Pais> PAISES = Collections.unmodifiableList(Arrays.asList(Pais.values()));
		final List<Artistas> ARTISTAS = Collections.unmodifiableList(Arrays.asList(Artistas.values()));
		final ArrayList<String> urls = new ArrayList<String>();
		
		urls.add("03-Let There Be Rock-mw.mp3");
		urls.add("04-Mario.mp3");
		urls.add("09 - Na Segunda Vinda.mp3");
		urls.add("09-Lion Man.mp3");
		urls.add("A Perfect Circle - Passive.mp3");
		urls.add("acdc - tnt.mp3");
		urls.add("alice in chains - would.mp3");
		urls.add("Bob Marley - One Love.mp3");
		urls.add("cant stop.mp3");
		urls.add("Incubus _ Megalomaniac.mp3");
		urls.add("Korn - Adidas.mp3");
		urls.add("Natiruts - Naticongo.mp3");
		urls.add("O Rappa - A Feira.mp3");
		urls.add("Oriente 03 Se Oriente.mp3");
		
		final int GenerosSize = GENEROS.size();
		final int PaisesSize = PAISES.size();
		final int ArtistasSize = ARTISTAS.size();
		final int urlSize = urls.size();
		
		// TODO Quantidade inicial de Músicas, Artistas e Albuns
		int totalMusicas = 5;
		int totalArtistas = 4;
		int totalAlbuns = 2;
		
		repositorio = new Repositorio();

		for (int art = 0; art < totalArtistas; art++) {
			String nomeArtista = Artistas.deEnumParaString(ARTISTAS.get(random.nextInt(ArtistasSize)));
			Artista artista = new Artista(nomeArtista, PAISES.get(random.nextInt(PaisesSize)));
			
			for (int alb = 0; alb < totalAlbuns; alb++) {
				Album album = new Album("Album-"
						+ String.valueOf(strRandom.charAt(random.nextInt(strRandom.length())))
						+ String.valueOf(strRandom.charAt(random.nextInt(strRandom.length())))
						+ String.valueOf(strRandom.charAt(random.nextInt(strRandom.length()))), 
						"23/04/2014");
				
				for (int n = 0; n < totalMusicas; n++) {
					int duracaoRandom = random.nextInt(500) + 1;
					Musica musica = new Musica("Musica-"
							+ String.valueOf(strRandom.charAt(random.nextInt(strRandom.length())))
							+ String.valueOf(strRandom.charAt(random.nextInt(strRandom.length())))
							+ String.valueOf(strRandom.charAt(random.nextInt(strRandom.length()))),
							duracaoRandom, 
							GENEROS.get(random.nextInt(GenerosSize)), 
							artista,
							urls.get(random.nextInt(urlSize)));
					album.adicionarMusica(musica);
					repositorio.adicionarMusica(musica);
				}
				repositorio.adicionarAlbum(album);
			}
			repositorio.adicionarArtista(artista);
		}
	}
}
