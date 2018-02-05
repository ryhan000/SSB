package edu.daffodil.ssb.dao;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="acc_ca_groups")
public class AccCaGroups {
@Id
@Column(name="cag_id")
@GeneratedValue(strategy = GenerationType.IDENTITY)
private int cag_id;

@Column(name="cag_name")
private String cag_name;

@Column(name="cag_parent")
private String cag_parent;

public int getCag_id() {
	return cag_id;
}

public void setCag_id(int cag_id) {
	this.cag_id = cag_id;
}

public String getCag_name() {
	return cag_name;
}

public void setCag_name(String cag_name) {
	this.cag_name = cag_name;
}

public String getCag_parent() {
	return cag_parent;
}

public void setCag_parent(String cag_parent) {
	this.cag_parent = cag_parent;
}

}
