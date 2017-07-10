package cn.it.dao;

import java.util.List;

import cn.it.model.Type;

public interface TypeDao {
	public int addType(Type type);

	public List<Type> getAllFatherType();

	public int deleteType(Type type);

	public int updateType(Type type);

	public List<Type> findTypeLikeTypeName(String typeName);

	public List<Type> findAll();

	public Type findTypeBytypeId(int typeId);
}
