package mp3class;

import java.util.ArrayList;

public class Artista {

	private int codigo;
	private String nome;
	private Pais pais;
	static private int ultimo = 1;
	// Arrays
	public static ArrayList<Artista> artistas = new ArrayList<Artista>();
	public static ArrayList<Artista> artistaRepetido = new ArrayList<Artista>();

	// Constructor
	public Artista(String nome, Pais pais) throws Exception {
		try {
			setCodigo();
			setNome(nome);
			setPais(pais);
		} catch (Exception e) {
			throw new Exception("Erro em novo Artista: " + e.getMessage());
		}
	}

	// GETS
	public int getCodigo() {
		return codigo;
	}

	public String getNome() {
		return nome;
	}

	public Pais getPais() {
		return pais;
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
		if (n == null || n == "" || n.length() < 3) {
			throw new Exception("Nome inválido");
		} else {
			nome = n;
		}
	}

	public void setPais(Pais p) throws Exception {
		if (p != null) {
			for (Pais paises : Pais.values()) {
				if (p.equals(paises)) {
					pais = p;
				}
			}
		} else {
			throw new Exception("País inválido");
		}
	}

	public String toString() {
		return ("(" + getCodigo() + ") " + getNome());
	}

	// Método que verifica se existem Artistas repetidos
	public static int verificaArtista(Artista a) {
		int count = 0;
		for (Artista artista : Artista.artistas) {
			if (a.getNome().toUpperCase().equals(artista.getNome().toUpperCase())
					&& a.getPais().equals(artista.getPais())) {
				count++;
			}
		}
		return count;
	}
	
	public boolean equals(Artista artista) {
		if(artista.getNome() == getNome() && artista.getPais() == getPais()) {
			return true;
		} else {
			return false;
		}
	}
}

