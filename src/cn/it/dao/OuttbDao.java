package cn.it.dao;

import java.util.List;

import cn.it.model.ActiveID;
import cn.it.model.Outtb;

public interface OuttbDao {

	public int addOut(Outtb out);

	public int deleteOut(int outId);

	public int updateOut(Outtb out);

	public List<Outtb> findAll();

	public Outtb findOutByOutId(int outId);

	public int getLastInsertId();

	public List<ActiveID> getActiveIdAndIdCount(String outDate);

	public List<ActiveID> getPeopleIdAndCount(String outDate);

}
