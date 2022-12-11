package DTO;
/*
 CREATE TABLE love (
 num number,
 id varchar2(40)
 );
  
 */

public class LoveDTO {
	private String id;
	private int num;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public int getNum() {
		return num;
	}

	public void setNum(int num) {
		this.num = num;
	}
}
