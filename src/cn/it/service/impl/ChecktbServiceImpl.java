package cn.it.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.it.dao.ChecktbDao;
import cn.it.model.CheckShowAll;
import cn.it.model.Checktb;
import cn.it.service.ChecktbService;

@Service
public class ChecktbServiceImpl implements ChecktbService {

	@Autowired
	private ChecktbDao checktbDao;

	public String addCheck(Checktb checktb) {
		if (checktbDao.addCheck(checktb) > 0) {
			return "Success";
		}
		return "Failure";
	}

	public String deleteCheck(int checkId) {
		int i = -1;
		try {
			i = checktbDao.deleteCheck(checkId);
		} catch (Exception e) {
			System.out.println(i);
		}
		if (i > 0) {
			return "Success";
		}
		return "Failure";
	}

	public String updateCheck(Checktb checktb) {
		int i = -1;
		try {
			i = checktbDao.updateCheck(checktb);
		} catch (Exception e) {
			System.out.println(i);
		}
		if (i > 0) {
			return "Success";
		}
		return "Failure";
	}

	public List<Checktb> findAll() {
		return checktbDao.findAll();
	}

	public Checktb findCheckBycheckId(int checkId) {
		return checktbDao.findCheckBycheckId(checkId);
	}

	@Override
	public List<CheckShowAll> getCheckShow() {
		return checktbDao.getCheckShow();
	}

}
