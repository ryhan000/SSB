package edu.daffodil.ssb.dao;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.Table;

@Entity
@Table(name="acc_ca")
public class AccountingChart {

	@Id
	@Column(name ="ca_id")
	private String caId;
	
	@Column(name="ca_name")
	private String caName;
	
	@Column(name="casg_id")
	private String casgId;
	
	@Column(name="ca_comid")
	private int caComid;
	
	@Column(name="ca_prjid")
	private String caPrjid;
	
	@Column(name="ca_parent")
	private String caParent;
	
	@Column(name="ca_level")
	private Short caLevel;
	
	@Column(name="display")
	private Short display;
	
	@Column(name="created_by")
	private String createdBy;

	public String getCaId() {
		return caId;
	}

	public void setCaId(String caId) {
		this.caId = caId;
	}

	public String getCaName() {
		return caName;
	}

	public void setCaName(String caName) {
		this.caName = caName;
	}

	public String getCasgId() {
		return casgId;
	}

	public void setCasgId(String casgId) {
		this.casgId = casgId;
	}

	public int getCaComid() {
		return caComid;
	}

	public void setCaComid(int caComid) {
		this.caComid = caComid;
	}

	public String getCaPrjid() {
		return caPrjid;
	}

	public void setCaPrjid(String caPrjid) {
		this.caPrjid = caPrjid;
	}

	public String getCaParent() {
		return caParent;
	}

	public void setCaParent(String caParent) {
		this.caParent = caParent;
	}

	public Short getCaLevel() {
		return caLevel;
	}

	public void setCaLevel(Short caLevel) {
		this.caLevel = caLevel;
	}

	public Short getDisplay() {
		return display;
	}

	public void setDisplay(Short display) {
		this.display = display;
	}

	public String getCreatedBy() {
		return createdBy;
	}

	public void setCreatedBy(String createdBy) {
		this.createdBy = createdBy;
	}
	
	
	
}
