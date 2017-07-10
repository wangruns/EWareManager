package cn.it.service;

import java.util.List;

import cn.it.model.ActiveID;
import cn.it.model.Intb;

public interface IntbService {
	public String addIn(Intb in);

	public String deleteIn(int inId);

	public String updateIn(Intb in);

	public List<Intb> findAll();

	public Intb findInByInId(int inId);

	public List<ActiveID> getActiveIdAndIdCount(String inDate);

	public List<ActiveID> getPeopleIdAndCount(String inDate);

}
