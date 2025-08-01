package model;
import java.time.LocalDateTime;
import java.time.LocalDate;

public class Certificado {
	private Integer idCertificado;
	private String cpfUsuario;
	private Integer idPalestra;
	private String codigoValidacao;
	private LocalDateTime dataEmissao;
	private String caminhoArquivoPDF;
	
	private String nomePalestra;
	private LocalDate dataPalestra;
	
	private String nomeUsuario;
	private String cargaHorariaPalestra;
	
	public Integer getIdCertificado() {
		return idCertificado;
	}
	public void setIdCertificado(Integer idCertificado) {
		this.idCertificado = idCertificado;
	}
	public String getCpfUsuario() {
		return cpfUsuario;
	}
	public void setCpfUsuario(String cpfUsuario) {
		this.cpfUsuario = cpfUsuario;
	}
	public Integer getIdPalestra() {
		return idPalestra;
	}
	public void setIdPalestra(Integer idPalestra) {
		this.idPalestra = idPalestra;
	}
	public String getCodigoValidacao() {
		return codigoValidacao;
	}
	public void setCodigoValidacao(String codigoValidacao) {
		this.codigoValidacao = codigoValidacao;
	}
	public LocalDateTime getDataEmissao() {
		return dataEmissao;
	}
	public void setDataEmissao(LocalDateTime dataEmissao) {
		this.dataEmissao = dataEmissao;
	}
	public String getCaminhoArquivoPDF() {
		return caminhoArquivoPDF;
	}
	public void setCaminhoArquivoPDF(String caminhoArquivoPDF) {
		this.caminhoArquivoPDF = caminhoArquivoPDF;
	}
	public String getNomePalestra() {
		return nomePalestra;
	}
	public void setNomePalestra(String nomePalestra) {
		this.nomePalestra = nomePalestra;
	}
	public LocalDate getDataPalestra() {
		return dataPalestra;
	}
	public void setDataPalestra(LocalDate dataPalestra) {
		this.dataPalestra = dataPalestra;
	}
	public String getNomeUsuario() {
		return nomeUsuario;
	}
	public void setNomeUsuario(String nomeUsuario) {
		this.nomeUsuario = nomeUsuario;
	}
	public String getCargaHorariaPalestra() {
		return cargaHorariaPalestra;
	}
	public void setCargaHorariaPalestra(String cargaHorariaPalestra) {
		this.cargaHorariaPalestra = cargaHorariaPalestra;
	}
}
