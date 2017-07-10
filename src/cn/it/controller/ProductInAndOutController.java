package cn.it.controller;

import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Hashtable;
import java.util.List;

import javax.imageio.ImageIO;
import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import com.google.zxing.BarcodeFormat;
import com.google.zxing.EncodeHintType;
import com.google.zxing.MultiFormatWriter;
import com.google.zxing.common.BitMatrix;

import cn.it.model.Brand;
import cn.it.model.Customer;
import cn.it.model.Intb;
import cn.it.model.Outtb;
import cn.it.model.Product;
import cn.it.model.Provider;
import cn.it.model.Shelf;
import cn.it.model.Type;
import cn.it.service.BrandService;
import cn.it.service.CustomerService;
import cn.it.service.OuttbService;
import cn.it.service.ProductInService;
import cn.it.service.ProductService;
import cn.it.service.ProviderService;
import cn.it.service.ShelfService;
import cn.it.service.TypeService;
import cn.it.service.UserService;

@Controller
public class ProductInAndOutController {
	@Autowired
	private UserService userService;
	@Autowired
	private ProductService productService;
	@Autowired
	private ProviderService providerService;
	@Autowired
	private BrandService brandService;
	@Autowired
	private ShelfService shelfService;
	@Autowired
	private ProductInService productInService;
	@Autowired
	private TypeService typeService;
	@Autowired
	private CustomerService customerService;
	@Autowired
	private OuttbService productOutService;

