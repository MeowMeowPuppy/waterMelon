package DTO;
/*
member 테이블입니다
/*
 CREATE TABLE wmember(
	id varchar2(20),
 	pw varchar2(20),
 	name varchar2(15),
 	birth varchar2(10),
 	email varchar2(30),
 	mobile varchar2(15)
 	);
 	
 	commit;
 */
public class MemberDTO {
	private String id;
	private String pw;
	private String confirmPw;
	private String name;

	private String year;
	private String month;
	private String day;

	private String birth;
	private String email;

	private String mobile;
	private String voucher;
	private String ticket;
	
	private String certificationNum;
	private String randomNum;
	

	public String getTicket() {
		return ticket;
	}

	public void setTicket(String ticket) {
		this.ticket = ticket;
	}

	public String getVoucher() {
		return voucher;
	}

	public void setVoucher(String vorcher) {
		this.voucher = vorcher;
	}

	public String getBirth() {
		return birth;
	}

	public void setBirth(String birth) {
		this.birth = birth;
	}

	public String getRandomNum() {
		return randomNum;
	}

	public void setRandomNum(String randomNum) {
		this.randomNum = randomNum;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getConfirmPw() {
		return confirmPw;
	}

	public void setConfirmPw(String confirmPw) {
		this.confirmPw = confirmPw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getYear() {
		return year;
	}

	public void setYear(String year) {
		this.year = year;
	}

	public String getMonth() {
		return month;
	}

	public void setMonth(String month) {
		this.month = month;
	}

	public String getDay() {
		return day;
	}

	public void setDay(String day) {
		this.day = day;
	}



	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public String getMobile() {
		return mobile;
	}

	public void setMobile(String mobile) {
		this.mobile = mobile;
	}

	public String getCertificationNum() {
		return certificationNum;
	}

	public void setCertificationNum(String certificationNum) {
		this.certificationNum = certificationNum;
	}
}
