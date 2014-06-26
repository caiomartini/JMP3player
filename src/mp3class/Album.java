package mp3class;

import java.text.*;
import java.util.*;

public class Album {
	private int codigo, totalMusicas;
	private long tempoExecucao;
	private String album;
	private Date lancamento;
	private Artista artista;
	private static int ultimo = 1;
	
	public Musica[] MusicasAlbum;

	public Album(String album, String lancamento) throws Exception {
		MusicasAlbum = new Musica[30];
		try {
			setCodigo();
			//setArtista(artista);
			setAlbum(album);
			setDataLancamento(lancamento);
		} catch (Exception e) {
			throw new Exception("Erro em novo Album: " + e.getMessage());
		}
	}

	// GETS
	public int getCodigo() {
		return codigo;
	}

	public String getAlbum() {
		return album;
	}

	public Calendar getDataLancamento() {
		Calendar calendar = Calendar.getInstance();
		calendar.setTime(lancamento);		
		return calendar;
	}
	
	public Artista getArtista() {
		return artista;
	}
	
	public long getTempoExecucao() {
		long tempo = 0;
		for(Musica musica : MusicasAlbum) {
			if(musica != null) {
				tempo += musica.getDuracao();
			}
		}
		if(tempo > tempoExecucao) {
			tempoExecucao = tempo;
		}
		return tempoExecucao;
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
	
//	public void setArtista(Artista a) throws Exception {
//		if (a == null) {
//			throw new Exception("Artista inválido");
//		} else {
//			artista = a;
//		}
//	}

	public void setAlbum(String a) throws Exception {
		if (a == null || a == "" || a.length() < 3) {
			throw new Exception("Album inválido");
		} else {
			album = a;
		}
	}
	
	public void setDataLancamento(String d) throws Exception {
		if (d == null || d == "") {
			throw new Exception("Data de Lançamento inválido");
		} else {
			SimpleDateFormat sd = new SimpleDateFormat("dd/MM/yyyy");
			sd.setLenient(false);
			Date data = sd.parse(d);
			lancamento = data;
		}
	}

	//	Métodos
	public String toString() {
		return "Album: (" + getCodigo() + ") " + getAlbum() + " [" + getDataLancamento().get(Calendar.YEAR) + "] -> " 
				+ contarMusicas() + " músicas - " + formataTempoExecucao(getTempoExecucao());
	}
	
	//	Métodos
	public String toStringSmall() {
		return "Album: (" + getCodigo() + ") " + getAlbum() + " [" + getDataLancamento().get(Calendar.YEAR) + "] " + contarMusicas() + " músicas - " + formataTempoExecucao(getTempoExecucao());
	}
	
	public void adicionarMusica(Musica musica) {
		if (musica != null) {
			int pos = 0;
			for(int i = 0; i < MusicasAlbum.length; i++) {
				if(MusicasAlbum[i] == null) {
					pos = i;
					break;
				}
			}	
			MusicasAlbum[pos] = musica;
		}
	}
	
	public Musica localizarMusica(String nome) throws Exception {
		int pos = 0;
		for(int i = 0; i < MusicasAlbum.length; i++) {
			if(MusicasAlbum[i] == null) {
				throw new Exception("Música não encontrada");
			} else {
				if(nome.toUpperCase().equals(MusicasAlbum[i].getNome().toUpperCase())) {
					pos = i;
					break;
				}
			}
		}
		Musica musica = MusicasAlbum[pos];
		return musica;
	}
	
	public Musica localizarMusica(int cod) throws Exception {
		int pos = 0;
		for(int i = 0; i < MusicasAlbum.length; i++) {
			if(MusicasAlbum[i] == null) {
				throw new Exception("Música não encontrada");
			} else {
				if(cod == MusicasAlbum[i].getCodigo()) {
					pos = i;
					break;
				}
			}
		}
		Musica musica = MusicasAlbum[pos];
		return musica;
	}
	
	public int contarMusicas() {
		totalMusicas = 0;
		for(Musica musica : MusicasAlbum) {
			if(musica != null) {
				totalMusicas++;
			}
		}
		return totalMusicas;
	}
	
	public long obterTempoExecucao() {
		for(Musica musica : MusicasAlbum) {
			if(musica != null) {
				tempoExecucao += musica.getDuracao();
			}
		}
		return tempoExecucao;
	}
	
	public String formataTempoExecucao(long d) {
		long ss = d % 60;
		d /= 60;
		long min = d % 60;
		d /= 60;
		long hh = d % 24;
		//return strzero(min) + ":" + strzero(ss);		
		return strzero(hh) + ":" + strzero(min) + ":" + strzero(ss);
	}
	
	private static String strzero(long n) {
		if (n < 10) {
			return "0" + String.valueOf(n);
		}
		return String.valueOf(n);
	}
	
	public boolean equals(Album album) {
		if(album.getCodigo() == getCodigo() && album.getAlbum() == getAlbum() && album.getDataLancamento() == getDataLancamento()) {
			return true;
		} else {
			return false;
		}
	}
	
	public boolean pertenceAlbum(Musica musica) {
		for(Musica musicaAlbum : MusicasAlbum) {
			if(musicaAlbum == null) {
				break;
			} else {
				if(musica.equals(musicaAlbum)) {
					return true;
				}
			}
		}
		return false;
	}
}
