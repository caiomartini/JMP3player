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
			saida.format("África do Sul \r\nAlemanha \r\nAngola \r\nAntárctida \r\nArábia Saudita \r\nArgentina \r\nArménia "
					+ "\r\nAustrália \r\nÁustria \r\nBangladeche \r\nBarém \r\nBélgica \r\nBolívia \r\nBrasil \r\nBulgária"
					+ "\r\nButão \r\nCabo Verde \r\nCamarões \r\nCamboja \r\nCanadá \r\nCatar \r\nChile \r\nChina \r\nColômbia"
					+ "\r\nCoreia do Norte \r\nCoreia do Sul \r\nCosta do Marfim \r\nCosta Rica \r\nCroácia \r\nCuba \r\nDinamarca"
					+ "\r\nEgipto \r\nEmiratos Árabes Unidos \r\nEquador \r\nEslováquia \r\nEslovénia \r\nEspanha \r\nEstados Unidos"
					+ "\r\nFilipinas \r\nFinlândia \r\nFrança \r\nGrécia \r\nHaiti \r\nHonduras \r\nHong Kong \r\nHungria \r\nÍndia"
					+ "\r\nIrlanda \r\nIslândia \r\nItália \r\nJamaica \r\nJapão \r\nLuxemburgo \r\nMadagáscar \r\nMarrocos \r\nMéxico"
					+ "\r\nMoçambique \r\nMónaco \r\nMongólia \r\nNicarágua \r\nNigéria \r\nNoruega \r\nParaguai \r\nPeru \r\nPolónia"
					+ "\r\nPorto Rico \r\nPortugal \r\nReino Unido \r\nRússia \r\nSuécia \r\nSuíça \r\nUcrânia \r\nUruguai \r\nVenezuela \r\nZimbabué");
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
			BufferedReader leitor = new BufferedReader(new FileReader("H:/ParadigmasProgramaçao2014/Arquivo/paises.txt"));
			
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
