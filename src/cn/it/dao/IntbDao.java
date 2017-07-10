package cn.it.dao;

import java.util.List;

import cn.it.model.ActiveID;
import cn.it.model.Intb;

public interface IntbDao {

	public int addIn(Intb in);

	public int deleteIn(int inId);

	public int updateIn(Intb in);

	public List<Intb> findAll();

	public Intb findInByInId(int inId);

	public Intb findInByProductId(int productId);

	public List<ActiveID> getActiveIdAndIdCount(String inDate);

	public List<ActiveID> getPeopleIdAndCount(String inDate);

}
