package edu.daffodil.ssb.dao;

import java.util.Date;

import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.Table;

import org.hibernate.validator.constraints.Email;

@Entity
@Table(name = "employee")
public class Employee {
	
	@Id
	@Column(name ="employeeId")
	private String employeeId;
	
	@Column(name ="employeeName")
	private String employeeName;
	
	@Email
	@Column(name ="email")
	private String email;

	@JoinColumn(name="fkCountry")
	@ManyToOne
	private Country country;
	
	@JoinColumn(name="createdBy")
	@ManyToOne
	private User user;
	
	@Column(name="createdAt")
	private Date createdAt;

	public String getEmployeeId() {
		return employeeId;
	}

	public void setEmployeeId(String employeeId) {
		this.employeeId = employeeId;
	}

	public String getEmployeeName() {
		return employeeName;
	}

	public void setEmployeeName(String employeeName) {
		this.employeeName = employeeName;
	}

	public String getEmail() {
		return email;
	}

	public void setEmail(String email) {
		this.email = email;
	}

	public Country getCountry() {
		return country;
	}

	public void setCountry(Country country) {
		this.country = country;
	}

	public User getUser() {
		return user;
	}

	public void setUser(User user) {
		this.user = user;
	}

	public Date getCreatedAt() {
		return createdAt;
	}

	public void setCreatedAt(Date createdAt) {
		this.createdAt = createdAt;
	}

	@Override
	public String toString() {
		return "Employee [employeeId=" + employeeId + ", employeeName=" + employeeName + ", email=" + email
				+ ", country=" + country + ", user=" + user + ", createdAt=" + createdAt + "]";
	}
	
	
	
}
