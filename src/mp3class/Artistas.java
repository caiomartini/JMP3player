package mp3class;

public enum Artistas {
	POD, SLIPKNOT, EMINEM, SOUNDGARDEN, GROUNDATION, MUSE, DARKSIDE, WEEZER, 
	SEAL, AEROSMITH, GOLDFISH, AUDIOSLAVE, METALLICA, RAIMUNDOS, YES, QUEEN;
	
	public static String deEnumParaString(Artistas a) {
		String artista = null;
		for (Artistas artistas : Artistas.values()) {
			if (a.equals(artistas)) {
				String inicArtista = artistas.name().substring(0,1).toUpperCase();
				String restArtista = artistas.name().substring(1).toLowerCase();
				artista = inicArtista + restArtista;
			}
		}
		return artista;
	}
}

