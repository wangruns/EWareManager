package cn.it.dao;

import java.util.List;

import cn.it.model.Shelf;

public interface ShelfDao {
	public int addShelf(Shelf shelf);

	public int deleteShelf(String shelfNumber);

	public int updateShelf(Shelf shelf);

	public Shelf findShelfByShelfId(int shelfId);

	public List<Shelf> findShelfLikeShelfNumber(String shelfNumber);

	public List<Shelf> findAll();
}
