package mini;

public class MiniUser {
	private String userId;
	private String userPwd;
	private String userName;
	private String email;
	private String gender;
	private String img;
	private String infotext;

	public MiniUser() {
	}

	public MiniUser(String userId,String userPwd,String userName,String email,String gender, String img, String infotext) {
		this.userId=userId;
		this.userPwd=userPwd;
		this.userName=userName;
		this.email=email;
		this.gender=gender;
		this.img=img;
		this.setInfotext(infotext);

	}

	public MiniUser(String userId,String userPwd,String userName,String email,String gender) {
		this.userId=userId;
		this.userPwd=userPwd;
		this.userName=userName;
		this.email=email;
		this.gender=gender;

	}
	public MiniUser(String userId,String userPwd) {
		this.userId=userId;
		this.userPwd=userPwd;
	}
	public MiniUser(String userId) {
		this.userId=userId;
	
	}
	public String getUserId() {
		return userId;
	}

	public void setUserId(String userId) {
		this.userId = userId;
	}

	public String getUserPwd() {
		return userPwd;
	}

	public void setUserPwd(String userPwd) {
		this.userPwd = userPwd;
	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getImg() {
		return gender;
	}

	public void setImg(String img) {
		this.img = img;
	}

	public String getInfotext() {
		return infotext;
	}

	public void setInfotext(String infotext) {
		this.infotext = infotext;
	}

}



