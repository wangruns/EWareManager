package cn.it.service;

import java.util.List;

import cn.it.model.CheckShowAll;
import cn.it.model.Checktb;

public interface ChecktbService {
	public String addCheck(Checktb check);

	public String deleteCheck(int checkId);

	public String updateCheck(Checktb check);

	public List<Checktb> findAll();

	public Checktb findCheckBycheckId(int checkId);
	
	public List<CheckShowAll> getCheckShow();

}
