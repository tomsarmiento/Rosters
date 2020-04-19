package tomassarmiento.web.models;

public class Player {
	private String name;
	private String lastname;
	private Integer age;
	
	public Player(String name, String lastname, int age) {
		this.name = name;
		this.lastname = lastname;
		this.age = age;
	}
	
	public String getName() {
		return name;
	}
	public void setName(String name) {
		this.name = name;
	}
	public String getLastName() {
		return lastname;
	}
	public void setLastName(String lastname) {
		this.lastname = lastname;
	}
	public Integer getAge() {
		return age;
	}
	public void setAge(Integer age) {
		this.age = age;
	}
}
