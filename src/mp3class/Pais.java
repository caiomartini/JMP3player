package mp3class;

public enum Pais {
	ALEMANHA, ARGENTINA, BELGICA, BOLIVIA, BRASIL, USA;	

	public static String deEnumParaString(Pais p) {
		String pais = null;
		for (Pais paises : Pais.values()) {
			if (p.equals(paises)) {
				String inicPais = paises.name().substring(0,1).toUpperCase();
				String restPais = paises.name().substring(1).toLowerCase();
				pais = inicPais + restPais;
			}
		}
		return pais;
	}

	public static Pais deStringParaEnum(String p) {
		Pais pais = null;
		for (Pais paises : Pais.values()) {
			if (p.toUpperCase().equals(paises.name().toUpperCase())) {
				pais = paises;
			}
		}
		return pais;
	}
}
