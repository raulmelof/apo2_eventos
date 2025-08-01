package model;

public class Usuario {
	private String cpf;
	private String nome;
	private String email;
	private String telefone;
	private String senha;
	private String statusEmail;
	private String formacao;
	private String uf;
	private Integer idNivelUsuario;
	private String nomeNivel;
	private Integer ativo;
	
	public String getCpf() {
		return cpf;
	}
	public void setCpf(String cpf) {
		this.cpf = cpf;
	}
	public String getNome() {
		return nome;
	}
	public void setNome(String nome) {
		this.nome = nome;
	}
	public String getEmail() {
		return email;
	}
	public void setEmail(String email) {
		this.email = email;
	}
	public String getTelefone() {
		return telefone;
	}
	public void setTelefone(String telefone) {
		this.telefone = telefone;
	}
	public String getSenha() {
		return senha;
	}
	public void setSenha(String senha) {
		this.senha = senha;
	}
	public String getStatusEmail() {
		return statusEmail;
	}
	public void setStatusEmail(String statusEmail) {
		this.statusEmail = statusEmail;
	}
	public String getFormacao() {
		return formacao;
	}
	public void setFormacao(String formacao) {
		this.formacao = formacao;
	}
	public String getUf() {
		return uf;
	}
	public void setUf(String uf) {
		this.uf = uf;
	}
	public Integer getIdNivelUsuario() {
		return idNivelUsuario;
	}
	public void setIdNivelUsuario(Integer idNivelUsuario) {
		this.idNivelUsuario = idNivelUsuario;
	}
	public String getNomeNivel() {
		return nomeNivel;
	}
	public void setNomeNivel(String nomeNivel) {
		this.nomeNivel = nomeNivel;
	}
	public Integer getAtivo() {
		return ativo;
	}
	public void setAtivo(Integer ativo) {
		this.ativo = ativo;
	}

}
