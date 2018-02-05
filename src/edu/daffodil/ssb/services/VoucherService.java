package edu.daffodil.ssb.services;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import edu.daffodil.ssb.dao.AccBankAccount;
import edu.daffodil.ssb.dao.AccountingChart;
import edu.daffodil.ssb.dao.Project;
import edu.daffodil.ssb.dao.VoucherDao;
import edu.daffodil.ssb.dao.VoucherDetail;
import edu.daffodil.ssb.dao.VoucherMaster;

@Service("voucherservice")
public class VoucherService {
	
	private VoucherDao voucherDao;
	@Autowired
	public void setVoucherDao(VoucherDao voucherDao) {
		this.voucherDao = voucherDao;
	}
	
public List<AccountingChart> showChartOfAccount() {
		System.out.println("inside service");
		return voucherDao.showChartOfAccount();
	}

public void saveVoucherMaster(VoucherMaster voucherMaster) {
	voucherDao.saveVoucherMaster(voucherMaster);
	System.out.println("Services "+voucherMaster.toString());
	
}

public void saveVoucherDetail(VoucherDetail voucherDetail) {
	voucherDao.saveVoucherDetail(voucherDetail);
	System.out.println("Services "+voucherDetail.toString());
	
}

public List<AccBankAccount> showbankAccount() {
	System.out.println("show bank inside service");
	return voucherDao.showbankAccount();
}

public List<Project> showProject() {
	System.out.println("show bank inside service");
	return voucherDao.showProject();
}

	
}
