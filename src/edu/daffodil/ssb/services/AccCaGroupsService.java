package edu.daffodil.ssb.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.daffodil.ssb.dao.AccCaGroups;
import edu.daffodil.ssb.dao.AccCaGroupsDao;



@Service("accCaGroupsService")
public class AccCaGroupsService {
	
	private AccCaGroupsDao accCaGroupsDao;
	
	@Autowired
	public void setAccCaGroupsDao(AccCaGroupsDao accCaGroupsDao) {
		this.accCaGroupsDao = accCaGroupsDao;
	}
	public List<AccCaGroups> showAccCaGroup() {
		
		return accCaGroupsDao.showAccCaGroups();
	}
	public void saveAccCaGroups(AccCaGroups accCaGroups) {
		accCaGroupsDao.saveAccCaGroup(accCaGroups);
		
	}
	public List<AccCaGroups> showAccCaGroupTable() {
		
		return accCaGroupsDao.showAccCaGroupsTable();
	}
	public void updateAccCaGroups(AccCaGroups accCaGroups) {
		accCaGroupsDao.updateAccCaGroups(accCaGroups);
		
	}
	public AccCaGroups showAccCaGroupById(int cag_id) {
		// TODO Auto-generated method stub
		return accCaGroupsDao.showAccCaGroupsById(cag_id);
	}
	public void deleteAccCaGroups(AccCaGroups cag_id) {
		// TODO Auto-generated method stub
		accCaGroupsDao.deleteAccCaGroups(cag_id);
	}
	
	


}
