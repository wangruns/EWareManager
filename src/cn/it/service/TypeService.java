package cn.it.service;

import java.util.List;

import cn.it.model.Type;

public interface TypeService {
	public List<Type> queryLikeTypeName(String typeName);

	public String addType(Type type);

	public String updateType(Type type);

	public List<Type> getAllFatherType();

	public String deleteType(Type type);

	public Type findTypeBytypeId(int typeId);

	public List<Type> findAll();

}
