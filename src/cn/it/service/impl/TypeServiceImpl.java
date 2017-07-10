package cn.it.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.it.dao.TypeDao;
import cn.it.model.Type;
import cn.it.service.TypeService;

@Service
public class TypeServiceImpl implements TypeService {
	@Autowired
	private TypeDao typeDao;

	public List<Type> queryLikeTypeName(String typeName) {
		List<Type> listQueryType = typeDao.findTypeLikeTypeName(typeName);
		return listQueryType;
	}

	public String addType(Type type) {
		if (typeDao.addType(type) > 0) {
			return "Success";
		}
		return "Failure";
	}

	// 获取所有的父级类型
	public List<Type> getAllFatherType() {
		List<Type> resList = typeDao.getAllFatherType();
		return resList;
	}

	public String deleteType(Type type) {
		int i = -1;
		try {
			i = typeDao.deleteType(type);
		} catch (Exception e) {
			System.out.println(i);
		}
		if (i > 0) {
			return "Success";
		}
		return "Failure";
	}

	public String updateType(Type type) {
		int i = -1;
		try {
			i = typeDao.updateType(type);
		} catch (Exception e) {
			System.out.println(i);
		}
		if (i > 0) {
			return "Success";
		}
		return "Failure";
	}

	public Type findTypeBytypeId(int typeId) {
		return typeDao.findTypeBytypeId(typeId);
	}

	public List<Type> findAll() {
		return typeDao.findAll();
	}

}
