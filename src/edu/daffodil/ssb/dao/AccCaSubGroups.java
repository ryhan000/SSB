package edu.daffodil.ssb.dao;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="acc_ca_sub_groups")
public class AccCaSubGroups {
	@Id
	@Column(name="casg_id")
	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int casg_id;
	
	@Column(name="casg_name")
	private String casg_name;
	
	@Column(name="cag_id")
	private int cag_id;

	public int getCasg_id() {
		return casg_id;
	}

	public void setCasg_id(int casg_id) {
		this.casg_id = casg_id;
	}

	public String getCasg_name() {
		return casg_name;
	}

	public void setCasg_name(String casg_name) {
		this.casg_name = casg_name;
	}

	public int getCag_id() {
		return cag_id;
	}

	public void setCag_id(int cag_id) {
		this.cag_id = cag_id;
	}
	
	
}
