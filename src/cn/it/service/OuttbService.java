package cn.it.service;

import java.util.List;

import cn.it.model.ActiveID;
import cn.it.model.Outtb;

public interface OuttbService {
	public String addOut(Outtb out);

	public String deleteOut(int outId);

	public String updateOut(Outtb out);

	public List<Outtb> findAll();

	public Outtb findOutByOutId(int outId);

	public int lastInsertId();

	public List<ActiveID> getActiveIdAndIdCount(String outDate);

	public List<ActiveID> getPeopleIdAndCount(String outDate);

}
