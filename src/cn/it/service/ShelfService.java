package cn.it.service;

import java.util.List;

import cn.it.model.Shelf;

public interface ShelfService {
	public String addShelf(Shelf shelf);

	public String deleteShelf(String shelfNumber);

	public String updateShelf(Shelf shelf);

	public Shelf findShelfByShelfId(int shelfId);

	public List<Shelf> findShelfLikeShelfNumber(String shelfNumber);

	public List<Shelf> findAll();

}
