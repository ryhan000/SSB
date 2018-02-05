package edu.daffodil.ssb.dao;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="acc_bank_account")
public class AccBankAccount {
	@Id
	@Column(name ="account_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;
	
	@Column(name ="bank_id")
	private int bankid;
	
	@Column(name ="account_number")
	private String account_number;
	
	@Column(name ="branch")
	private String branch;
	
	@Column(name ="bank_acc_code")
	private String bank_acc_code=null;
	
	@Column(name ="company_id")
	private int company_id;
	
	@Column(name ="display")
	private int display;
	
	@Column(name ="created_by")
	private String created_by;

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public int getBankid() {
		return bankid;
	}

	public void setBankid(int bankid) {
		this.bankid = bankid;
	}

	public String getAccount_number() {
		return account_number;
	}

	public void setAccount_number(String account_number) {
		this.account_number = account_number;
	}

	public String getBranch() {
		return branch;
	}

	public void setBranch(String branch) {
		this.branch = branch;
	}

	public String getBank_acc_code() {
		return bank_acc_code;
	}

	public void setBank_acc_code(String bank_acc_code) {
		this.bank_acc_code = bank_acc_code;
	}

	public int getCompany_id() {
		return company_id;
	}

	public void setCompany_id(int company_id) {
		this.company_id = company_id;
	}

	public int getDisplay() {
		return display;
	}

	public void setDisplay(int display) {
		this.display = display;
	}

	public String getCreated_by() {
		return created_by;
	}

	public void setCreated_by(String created_by) {
		this.created_by = created_by;
	}

	


}
