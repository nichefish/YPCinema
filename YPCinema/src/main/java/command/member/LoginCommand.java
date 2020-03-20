package command.member;

public class LoginCommand {
	private String admin;
	private String id;
	private Boolean idStore;
	private Boolean autoLogin;
	private String pass;
	
	public String getAdmin() {
		return admin;
	}
	public void setAdmin(String admin) {
		this.admin = admin;
	}
	public String getId() {
		return id;
	}
	public void setId(String id) {
		this.id = id;
	}
	public Boolean getIdStore() {
		return idStore;
	}
	public void setIdStore(Boolean idStore) {
		this.idStore = idStore;
	}
	public Boolean getAutoLogin() {
		return autoLogin;
	}
	public void setAutoLogin(Boolean autoLogin) {
		this.autoLogin = autoLogin;
	}
	public String getPass() {
		return pass;
	}
	public void setPass(String pass) {
		this.pass = pass;
	}
}
