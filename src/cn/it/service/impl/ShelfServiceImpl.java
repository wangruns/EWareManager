package cn.it.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.it.dao.ShelfDao;
import cn.it.model.Shelf;
import cn.it.service.ShelfService;

@Service
public class ShelfServiceImpl implements ShelfService {

	@Autowired
	private ShelfDao shelfDao;

	public String addShelf(Shelf shelf) {
		int i = -1;
		try {
			i = shelfDao.addShelf(shelf);
		} catch (Exception e) {
			System.out.println(i);
		}
		if (i > 0) {
			return "Success";
		}
		return "Failure";
	}

	public String deleteShelf(String shelfNumber) {
		int i = -1;
		try {
			i = shelfDao.deleteShelf(shelfNumber);
		} catch (Exception e) {
			System.out.println(i);
		}
		if (i > 0) {
			return "Success";
		}
		return "Failure";
	}

	public String updateShelf(Shelf shelf) {
		int i = -1;
		try {
			i = shelfDao.updateShelf(shelf);
		} catch (Exception e) {
			System.out.println(i);
		}
		if (i > 0) {
			return "Success";
		}
		return "Failure";
	}

	public List<Shelf> findShelfLikeShelfNumber(String shelfNumber) {
		return shelfDao.findShelfLikeShelfNumber(shelfNumber);
	}

	public List<Shelf> findAll() {
		return shelfDao.findAll();
	}

	public Shelf findShelfByShelfId(int shelfId) {
		return shelfDao.findShelfByShelfId(shelfId);
	}

}
