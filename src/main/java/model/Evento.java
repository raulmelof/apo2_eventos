package model;
import java.time.LocalDate;

public class Evento {
	private Integer idEvento;
	private String nomeEvento;
	private LocalDate dataInicio;
	private LocalDate dataFim;
	private Integer ativo;
	private String linkPesquisa;
	
	public Integer getIdEvento() {
		return idEvento;
	}
	public void setIdEvento(Integer idEvento) {
		this.idEvento = idEvento;
	}
	public String getNomeEvento() {
		return nomeEvento;
	}
	public void setNomeEvento(String nomeEvento) {
		this.nomeEvento = nomeEvento;
	}
	public LocalDate getDataInicio() {
		return dataInicio;
	}
	public void setDataInicio(LocalDate dataInicio) {
		this.dataInicio = dataInicio;
	}
	public LocalDate getDataFim() {
		return dataFim;
	}
	public void setDataFim(LocalDate dataFim) {
		this.dataFim = dataFim;
	}
	public Integer getAtivo() {
		return ativo;
	}
	public void setAtivo(Integer ativo) {
		this.ativo = ativo;
	}
	public String getLinkPesquisa() {
		return linkPesquisa;
	}
	public void setLinkPesquisa(String linkPesquisa) {
		this.linkPesquisa = linkPesquisa;
	}
}
