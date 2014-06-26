package mp3class;

import java.util.ArrayList;

public class Musica {

	private int codigo;
	private String nome, url;
	private Genero genero;
	private long duracao;
	private Artista artista;
	static private int ultimo = 1;

	public static ArrayList<Musica> musicas = new ArrayList<Musica>();
	
	public Musica(String nome, int duracao, Genero genero, Artista artista, String url)
			throws Exception {
		try {
			setCodigo();
			setNome(nome);
			setDuracao(duracao);
			setGenero(genero);
			setArtista(artista);
			setUrl(url);
		} catch (Exception e) {
			throw new Exception("Erro em nova Música: " + e.getMessage());
		}
	}

	// GETS
	public int getCodigo() {
		return codigo;
	}

	public String getNome() {
		return nome;
	}

	public Genero getGenero() {
		return genero;
	}
	
	public long getDuracao() {
		return duracao;
	}

	public String getStrDuracao() {
		String strDuracao = formataDuracao(duracao);
		return strDuracao;
	}

	public Artista getArtista() {
		return artista;
	}
	
	public String getUrl() {
		return url;
	}

	// SETTERS
	public void setCodigo() throws Exception {
		codigo = ultimo;
		if (codigo < 1) {
			throw new Exception("Código inválido");
		} else {
			ultimo++;
		}
	}

	public void setNome(String n) throws Exception {
		if (n == null || n == "") {
			throw new Exception("Nome inválido");
		} else {
			nome = n;
		}
	}

	public void setDuracao(int d) throws Exception {
		if (d < 1) {
			throw new Exception("Duraçao inválida");
		} else {
			duracao = d;
		}
	}
	
	public void setGenero(Genero g) throws Exception {
		if (g != null) {
			for (Genero generos : Genero.values()) {
				if (g.equals(generos)) {
					genero = g;
				}
			}
		} else {
			throw new Exception("País inválido");
		}
	}

	public void setArtista(Artista a) throws Exception {
		if (a == null) {
			throw new Exception("Artista inválido");
		} else {
			artista = a;
		}
	}
	
	public void setUrl(String u) throws Exception {
		if(u == null) {
			throw new Exception("URL inválida");
		} else {
			url = u;
		}
	}

	public static String formataDuracao(long d) {
		long ss = d % 60;
		d /= 60;
		long min = d % 60;
		d /= 60;
		//int hh = d % 24;
		return strzero(min) + ":" + strzero(ss);		
		//return strzero(hh) + ":" + strzero(min) + ":" + strzero(ss);

	}

	private static String strzero(long n) {
		if (n < 10) {
			return "0" + String.valueOf(n);
		}
		return String.valueOf(n);
	}
	
	public String toString() {
		return getNome() +  " [" + getStrDuracao() + "]";
	}
	
	public String toStringFull() {
		return getCodigo() + " - " + getArtista().getNome() + " | " + getNome() + " [" + getStrDuracao() + "] " + " - " + Genero.deEnumParaString(getGenero()) +";" ; 
	}
	
	public boolean equals(Musica musica) {
		if(musica.getCodigo() == getCodigo() && musica.getGenero() == getGenero() && musica.getArtista() == getArtista() && musica.getNome() == getNome() && musica.getDuracao() == getDuracao()) {
			return true;
		} else {
			return false;
		}
	}
}

