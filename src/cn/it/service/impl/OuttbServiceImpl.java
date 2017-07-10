package cn.it.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.it.dao.OuttbDao;
import cn.it.model.ActiveID;
import cn.it.model.Outtb;
import cn.it.service.OuttbService;

@Service
public class OuttbServiceImpl implements OuttbService {

	@Autowired
	private OuttbDao outtbDao;

	public String addOut(Outtb out) {
		if (outtbDao.addOut(out) > 0) {
			return "Success";
		}
		return "Failure";
	}

	public String deleteOut(int outId) {
		if (outtbDao.deleteOut(outId) > 0) {
			return "Success";
		}
		return "Failure";
	}

	public String updateOut(Outtb out) {
		if (outtbDao.updateOut(out) > 0) {
			return "Success";
		}
		return "Failure";
	}

	public List<Outtb> findAll() {
		return outtbDao.findAll();
	}

	public Outtb findOutByOutId(int outId) {
		return outtbDao.findOutByOutId(outId);
	}

	public int lastInsertId() {
		return outtbDao.getLastInsertId();
	}

	public List<ActiveID> getActiveIdAndIdCount(String outDate) {
		return outtbDao.getActiveIdAndIdCount(outDate);
	}

	public List<ActiveID> getPeopleIdAndCount(String outDate) {
		return outtbDao.getPeopleIdAndCount(outDate);
	}

}
