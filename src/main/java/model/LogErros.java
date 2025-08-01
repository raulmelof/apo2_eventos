package model;
import java.time.LocalDateTime;

public class LogErros {
	private Integer idLogErro;
	private LocalDateTime logData;
	private String logDescricao;
	private String ip;
	private String cpfUsuario;
	
	public Integer getIdLogErro() {
		return idLogErro;
	}
	public void setIdLogErro(Integer idLogErro) {
		this.idLogErro = idLogErro;
	}
	public LocalDateTime getLogData() {
		return logData;
	}
	public void setLogData(LocalDateTime logData) {
		this.logData = logData;
	}
	public String getLogDescricao() {
		return logDescricao;
	}
	public void setLogDescricao(String logDescricao) {
		this.logDescricao = logDescricao;
	}
	public String getIp() {
		return ip;
	}
	public void setIp(String ip) {
		this.ip = ip;
	}
	public String getCpfUsuario() {
		return cpfUsuario;
	}
	public void setCpfUsuario(String cpfUsuario) {
		this.cpfUsuario = cpfUsuario;
	}

}
