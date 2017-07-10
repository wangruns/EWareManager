package cn.it.dao;

import java.util.List;

import cn.it.model.CheckShowAll;
import cn.it.model.Checktb;

public interface ChecktbDao {
	public int addCheck(Checktb checktb);

	public int deleteCheck(int checkId);

	public int updateCheck(Checktb checktb);

	public List<Checktb> findAll();

	public Checktb findCheckBycheckId(int checkId);
	
	public List<CheckShowAll> getCheckShow();

}
