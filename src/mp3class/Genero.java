package mp3class;

public enum Genero {		
	ROCK, SAMBA, HIP_HOP, AXE, PAGODE, ELETRONICA, AMBIENTE, POP, SERTANEJO, RAP;
	
	public static String deEnumParaString(Genero g) {
		String genero = null;
		for (Genero generos : Genero.values()) {
			if (g.equals(generos)) {
				String inicgenero = generos.name().substring(0,1).toUpperCase();
				String restgenero = generos.name().substring(1).toLowerCase();
				genero = inicgenero + restgenero;
				genero = genero.replaceAll("_", " ");
				//genero = generos.name().replaceAll("_", " ");				
			}
		}
		return genero;
	}

	public static Genero deStringParaEnum(String g) {
		Genero genero = null;
		for (Genero generos : Genero.values()) {
			if (g.toUpperCase().equals(generos.name().toUpperCase())) {
				genero = generos;
			}
		}
		return genero;
	}
}