	/**
	 * 
	 * 產品入庫
	 * 
	 */
	// 商品入库页
	@RequestMapping(value = "productInPage.do")
	public ModelAndView productInPage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("productIn");
		// 商品分类List
		List<Type> typeList = typeService.findAll();
		modelAndView.addObject("typeList", typeList);
		// 供应商List
		List<Provider> providerList = providerService.findAllProvider();
		modelAndView.addObject("providerList", providerList);
		// 品牌List
		List<Brand> brandList = brandService.findAll();
		modelAndView.addObject("brandList", brandList);
		// 货架List
		List<Shelf> shelfList = shelfService.findAll();
		modelAndView.addObject("shelfList", shelfList);
		return modelAndView;
	}

	// 商品入库动作
	@RequestMapping(value = "productInAction.do")
	public ModelAndView productInAction(Product product, int providerId, HttpServletRequest resquest) {
		ModelAndView modelAndView = new ModelAndView();
		// 添加商品记录记录并返回插入的ID
		productService.addProduct(product);
		int productId = productService.lastInsertId();
		// 添加入库记录
		Intb intb = new Intb();
		intb.setProductId(productId);
		intb.setShelfId(product.getShelfId());
		intb.setProviderId(providerId);
		productInService.addProductIn(intb);
		// qrCode
		String keycode = productId + "";
		BufferedImage image = getBarcode(keycode);
		try {
			ImageIO.write(image, "png", new File(resquest.getRealPath("/images/qrCode.png")));
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 开始具体商品的录入
		modelAndView.addObject("productId", productId);
		modelAndView.setViewName("productInPage");
		String productName = product.getProductName();
		int productPlanInNumber = product.getProductNumber();
		modelAndView.addObject("productName", productName);
		modelAndView.addObject("productPlanInNumber", productPlanInNumber);
		modelAndView.addObject("userName", resquest.getSession().getAttribute("userName"));
		return modelAndView;
	}

	// 验证码结果确定productInScanVerify
	@RequestMapping(value = "productInScanVerify.do")
	public @ResponseBody String productInScanVerify(@RequestParam(value = "productId") int productId,
			@RequestParam(value = "planInNumber") int planInNumber) {
		Intb productIn = productInService.findProductByProductId(productId);
		int productNumber = productIn.getInNumber();
		// //这里做出修改（当实际出库数量等于计划出库数量的时候才返回成功）2017年7月4日17:08:42
		// if (productNumber == 0) {
		// return "no";
		// } else {
		// return "ok";
		// }
		int productInNumber = productIn.getInNumber();
		if (productInNumber != planInNumber) {
			return productInNumber + "";
		} else {
			return "ok";
		}

	}

	// 扫描入库成功
	@RequestMapping(value = "productInScanOK.do")
	public ModelAndView productInScanOK() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("scanHandle");
		return modelAndView;
	}

	/**
	 * 
	 * 產品出庫
	 * 
	 */
	@RequestMapping(value = "productOutPage.do")
	public ModelAndView productOutPage() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("productOut");
		// 返回商品分类List(這裡的貨物必須是存庫中實際上有的)
		List<Intb> intbList = productInService.getAll();
		List<Product> productList = new ArrayList<Product>();
		for (Intb in : intbList) {
			Product product = productService.findProductById(in.getProductId());
			if (!productList.contains(product)) {
				productList.add(product);
			}
		}
		modelAndView.addObject("productList", productList);
		// 返回客户信息
		List<Customer> customerList = customerService.findAll();
		modelAndView.addObject("customerList", customerList);
		// 获取第一个商品的货架信息
		Shelf shelf = null;
		if (productList.size() > 0) {
			shelf = shelfService.findShelfByShelfId(productList.get(0).getShelfId());
		}
		modelAndView.addObject("firstProductsShelf", shelf);
		return modelAndView;
	}

	// 根据出库商品ID获取对应的货架编号
	@RequestMapping(value = "getProductShelfInfo.do")
	public @ResponseBody String getProductShelfInfo(int productId) {
		Shelf shelf = shelfService.findShelfByShelfId(productInService.findProductByProductId(productId).getShelfId());
		String shelfId = shelf.getShelfId() + "@";
		String shelfNumber = shelf.getShelfNumber();
		return shelfId + shelfNumber;
	}

	// 商品出库动作
	@RequestMapping(value = "productOutAction.do")
	public ModelAndView productOutAction(Outtb productOut, HttpServletRequest resquest) {
		ModelAndView modelAndView = new ModelAndView();
		productOutService.addOut(productOut);
		// qrCode
		int productOutId = productOutService.lastInsertId();
		String keycode = productOutId + "";
		BufferedImage image = getBarcode(keycode);
		try {
			ImageIO.write(image, "png", new File(resquest.getRealPath("/images/qrCodeOut.png")));
		} catch (IOException e) {
			e.printStackTrace();
		}
		// 开始具体商品的出库
		int productPlanOutNumber = productOut.getPlanOutNumber();
		String productName = productService.findProductById(productOut.getProductId()).getProductName();
		modelAndView.addObject("productPlanOutNumber", productPlanOutNumber);
		modelAndView.addObject("productOutId", productOutId);
		modelAndView.addObject("productName", productName);
		modelAndView.addObject("userName", resquest.getSession().getAttribute("userName"));
		modelAndView.setViewName("productOutPage");
		return modelAndView;
	}

	// 扫描出库成功
	@RequestMapping(value = "productOutScanOK.do")
	public ModelAndView productOutScanOK() {
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.setViewName("scanOutHandle");
		return modelAndView;
	}

	// 验证码结果确定productOutScanVerify
	@RequestMapping(value = "productOutScanVerify.do")
	public @ResponseBody String productOutScanVerify(@RequestParam(value = "productOutId") int productOutId,
			@RequestParam(value = "planOutNumber") int planOutNumber) {
		Outtb productOut = productOutService.findOutByOutId(productOutId);
		// //这里做出修改（当实际出库数量等于计划出库数量的时候才返回成功）2017年7月4日15:37:38
		// int productNumber = productIn.getOutNumber();
		// if (productNumber == 0) {
		// return "no";
		// } else {
		// return "ok";
		// }
		int productOutNumber = productOut.getOutNumber();
		if (productOutNumber != planOutNumber) {
			return productOutNumber + "";
		} else {
			return "ok";
		}
	}

	// 生成条形码
	private BufferedImage getBarcode(String str) {
		int width = 300;
		int height = 100;
		try {
			// 文字编码
			int BLACK = 0xff000000;
			int WHITE = 0xFFFFFFFF;
			String CODE = "utf-8";
			Hashtable<EncodeHintType, String> hints = new Hashtable<EncodeHintType, String>();
			hints.put(EncodeHintType.CHARACTER_SET, CODE);
			BitMatrix bitMatrix = new MultiFormatWriter().encode(str, BarcodeFormat.CODE_128, width, height, hints);

			BufferedImage image = new BufferedImage(width, height, BufferedImage.TYPE_INT_ARGB);
			for (int x = 0; x < width; x++) {
				for (int y = 0; y < height; y++) {
					image.setRGB(x, y, bitMatrix.get(x, y) ? BLACK : WHITE);
				}
			}
			return image;
		} catch (Exception e) {
			e.printStackTrace();
		}
		return null;
	}

}
