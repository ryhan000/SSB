package edu.daffodil.ssb.dao;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="acc_bank_cheque")
public class AccBankChecque {
	
	@Id
	@Column(name ="cheque_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int cheque_id;
	
	@Column(name ="account_id")
	private int account_id;
	
	@Column(name ="cheque_no")
	private String chequeNo;
	
	@Column(name ="cheque_date")
	private String cheque_date =null;
	
	@Column(name ="expence_date")
	private String expence_date =null;
	
	@Column(name ="expence_mode")
	private String expence_mode =null;
	
	@Column(name ="cheque_amount")
	private Double cheque_amount =0.0;
	
	@Column(name ="created_by")
	private String created_by =null;
	
	
	

	




	public int getCheque_id() {
		return cheque_id;
	}

	public void setCheque_id(int cheque_id) {
		this.cheque_id = cheque_id;
	}

	
	
	public int getAccount_id() {
		return account_id;
	}

	public void setAccount_id(int account_id) {
		this.account_id = account_id;
	}

	

	public String getChequeNo() {
		return chequeNo;
	}

	public void setChequeNo(String chequeNo) {
		this.chequeNo = chequeNo;
	}

	public String getCheque_date() {
		return cheque_date;
	}

	public void setCheque_date(String cheque_date) {
		this.cheque_date = cheque_date;
	}

	public String getExpence_date() {
		return expence_date;
	}

	public void setExpence_date(String expence_date) {
		this.expence_date = expence_date;
	}

	public String getExpence_mode() {
		return expence_mode;
	}

	public void setExpence_mode(String expence_mode) {
		this.expence_mode = expence_mode;
	}

	

	public Double getCheque_amount() {
		return cheque_amount;
	}

	public void setCheque_amount(Double cheque_amount) {
		this.cheque_amount = cheque_amount;
	}

	public String getCreated_by() {
		return created_by;
	}

	public void setCreated_by(String create_by) {
		this.created_by = create_by;
	}

	@Override
	public String toString() {
		return "AccBankChecque [cheque_id=" + cheque_id + ", account_id=" + account_id + ", chequeNo=" + chequeNo
				+ ", cheque_date=" + cheque_date + ", expence_date=" + expence_date + ", expence_mode=" + expence_mode
				+ ", cheque_amount=" + cheque_amount + ", created_by=" + created_by + "]";
	}

	

	

}
