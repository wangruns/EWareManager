package cn.it.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.it.model.Brand;
import cn.it.model.Qrcode;
import cn.it.model.Shelf;
import cn.it.model.Type;
import cn.it.service.BrandService;
import cn.it.service.QrcodeService;
import cn.it.service.ShelfService;
import cn.it.service.TypeService;

@Controller
public class BaseInformationController {
	@Autowired
	private TypeService typeService;
	@Autowired
	private BrandService brandService;
	@Autowired
	private ShelfService shelfService;
	@Autowired
	private QrcodeService qrcodeService;

	/*
	 * 模块页面
	 */
	// 商品分类 页面
	@RequestMapping(value = "productType.do")
	public ModelAndView productType(String typeName) {
		ModelAndView modelAndView = new ModelAndView();
		List<Type> listType = typeService.findAll();
		List<String> typeSelectName = new ArrayList<String>();
		for (Type i : listType) {
			typeSelectName.add(i.getTypeName());
		}
		modelAndView.addObject("typeSelectName", typeSelectName);
		modelAndView.setViewName("productType");
		return modelAndView;
	}

	// 商品品牌页面
	@RequestMapping(value = "productBrand.do")
	public ModelAndView productBrand() {
		ModelAndView modelAndView = new ModelAndView();
		List<Brand> listBrandName = brandService.findAll();
		List<String> brandSelectName = new ArrayList<String>();
		for (Brand i : listBrandName) {
			brandSelectName.add(i.getBrandName());
		}
		modelAndView.addObject("brandSelectName", brandSelectName);
		modelAndView.setViewName("productbrand");
		return modelAndView;
	}

	// 货架管理页面
	@RequestMapping(value = "shelf.do")
	public ModelAndView shelf() {
		ModelAndView modelAndView = new ModelAndView();
		List<Shelf> listShelf = shelfService.findAll();
		List<String> shelfSelectName = new ArrayList<String>();
		for (Shelf i : listShelf) {
			shelfSelectName.add(i.getShelfNumber());
		}
		modelAndView.addObject("shelfSelectName", shelfSelectName);
		modelAndView.setViewName("shelf");
		return modelAndView;
	}

	// 条码管理页面
	@RequestMapping(value = "qrcode.do")
	public ModelAndView qrcode() {
		ModelAndView modelAndView = new ModelAndView();
		List<Qrcode> listQrcodeContent = qrcodeService.findAll();
		List<String> qrcodeSelectName = new ArrayList<String>();
		for (Qrcode i : listQrcodeContent) {
			qrcodeSelectName.add(i.getQrContent());
		}
		modelAndView.addObject("qrcodeSelectName", qrcodeSelectName);
		modelAndView.setViewName("qrcode");
		return modelAndView;
	}

	/*
	 * 添加页面
	 */

