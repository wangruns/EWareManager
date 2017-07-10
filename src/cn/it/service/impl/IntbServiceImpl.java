package cn.it.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.it.dao.IntbDao;
import cn.it.model.ActiveID;
import cn.it.model.Intb;
import cn.it.service.IntbService;

@Service
public class IntbServiceImpl implements IntbService {

	@Autowired
	private IntbDao intbDao;

	public String addIn(Intb in) {
		if (intbDao.addIn(in) > 0) {
			return "Success";
		}
		return "Failure";
	}

	public String deleteIn(int inId) {
		if (intbDao.deleteIn(inId) > 0) {
			return "Success";
		}
		return "Failure";
	}

	public String updateIn(Intb in) {
		if (intbDao.updateIn(in) > 0) {
			return "Success";
		}
		return "Failure";
	}

	public List<Intb> findAll() {
		return intbDao.findAll();
	}

	public Intb findInByInId(int inId) {
		return intbDao.findInByInId(inId);
	}

	public List<ActiveID> getActiveIdAndIdCount(String inDate) {
		return intbDao.getActiveIdAndIdCount(inDate);

	}

	public List<ActiveID> getPeopleIdAndCount(String inDate) {
		return intbDao.getPeopleIdAndCount(inDate);
	}

}
