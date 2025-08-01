package model;
import java.time.LocalDate;
import java.time.LocalTime;

public class Palestra {
	private Integer idPalestra;
	private String nomePalestra;
	private LocalDate dataPalestra;
	private LocalTime horarioInicio;
	private LocalTime horarioFinal;
	private String descricao;
	private String localizacao;
	private Integer vagas;
	private String link;
	private String cargaHoraria;
	private String chave;
	private Integer idEvento;
	
	public Integer getIdPalestra() {
		return idPalestra;
	}
	public void setIdPalestra(Integer idPalestra) {
		this.idPalestra = idPalestra;
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
	public LocalTime getHorarioFinal() {
		return horarioFinal;
	}
	public void setHorarioFinal(LocalTime horarioFinal) {
		this.horarioFinal = horarioFinal;
	}
	public String getDescricao() {
		return descricao;
	}
	public void setDescricao(String descricao) {
		this.descricao = descricao;
	}
	public String getLocalizacao() {
		return localizacao;
	}
	public void setLocalizacao(String localizacao) {
		this.localizacao = localizacao;
	}
	public Integer getVagas() {
		return vagas;
	}
	public void setVagas(Integer vagas) {
		this.vagas = vagas;
	}
	public String getLink() {
		return link;
	}
	public void setLink(String link) {
		this.link = link;
	}
	public String getCargaHoraria() {
		return cargaHoraria;
	}
	public void setCargaHoraria(String cargaHoraria) {
		this.cargaHoraria = cargaHoraria;
	}
	public String getChave() {
		return chave;
	}
	public void setChave(String chave) {
		this.chave = chave;
	}
	public Integer getIdEvento() {
		return idEvento;
	}
	public void setIdEvento(Integer idEvento) {
		this.idEvento = idEvento;
	}

}
