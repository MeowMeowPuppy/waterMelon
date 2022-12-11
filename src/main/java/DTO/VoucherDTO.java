package DTO;

/*
 CREATE TABLE voucher(
   id varchar2(20),
   ticket varchar2(10),
   begin varchar2(10),
   finish varchar2(10)
    );
    
    commit;
 */

public class VoucherDTO {
	private String id;
	private String ticket;
	private String begin;
	private String finish;

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getTicket() {
		return ticket;
	}

	public void setTicket(String ticket) {
		this.ticket = ticket;
	}

	public String getBegin() {
		return begin;
	}

	public void setBegin(String begin) {
		this.begin = begin;
	}

	public String getFinish() {
		return finish;
	}

	public void setFinish(String finish) {
		this.finish = finish;
	}

}