package model;
import java.time.LocalDate;

public class Conteudo {
	private Integer idConteudo;
	private Integer idEvento;
	private String tipoConteudo;
	private Integer ordemExibicao;
	private String titulo;
	private String subtitulo;
	private String textoPrincipal;
	private String imagemUrl;
	private String videoUrl;
	private String linkExterno;
	private String textoLink;
	private LocalDate dataPublicacao;
	private Integer ativo;
	
	public Integer getIdConteudo() {
		return idConteudo;
	}
	public void setIdConteudo(Integer idConteudo) {
		this.idConteudo = idConteudo;
	}
	public Integer getIdEvento() {
		return idEvento;
	}
	public void setIdEvento(Integer idEvento) {
		this.idEvento = idEvento;
	}
	public String getTipoConteudo() {
		return tipoConteudo;
	}
	public void setTipoConteudo(String tipoConteudo) {
		this.tipoConteudo = tipoConteudo;
	}
	public Integer getOrdemExibicao() {
		return ordemExibicao;
	}
	public void setOrdemExibicao(Integer ordemExibicao) {
		this.ordemExibicao = ordemExibicao;
	}
	public String getTitulo() {
		return titulo;
	}
	public void setTitulo(String titulo) {
		this.titulo = titulo;
	}
	public String getSubtitulo() {
		return subtitulo;
	}
	public void setSubtitulo(String subtitulo) {
		this.subtitulo = subtitulo;
	}
	public String getTextoPrincipal() {
		return textoPrincipal;
	}
	public void setTextoPrincipal(String textoPrincipal) {
		this.textoPrincipal = textoPrincipal;
	}
	public String getImagemUrl() {
		return imagemUrl;
	}
	public void setImagemUrl(String imagemUrl) {
		this.imagemUrl = imagemUrl;
	}
	public String getVideoUrl() {
		return videoUrl;
	}
	public void setVideoUrl(String videoUrl) {
		this.videoUrl = videoUrl;
	}
	public String getLinkExterno() {
		return linkExterno;
	}
	public void setLinkExterno(String linkExterno) {
		this.linkExterno = linkExterno;
	}
	public String getTextoLink() {
		return textoLink;
	}
	public void setTextoLink(String textoLink) {
		this.textoLink = textoLink;
	}
	public LocalDate getDataPublicacao() {
		return dataPublicacao;
	}
	public void setDataPublicacao(LocalDate dataPublicacao) {
		this.dataPublicacao = dataPublicacao;
	}
	public Integer getAtivo() {
		return ativo;
	}
	public void setAtivo(Integer ativo) {
		this.ativo = ativo;
	}
}
