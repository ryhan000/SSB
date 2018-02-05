package edu.daffodil.ssb.dao;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="acc_bank_info")
public class AccBankInfo {
	
	@Id
	@Column(name ="bi_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name ="bi_name")
	private String bankname;
	
	@Column(name ="bi_short_name")
	private String bshortname;
	
	@Column(name ="bi_contact")
	private String bcontactnumber;
	
	@Column(name ="bi_email")
	private String bemail;
	
	@Column(name ="bi_faxno")
	private String bfaxno;
	
	@Column(name ="bi_web_url")
	private String bankurlno;
	
	@Column(name ="created_by")
	private String createdby;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getBankname() {
		return bankname;
	}

	public void setBankname(String bankname) {
		this.bankname = bankname;
	}

	public String getBshortname() {
		return bshortname;
	}

	public void setBshortname(String bshortname) {
		this.bshortname = bshortname;
	}

	public String getBcontactnumber() {
		return bcontactnumber;
	}

	public void setBcontactnumber(String bcontactnumber) {
		this.bcontactnumber = bcontactnumber;
	}

	public String getBemail() {
		return bemail;
	}

	public void setBemail(String bemail) {
		this.bemail = bemail;
	}

	public String getBfaxno() {
		return bfaxno;
	}

	public void setBfaxno(String bfaxno) {
		this.bfaxno = bfaxno;
	}

	public String getBankurlno() {
		return bankurlno;
	}

	public void setBankurlno(String bankurlno) {
		this.bankurlno = bankurlno;
	}

	public String getCreatedby() {
		return createdby;
	}

	public void setCreatedby(String createdby) {
		this.createdby = createdby;
	}
	
	
	

}
