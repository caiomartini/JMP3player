package mp3class;

import javax.swing.*;

import java.io.BufferedReader;
import java.io.FileReader;
import java.util.Formatter; //formatar arquivo
import java.util.StringTokenizer;

public class Arquivo {
	
	public static void main(String[] args) {
		String nomeArq = "paises.txt";
		// TODO tentando criar arquivo
		try {
			Formatter saida = new Formatter(nomeArq);
			saida.format("�frica do Sul \r\nAlemanha \r\nAngola \r\nAnt�rctida \r\nAr�bia Saudita \r\nArgentina \r\nArm�nia "
					+ "\r\nAustr�lia \r\n�ustria \r\nBangladeche \r\nBar�m \r\nB�lgica \r\nBol�via \r\nBrasil \r\nBulg�ria"
					+ "\r\nBut�o \r\nCabo Verde \r\nCamar�es \r\nCamboja \r\nCanad� \r\nCatar \r\nChile \r\nChina \r\nCol�mbia"
					+ "\r\nCoreia do Norte \r\nCoreia do Sul \r\nCosta do Marfim \r\nCosta Rica \r\nCro�cia \r\nCuba \r\nDinamarca"
					+ "\r\nEgipto \r\nEmiratos �rabes Unidos \r\nEquador \r\nEslov�quia \r\nEslov�nia \r\nEspanha \r\nEstados Unidos"
					+ "\r\nFilipinas \r\nFinl�ndia \r\nFran�a \r\nGr�cia \r\nHaiti \r\nHonduras \r\nHong Kong \r\nHungria \r\n�ndia"
					+ "\r\nIrlanda \r\nIsl�ndia \r\nIt�lia \r\nJamaica \r\nJap�o \r\nLuxemburgo \r\nMadag�scar \r\nMarrocos \r\nM�xico"
					+ "\r\nMo�ambique \r\nM�naco \r\nMong�lia \r\nNicar�gua \r\nNig�ria \r\nNoruega \r\nParaguai \r\nPeru \r\nPol�nia"
					+ "\r\nPorto Rico \r\nPortugal \r\nReino Unido \r\nR�ssia \r\nSu�cia \r\nSu��a \r\nUcr�nia \r\nUruguai \r\nVenezuela \r\nZimbabu�");
			saida.close();
			JOptionPane.showMessageDialog(null, "Arquivo '" + nomeArq
					+ "' criado!", "Arquivo", 1);
		}
		// TODO mostrando erro em caso se nao for possivel gerar arquivo
		catch (Exception erro) {
			JOptionPane.showMessageDialog(null, "Arquivo nao pode"
					+ " ser gerado!", "Erro", 0);
		}
	}
	
	public void lerArquivo() {
		String linha = null;
		try {
			BufferedReader leitor = new BufferedReader(new FileReader("H:/ParadigmasPrograma�ao2014/Arquivo/paises.txt"));
			
			while ((linha = leitor.readLine()) != null) {
				// TODO UTILIZA DELIMITADOR ; PARA DIVIDIR OS CAMPOS
				StringTokenizer st = new StringTokenizer(linha, ";");
				String dados = null;
				while (st.hasMoreTokens()) {
					dados = st.nextToken();
					String pais = dados;
					System.out.println(" " + pais);
				}
			}
			leitor.close();
			//reader.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}
