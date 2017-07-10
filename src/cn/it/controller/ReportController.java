package cn.it.controller;

import java.util.ArrayList;
import java.util.HashMap;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.it.model.ActiveID;
import cn.it.model.Checktb;
import cn.it.model.Intb;
import cn.it.model.Outtb;
import cn.it.model.Product;
import cn.it.service.ChecktbService;
import cn.it.service.CustomerService;
import cn.it.service.IntbService;
import cn.it.service.OuttbService;
import cn.it.service.ProductService;
import cn.it.service.ProviderService;

@Controller
public class ReportController {
	@Autowired
	private ChecktbService checktbService;
	@Autowired
	private ProductService productService;
	@Autowired
	private OuttbService outtbService;
	@Autowired
	private IntbService intbService;
	@Autowired
	private ProviderService providerService;
	@Autowired
	private CustomerService customerService;

	/*
	 * 出库一览
	 */
	// 查询所有出库表
	@RequestMapping(value = "checktbListOuttb.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView checktbListOuttb() {
		ModelAndView modelAndView = new ModelAndView();
		List<Outtb> listOuttb = outtbService.findAll();
		modelAndView.addObject("resQueryouttbList", listOuttb);

		List<String> listOutProductname = new ArrayList<String>();
		for (Outtb i : listOuttb) {
			String res = productService.findProductById(i.getProductId()).getProductName();
			listOutProductname.add(res);
		}
		modelAndView.addObject("resoutProductName", listOutProductname);
		modelAndView.setViewName("outboundtb");
		return modelAndView;
	}

	/*
	 * 入库一览
	 */
	// 查询所有入库表
	@RequestMapping(value = "intbListOuttb.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView intbListOuttb() {
		ModelAndView modelAndView = new ModelAndView();
		List<Intb> listIntb = intbService.findAll();
		modelAndView.addObject("resQueryintbList", listIntb);
		List<String> listInProductname = new ArrayList<String>();
		for (Intb i : listIntb) {
			String res = productService.findProductById(i.getProductId()).getProductName();
			listInProductname.add(res);
		}
		modelAndView.addObject("resProductName", listInProductname);
		modelAndView.setViewName("warehousingtb");
		return modelAndView;
	}

	/*
	 * 盘点一览表
	 */
	@RequestMapping(value = "checktbListQuery.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView checktbListQuery() {
		ModelAndView modelAndView = new ModelAndView();
		List<Checktb> listChecktb = checktbService.findAll();
		modelAndView.addObject("resQuerychecktbList", listChecktb);

		List<String> listCheckProductname = new ArrayList<String>();
		for (Checktb i : listChecktb) {
			String res = productService.findProductById(i.getProductId()).getProductName();
			listCheckProductname.add(res);
		}
		modelAndView.addObject("resChecktbProductName", listCheckProductname);
		modelAndView.setViewName("inventorytb");
		return modelAndView;
	}

	/*
	 * 库存一览
	 */
	@RequestMapping(value = "productListQuery.do")
	public ModelAndView productListQuery() {
		ModelAndView modelAndView = new ModelAndView();
		List<Product> listProduct = productService.findAll();
		modelAndView.addObject("resQueryproductList", listProduct);
		List<String> listProductname = new ArrayList<String>();
		for (Product i : listProduct) {
			String res = productService.findProductById(i.getProductId()).getProductName();
			listProductname.add(res);
		}
		modelAndView.addObject("resProductName", listProductname);
		modelAndView.setViewName("producttb");
		return modelAndView;
	}

	/*
	 * 库存损益分析
	 * 
	 */

