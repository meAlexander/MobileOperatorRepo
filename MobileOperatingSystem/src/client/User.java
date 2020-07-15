package client;

public class User {
	private String name;
	private String password;
	
	public User(String name, String password) {
		this.password = password;
		this.name = name;
	}
	
	public String getName() {
		return name;
	}
	
	public String getPassword() {
		return password;
	}
}