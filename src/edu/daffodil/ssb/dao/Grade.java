package edu.daffodil.ssb.dao;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;



@Entity
@Table(name="grade")
public class Grade {
	@Id
	@Column(name="id")
	@GeneratedValue(strategy=GenerationType.IDENTITY)
	private int id;
	
	@Column(name="A_max")
	private int A_max;
	@Column(name="A_min")
	private int A_min;
	@Column(name="B_max")
	private int B_max;
	@Column(name="B_min")
	private int B_min;
	@Column(name="C_max")
	private int C_max;
	@Column(name="C_min")
	private int C_min;
	@Column(name="D_max")
	private int D_max;
	@Column(name="D_min")
	private int D_min;
	@Column(name="E_max")
	private int E_max;
	@Column(name="E_min")
	private int E_min;
	@Column(name="F_max")
	private int F_max;
	@Column(name="F_min")
	private int F_min;
	public int getId() {
		return id;
	}
	public void setId(int id) {
		this.id = id;
	}
	public int getA_max() {
		return A_max;
	}
	public void setA_max(int a_max) {
		A_max = a_max;
	}
	public int getA_min() {
		return A_min;
	}
	public void setA_min(int a_min) {
		A_min = a_min;
	}
	public int getB_max() {
		return B_max;
	}
	public void setB_max(int b_max) {
		B_max = b_max;
	}
	public int getB_min() {
		return B_min;
	}
	public void setB_min(int b_min) {
		B_min = b_min;
	}
	public int getC_max() {
		return C_max;
	}
	public void setC_max(int c_max) {
		C_max = c_max;
	}
	public int getC_min() {
		return C_min;
	}
	public void setC_min(int c_min) {
		C_min = c_min;
	}
	public int getD_max() {
		return D_max;
	}
	public void setD_max(int d_max) {
		D_max = d_max;
	}
	public int getD_min() {
		return D_min;
	}
	public void setD_min(int d_min) {
		D_min = d_min;
	}
	public int getE_max() {
		return E_max;
	}
	public void setE_max(int e_max) {
		E_max = e_max;
	}
	public int getE_min() {
		return E_min;
	}
	public void setE_min(int e_min) {
		E_min = e_min;
	}
	public int getF_max() {
		return F_max;
	}
	public void setF_max(int f_max) {
		F_max = f_max;
	}
	public int getF_min() {
		return F_min;
	}
	public void setF_min(int f_min) {
		F_min = f_min;
	}
	

}
