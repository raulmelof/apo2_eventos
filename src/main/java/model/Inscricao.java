package model;
import java.time.LocalDateTime;
import java.time.LocalDate;
import java.time.LocalTime;

public class Inscricao {
	private Integer idInscricao;
	private String cpfUsuario;
	private Integer idPalestra;
	private Integer presenca;
	private LocalDateTime dataInscricao;
	private Integer idEvento;
	private String statusCertificado;
	private Integer idCertificadoGerado;
	
	private String nomePalestra;
    private LocalDate dataPalestra;
    private LocalTime horarioInicio;
	
	public Integer getIdInscricao() {
		return idInscricao;
	}
	public void setIdInscricao(Integer idInscricao) {
		this.idInscricao = idInscricao;
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
	public Integer getPresenca() {
		return presenca;
	}
	public void setPresenca(Integer presenca) {
		this.presenca = presenca;
	}
	public LocalDateTime getDataInscricao() {
		return dataInscricao;
	}
	public void setDataInscricao(LocalDateTime dataInscricao) {
		this.dataInscricao = dataInscricao;
	}
	public Integer getIdEvento() {
		return idEvento;
	}
	public void setIdEvento(Integer idEvento) {
		this.idEvento = idEvento;
	}
	public String getStatusCertificado() {
		return statusCertificado;
	}
	public void setStatusCertificado(String statusCertificado) {
		this.statusCertificado = statusCertificado;
	}
	public Integer getIdCertificadoGerado() {
		return idCertificadoGerado;
	}
	public void setIdCertificadoGerado(Integer idCertificadoGerado) {
		this.idCertificadoGerado = idCertificadoGerado;
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
	public LocalTime getHorarioInicio() {
		return horarioInicio;
	}
	public void setHorarioInicio(LocalTime horarioInicio) {
		this.horarioInicio = horarioInicio;
	}
}