	@RequestMapping(value = "analysisPage.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView analysisPage() {
		ModelAndView modelAndView = new ModelAndView();

		Map<String, Integer> mapProductTopInnum = new HashMap<String, Integer>();

		// 找出进货次数最多的商品
		List<Intb> listIntb = intbService.findAll();
		Map<Integer, Integer> mapIntbNum = new HashMap<Integer, Integer>();
		List<String> listInProductname = new ArrayList<String>();
		for (Intb i : listIntb) {
			int id = i.getProductId();
			Set<Integer> listKey = mapIntbNum.keySet();
			if (listKey.contains(id)) {
				int currentValue = mapIntbNum.get(id);
				currentValue++;
				mapIntbNum.put(id, currentValue);
			} else {
				mapIntbNum.put(id, 1);
			}
			String res = productService.findProductById(i.getProductId()).getProductName();
			listInProductname.add(res);

		}
		Map<Integer, Integer> result1 = new LinkedHashMap<Integer, Integer>();
		mapIntbNum.entrySet().stream().sorted(Map.Entry.<Integer, Integer>comparingByValue().reversed())
				.forEachOrdered(x -> result1.put(x.getKey(), x.getValue()));

		Set<Integer> listKey1 = result1.keySet();
		int i = 0;
		if (mapIntbNum.size() > 5) {
			// mapProductTopInnum.put(listInProductname[i],result1.get(listKey1.))
		}

		modelAndView.addObject("resProduntInNum", result1);
		modelAndView.addObject("resProductInName", listInProductname);
		// System.out.println(result1);

		// 找出出货次数最多的商品
		List<Outtb> listOuttb = outtbService.findAll();
		Map<Integer, Integer> mapOuttbNum = new HashMap<Integer, Integer>();
		List<String> listOutProductname = new ArrayList<String>();
		for (Outtb k : listOuttb) {
			int id = k.getProductId();
			Set<Integer> listKey = mapOuttbNum.keySet();
			if (listKey.contains(id)) {
				int currentValue = mapOuttbNum.get(id);
				currentValue++;
				mapOuttbNum.put(id, currentValue);

			} else {
				mapOuttbNum.put(id, 1);
			}
			String res = productService.findProductById(k.getProductId()).getProductName();
			listOutProductname.add(res);

		}
		Map<Integer, Integer> result2 = new LinkedHashMap<Integer, Integer>();
		mapOuttbNum.entrySet().stream().sorted(Map.Entry.<Integer, Integer>comparingByValue().reversed())
				.forEachOrdered(x -> result2.put(x.getKey(), x.getValue()));
		modelAndView.addObject("resOutproductNum", result2);
		modelAndView.addObject("resProductOutName", listOutProductname);
		// System.out.println(result2);

		// 找出进货次数最多的供应商
		List<Intb> listintbProvider = intbService.findAll();
		List<String> listProvidername = new ArrayList<String>();
		Map<Integer, Integer> mapProvider = new HashMap<Integer, Integer>();
		for (Intb g : listintbProvider) {
			int id = g.getProductId();
			Set<Integer> listKey = mapProvider.keySet();
			if (listKey.contains(id)) {
				int currentValue = mapProvider.get(id);
				currentValue++;
				mapProvider.put(id, currentValue);
			} else {
				mapProvider.put(id, 1);
			}
			listProvidername.add(providerService.findProviderByProviderId(g.getProviderId()).getProviderName());
		}
		Map<Integer, Integer> result3 = new LinkedHashMap<Integer, Integer>();
		mapProvider.entrySet().stream().sorted(Map.Entry.<Integer, Integer>comparingByValue().reversed())
				.forEachOrdered(x -> result3.put(x.getKey(), x.getValue()));
		modelAndView.addObject("providerName", listProvidername);
		modelAndView.addObject("resInprovider", result3);
		// System.out.println(result3);

		// 找出出货次数最多的客户
		List<Outtb> listouttbCustomer = outtbService.findAll();
		Map<Integer, Integer> mapCustomer = new HashMap<Integer, Integer>();
		List<String> listCustomername = new ArrayList<String>();
		for (Outtb x : listouttbCustomer) {
			int id = x.getCustomerId();
			Set<Integer> listKey = mapCustomer.keySet();
			if (listKey.contains(id)) {
				int currentValue = mapCustomer.get(id);
				currentValue++;
				mapCustomer.put(id, currentValue);
			} else {
				mapCustomer.put(id, 1);
			}
			listCustomername.add(customerService.findCustomerByCustomerId(x.getCustomerId()).getCustomerName());

		}
		Map<Integer, Integer> result4 = new LinkedHashMap<Integer, Integer>();
		mapCustomer.entrySet().stream().sorted(Map.Entry.<Integer, Integer>comparingByValue().reversed())
				.forEachOrdered(x -> result4.put(x.getKey(), x.getValue()));
		modelAndView.addObject("cutomerName", listCustomername);
		modelAndView.addObject("resOutCustomer", result4);
		// System.out.println(result4);

		modelAndView.setViewName("analysistb");
		return modelAndView;
	}