	// 商品类型添加页面
	@RequestMapping(value = "productTypeAddPage.do")
	public ModelAndView productTypeAddPage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("productTypeAdd");
		// 获取所有的父级类型
		List<Type> fatherTypeList = typeService.getAllFatherType();
		modelAndView.addObject("fatherTypeList", fatherTypeList);
		return modelAndView;
	}

	// 货架编号添加页面
	@RequestMapping(value = "shelfAddPage.do")
	public ModelAndView shelfAddPage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("shelfAdd");
		return modelAndView;
	}

	// 条码编号添加页面
	@RequestMapping(value = "qrcodeAddPage.do")
	public ModelAndView qrcodeAdd() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("qrcodeAdd");
		return modelAndView;
	}

	// 商品品牌添加页面
	@RequestMapping(value = "productBrandAddPage.do")
	public ModelAndView productBrandAddPage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("productBrandAdd");
		return modelAndView;
	}

	/**
	 * 商品类型管理
	 */
	// 查询所有商品类型
	@RequestMapping(value = "productTypeQuery.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productTypeQuery(String typeName) {
		if (typeName == null) {
			typeName = "";
		}
		ModelAndView modelAndView = new ModelAndView();
		List<Type> listType = typeService.queryLikeTypeName(typeName);
		modelAndView.addObject("allTypeName", listType);
		List<Type> listType2 = typeService.findAll();
		List<String> typeSelectName = new ArrayList<String>();
		for (Type i : listType2) {
			typeSelectName.add(i.getTypeName());
		}
		modelAndView.addObject("typeSelectName", typeSelectName);
		modelAndView.setViewName("productType");
		return modelAndView;
	}

	// 商品类型添加
	@RequestMapping(value = "productTypeAdd.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productTypeAdd(Type type) {
		String result = typeService.addType(type);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("addTypeResult", result);
		List<Type> listType = typeService.findAll();
		modelAndView.addObject("allTypeName", listType);
		modelAndView.setViewName("productType");
		return modelAndView;
	}

	// 商品类型删除
	@RequestMapping(value = "productTypeDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String productTypeDelete(Type type) {
		String result = typeService.deleteType(type);
		return result;

	}

	// 商品类型更新
	@RequestMapping(value = "productTypeEdit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productTypeEdit(Type type) {
		String result = typeService.updateType(type);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("success", result);
		List<Type> listType = typeService.findAll();
		modelAndView.addObject("allTypeName", listType);
		modelAndView.setViewName("productType");
		return modelAndView;
	}

	// 商品类型查找
	@RequestMapping(value = "productTypeFind.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productTypeFind(int typeId) {
		Type type = typeService.findTypeBytypeId(typeId);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("success", type);
		modelAndView.setViewName("productType");
		return modelAndView;
	}

	/*
	 * 商品品牌管理
	 */

	// 查询所有商品品牌
	@RequestMapping(value = "brandNameQuery.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView brandNameQuery() {
		List<Brand> listBrandName = brandService.findAll();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("resBrandNameQuery", listBrandName);
		modelAndView.setViewName("productbrand");
		return modelAndView;

	}

	// 商品品牌模糊查找找
	@RequestMapping(value = "QueryBrandLikeName.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView QueryBrandLikeName(String brandName) {
		List<Brand> listBrand = brandService.queryLikeBrandName(brandName);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("resQueryLikeName", listBrand);
		List<Brand> listBrandName = brandService.findAll();
		List<String> brandSelectName = new ArrayList<String>();
		for (Brand i : listBrandName) {
			brandSelectName.add(i.getBrandName());
		}
		modelAndView.addObject("brandSelectName", brandSelectName);
		modelAndView.setViewName("productbrand");
		return modelAndView;

	}

	// 查找商品品牌
	@RequestMapping(value = "productbrandFind.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productbrandFind(String brandName) {
		ModelAndView modelAndView = new ModelAndView();
		Brand brand = brandService.findBrandBybrandName(brandName);
		modelAndView.addObject("success", brand);
		modelAndView.setViewName("productbrand");
		return modelAndView;
	}

	// 品牌添加
	@RequestMapping(value = "addBrand.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addBrand(Brand brand) {
		ModelAndView modelAndView = new ModelAndView();
		String result = brandService.addBrand(brand);
		modelAndView.addObject("resAddBrand", result);
		List<Brand> listBrand = brandService.findAll();
		modelAndView.addObject("resQueryLikeName", listBrand);
		modelAndView.setViewName("productbrand");
		return modelAndView;
	}

	// 删除商品品牌
	@RequestMapping(value = "deleteProductBrand.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String deleteProductBrand(int brandId) {
		String result = brandService.deleteBrand(brandId);
		return result;
	}

	// 修改商品品牌
	@RequestMapping(value = "productBrandEdit.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productBrandEdit(Brand brand) {
		String result = brandService.updateBrand(brand);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("success", result);
		List<Brand> listBrand = brandService.findAll();
		modelAndView.addObject("resBrandNameQuery", listBrand);
		modelAndView.setViewName("productbrand");
		return modelAndView;
	}

	/*
	 * 货架管理
	 */

	// 查找所有的货架编号
	@RequestMapping(value = "shelfNumberQuery.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView shelfNumberQuery() {
		ModelAndView modelAndView = new ModelAndView();
		List<Shelf> listShelf = shelfService.findAll();
		modelAndView.addObject("resshelfNumberQuery", listShelf);
		modelAndView.setViewName("shelf");
		return modelAndView;
	}

	// 模糊查找货架编号
	@RequestMapping(value = "QueryLikeshelfNumber.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView QueryLikeshelfNumber(String shelfNumber) {
		if (shelfNumber == null) {
			shelfNumber = "";
		}
		ModelAndView modelAndView = new ModelAndView();
		List<Shelf> listShelf = shelfService.findShelfLikeShelfNumber(shelfNumber);
		modelAndView.addObject("resQueryLikeNumber", listShelf);
		List<Shelf> listShelf2 = shelfService.findAll();
		List<String> shelfSelectName = new ArrayList<String>();
		for (Shelf i : listShelf2) {
			shelfSelectName.add(i.getShelfNumber());
		}
		modelAndView.addObject("shelfSelectName", shelfSelectName);
		modelAndView.setViewName("shelf");
		return modelAndView;
	}

	// 添加货架编号
	@RequestMapping(value = "addShelf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addShelf(Shelf shelf) {
		ModelAndView modelAndView = new ModelAndView();
		String result = shelfService.addShelf(shelf);
		modelAndView.addObject("resAddShelf", result);
		List<Shelf> listShelf = shelfService.findAll();
		modelAndView.addObject("resQueryLikeNumber", listShelf);
		modelAndView.setViewName("shelf");
		return modelAndView;
	}

	// 修改货架编号
	@RequestMapping(value = "updateShelf.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updateShelf(Shelf shelf) {
		ModelAndView modelAndView = new ModelAndView();
		String result = shelfService.updateShelf(shelf);
		modelAndView.addObject("resUpdateShelf", result);
		List<Shelf> listShelf = shelfService.findAll();
		modelAndView.addObject("resshelfNumberQuery", listShelf);
		modelAndView.setViewName("shelf");
		return modelAndView;
	}

	// 查找货架
	@RequestMapping(value = "shelfFind.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView shelfFind(int shelfId) {
		ModelAndView modelAndView = new ModelAndView();
		Shelf shelf = shelfService.findShelfByShelfId(shelfId);
		modelAndView.addObject("success", shelf);
		modelAndView.setViewName("shelf");
		return modelAndView;
	}

	// 删除货架编号
	@RequestMapping(value = "deleteShelf.do")
	public @ResponseBody String deleteShelf(String shelfNumber) {
		System.out.println(shelfNumber);
		String result = shelfService.deleteShelf(shelfNumber);
		return result;
	}

	/*
	 * 条码管理
	 */

	// 查询所有条码
	@RequestMapping(value = "qrcodeQuery.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView qrcodeQuery() {
		ModelAndView modelAndView = new ModelAndView();
		List<Qrcode> listQrcode = qrcodeService.findAll();
		modelAndView.addObject("resQrcodeQuery", listQrcode);
		modelAndView.setViewName("qrcode");
		return modelAndView;
	}

	// 模糊查找条码
	@RequestMapping(value = "queryQrcodeLikeCont.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView queryQrcodeLikeCont(String qrContent) {
		if (qrContent == null) {
			qrContent = "";
		}
		ModelAndView modelAndView = new ModelAndView();
		List<Qrcode> listQrcode = qrcodeService.findQrcodeLikeQrContent(qrContent);
		modelAndView.addObject("resQueryContent", listQrcode);
		List<Qrcode> listQrcodeContent = qrcodeService.findAll();
		List<String> qrcodeSelectName = new ArrayList<String>();
		for (Qrcode i : listQrcodeContent) {
			qrcodeSelectName.add(i.getQrContent());
		}
		modelAndView.addObject("qrcodeSelectName", qrcodeSelectName);
		modelAndView.setViewName("qrcode");
		return modelAndView;
	}

	// 添加条码
	@RequestMapping(value = "addQrcode.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView addQrcode(Qrcode qrCode) {
		ModelAndView modelAndView = new ModelAndView();
		String result = qrcodeService.addQrcode(qrCode);
		modelAndView.addObject("resAddQrcode", result);
		List<Qrcode> listQrcode = qrcodeService.findAll();
		modelAndView.addObject("resQueryContent", listQrcode);
		modelAndView.setViewName("qrcode");
		return modelAndView;
	}

	// 修改条码
	@RequestMapping(value = "updateQrcode.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updateQrcode(Qrcode qrCode) {
		ModelAndView modelAndView = new ModelAndView();
		String result = qrcodeService.updateQrcode(qrCode);
		modelAndView.addObject("resUpdateQrcode", result);
		modelAndView.setViewName("qrcodeUpdate");
		return modelAndView;
	}

	// 删除条码
	@RequestMapping(value = "deleteQrcode.do")
	public @ResponseBody String deleteQrcode(String qrContent) {
		System.out.println("sd");
		String result = qrcodeService.deleteQrcode(qrContent);
		return result;
	}
}
