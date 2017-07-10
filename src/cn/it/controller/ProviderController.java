package cn.it.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import cn.it.model.Provider;
import cn.it.service.ProviderService;

@Controller
public class ProviderController {

	@Autowired
	private ProviderService providerService;

	// �����ʾ��ͼ�����ʱ���ȡ�����еĹ�Ӧ�̵�����
	@RequestMapping(value = "getProviderAddress.do", method = { RequestMethod.GET, RequestMethod.POST })
	public ModelAndView getProviderAddress() {
		Map<String, String> map_address = new HashMap<String, String>();
		Map<String, String> map_name = new HashMap<String, String>();
		Map<String, String> map_phone = new HashMap<String, String>();
		Map<String, String> map_email = new HashMap<String, String>();
		List<Provider> listProvider = providerService.findAllProvider();
		for (int i = 0; i < listProvider.size(); i++) {
			// ���ｫ���ݽ��б���
			map_address.put(listProvider.get(i).getProviderAddress(), "Provider" + i);
			map_name.put(listProvider.get(i).getProviderName(), "Provider" + i);
			map_phone.put(listProvider.get(i).getProviderPhone(), "Provider" + i);
			map_email.put(listProvider.get(i).getProviderEmail(), "Provider" + i);
		}
		ModelAndView modelAndView = new ModelAndView();
		modelAndView.addObject("resProviderAddress", map_address);
		modelAndView.addObject("resProviderName", map_name);
		modelAndView.addObject("resProviderPhone", map_phone);
		modelAndView.addObject("resProviderEmail", map_email);
		modelAndView.setViewName("index");
		return modelAndView;

	}
}