	/*
	 * 根据日期进行分析
	 * 
	 */
	@RequestMapping(value = "analysisByDate.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView analysisByDate(int yearnub, int monthnub) {
		ModelAndView modelAndView = new ModelAndView();
		String strDate = yearnub + "-" + monthnub;
		if (monthnub < 10) {
			strDate = yearnub + "-0" + monthnub;
		}

		// System.out.println(strDate);
		// 进货次数最多的商品
		Map<String, Integer> mapProductInnumByDate = new HashMap<String, Integer>();
		List<ActiveID> listactivateID1 = intbService.getActiveIdAndIdCount(strDate);
		List<String> listInProductname = new ArrayList<String>();
		System.out.println("进货商品：");
		for (ActiveID a : listactivateID1) {
			mapProductInnumByDate.put(productService.findProductById(a.getId()).getProductName(), a.getIdCountNumber());
			listInProductname.add(productService.findProductById(a.getId()).getProductName());
			System.out.println(productService.findProductById(a.getId()).getProductName() + ":" + a.getIdCountNumber());
		}
		modelAndView.addObject("resProduntInNum", mapProductInnumByDate);
		modelAndView.addObject("resProductInName", listInProductname);
		// modelAndView.addObject("resProduntInNum", mapProductInnumByDate);
		// 出货次数最多的商品
		Map<String, Integer> mapProductOutnumByDate = new HashMap<String, Integer>();
		List<String> listOutProductname = new ArrayList<String>();
		List<ActiveID> listactivateID2 = outtbService.getActiveIdAndIdCount(strDate);
		System.out.println("出货商品：");
		for (ActiveID a : listactivateID2) {
			mapProductOutnumByDate.put(productService.findProductById(a.getId()).getProductName(),
					a.getIdCountNumber());
			listOutProductname.add(productService.findProductById(a.getId()).getProductName());
			System.out.println(productService.findProductById(a.getId()).getProductName() + ":" + a.getIdCountNumber());
		}
		modelAndView.addObject("resProductOutName", listOutProductname);
		modelAndView.addObject("resOutproductNum", mapProductOutnumByDate);
		// modelAndView.addObject("resOutproductNum", mapProductOutnumByDate);

		// 供货次数最多的供应商
		Map<String, Integer> mapProviderNumByDate = new HashMap<String, Integer>();
		List<String> listProvidername = new ArrayList<String>();
		List<ActiveID> listactivateID3 = intbService.getPeopleIdAndCount(strDate);
		System.out.println("供应商：");
		for (ActiveID a : listactivateID3) {
			mapProviderNumByDate.put(providerService.findProviderByProviderId(a.getId()).getProviderName(),
					a.getIdCountNumber());
			listProvidername.add(providerService.findProviderByProviderId(a.getId()).getProviderName());
			System.out.println(
					providerService.findProviderByProviderId(a.getId()).getProviderName() + ":" + a.getIdCountNumber());
		}
		modelAndView.addObject("providerName", listProvidername);
		modelAndView.addObject("resInprovider", mapProviderNumByDate);
		// modelAndView.addObject("resInprovider", mapProviderNumByDate);
		// 订货次数最多的客户
		Map<String, Integer> mapCustomerNumByDate = new HashMap<String, Integer>();
		List<String> listCustomername = new ArrayList<String>();
		List<ActiveID> lisactivateID4 = outtbService.getPeopleIdAndCount(strDate);
		System.out.println("客户：");
		for (ActiveID a : lisactivateID4) {
			mapCustomerNumByDate.put(customerService.findCustomerByCustomerId(a.getId()).getCustomerName(),
					a.getIdCountNumber());
			listCustomername.add(customerService.findCustomerByCustomerId(a.getId()).getCustomerName());
			System.out.println(
					customerService.findCustomerByCustomerId(a.getId()).getCustomerName() + ":" + a.getIdCountNumber());
		}
		modelAndView.addObject("cutomerName", listCustomername);
		modelAndView.addObject("resOutCustomer", mapCustomerNumByDate);
		// modelAndView.addObject("resOutproductNum", mapCustomerNumByDate);
		modelAndView.setViewName("analysistb");
		return modelAndView;
	}

}
