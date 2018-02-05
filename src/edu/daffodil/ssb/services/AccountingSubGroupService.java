package edu.daffodil.ssb.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.daffodil.ssb.dao.AccCaSubGroups;
import edu.daffodil.ssb.dao.AccCaSubGroupsDao;

@Service("accCaSubGroupsService")
public class AccountingSubGroupService {
	
	private AccCaSubGroupsDao accCaSubGroupsDao;

	@Autowired
	public void setAccCaSubGroupsDao(AccCaSubGroupsDao accCaSubGroupsDao) {
		this.accCaSubGroupsDao = accCaSubGroupsDao;
	}

	public List<AccCaSubGroups> showAccCaSubGroupsByGroups(int cag_id) {
		return accCaSubGroupsDao.showAccCaSubGroupsByGroups(cag_id);
	}

}
