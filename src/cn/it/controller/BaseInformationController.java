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
	 * ģ��ҳ��
	 */
	// ��Ʒ���� ҳ��
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

	// ��ƷƷ��ҳ��
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

	// ���ܹ���ҳ��
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

	// �������ҳ��
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
	 * ���ҳ��
	 */

	// ��Ʒ�������ҳ��
	@RequestMapping(value = "productTypeAddPage.do")
	public ModelAndView productTypeAddPage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("productTypeAdd");
		// ��ȡ���еĸ�������
		List<Type> fatherTypeList = typeService.getAllFatherType();
		modelAndView.addObject("fatherTypeList", fatherTypeList);
		return modelAndView;
	}

	// ���ܱ�����ҳ��
	@RequestMapping(value = "shelfAddPage.do")
	public ModelAndView shelfAddPage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("shelfAdd");
		return modelAndView;
	}

	// ���������ҳ��
	@RequestMapping(value = "qrcodeAddPage.do")
	public ModelAndView qrcodeAdd() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("qrcodeAdd");
		return modelAndView;
	}

	// ��ƷƷ�����ҳ��
	@RequestMapping(value = "productBrandAddPage.do")
	public ModelAndView productBrandAddPage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("productBrandAdd");
		return modelAndView;
	}

	/**
	 * ��Ʒ���͹���
	 */
	// ��ѯ������Ʒ����
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

	// ��Ʒ�������
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

	// ��Ʒ����ɾ��
	@RequestMapping(value = "productTypeDelete.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String productTypeDelete(Type type) {
		String result = typeService.deleteType(type);
		return result;

	}

	// ��Ʒ���͸���
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

	// ��Ʒ���Ͳ���
	@RequestMapping(value = "productTypeFind.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productTypeFind(int typeId) {
		Type type = typeService.findTypeBytypeId(typeId);
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("success", type);
		modelAndView.setViewName("productType");
		return modelAndView;
	}

	/*
	 * ��ƷƷ�ƹ���
	 */

	// ��ѯ������ƷƷ��
	@RequestMapping(value = "brandNameQuery.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView brandNameQuery() {
		List<Brand> listBrandName = brandService.findAll();
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("resBrandNameQuery", listBrandName);
		modelAndView.setViewName("productbrand");
		return modelAndView;

	}

	// ��ƷƷ��ģ��������
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

	// ������ƷƷ��
	@RequestMapping(value = "productbrandFind.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView productbrandFind(String brandName) {
		ModelAndView modelAndView = new ModelAndView();
		Brand brand = brandService.findBrandBybrandName(brandName);
		modelAndView.addObject("success", brand);
		modelAndView.setViewName("productbrand");
		return modelAndView;
	}

	// Ʒ�����
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

	// ɾ����ƷƷ��
	@RequestMapping(value = "deleteProductBrand.do", method = { RequestMethod.GET, RequestMethod.POST })
	public @ResponseBody String deleteProductBrand(int brandId) {
		String result = brandService.deleteBrand(brandId);
		return result;
	}

	// �޸���ƷƷ��
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
	 * ���ܹ���
	 */

	// �������еĻ��ܱ��
	@RequestMapping(value = "shelfNumberQuery.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView shelfNumberQuery() {
		ModelAndView modelAndView = new ModelAndView();
		List<Shelf> listShelf = shelfService.findAll();
		modelAndView.addObject("resshelfNumberQuery", listShelf);
		modelAndView.setViewName("shelf");
		return modelAndView;
	}

	// ģ�����һ��ܱ��
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

	// ��ӻ��ܱ��
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

	// �޸Ļ��ܱ��
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

	// ���һ���
	@RequestMapping(value = "shelfFind.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView shelfFind(int shelfId) {
		ModelAndView modelAndView = new ModelAndView();
		Shelf shelf = shelfService.findShelfByShelfId(shelfId);
		modelAndView.addObject("success", shelf);
		modelAndView.setViewName("shelf");
		return modelAndView;
	}

	// ɾ�����ܱ��
	@RequestMapping(value = "deleteShelf.do")
	public @ResponseBody String deleteShelf(String shelfNumber) {
		System.out.println(shelfNumber);
		String result = shelfService.deleteShelf(shelfNumber);
		return result;
	}

	/*
	 * �������
	 */

	// ��ѯ��������
	@RequestMapping(value = "qrcodeQuery.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView qrcodeQuery() {
		ModelAndView modelAndView = new ModelAndView();
		List<Qrcode> listQrcode = qrcodeService.findAll();
		modelAndView.addObject("resQrcodeQuery", listQrcode);
		modelAndView.setViewName("qrcode");
		return modelAndView;
	}

	// ģ����������
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

	// �������
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

	// �޸�����
	@RequestMapping(value = "updateQrcode.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView updateQrcode(Qrcode qrCode) {
		ModelAndView modelAndView = new ModelAndView();
		String result = qrcodeService.updateQrcode(qrCode);
		modelAndView.addObject("resUpdateQrcode", result);
		modelAndView.setViewName("qrcodeUpdate");
		return modelAndView;
	}

	// ɾ������
	@RequestMapping(value = "deleteQrcode.do")
	public @ResponseBody String deleteQrcode(String qrContent) {
		System.out.println("sd");
		String result = qrcodeService.deleteQrcode(qrContent);
		return result;
	}
}
