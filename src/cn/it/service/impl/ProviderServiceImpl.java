package cn.it.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.it.dao.ProviderDao;
import cn.it.model.Provider;
import cn.it.service.ProviderService;

@Service("providerService")
public class ProviderServiceImpl implements ProviderService {

	@Autowired
	private ProviderDao providerDao;

	public List<Provider> findAllProvider() {
		List<Provider> listProvider = providerDao.findAll();
		return listProvider;
	}

	public String addProvider(Provider provider) {
		if (providerDao.addProvider(provider) > 0) {
			return "Success";
		}
		return "Failure";
	}

	public String deleteProvider(int providerId) {
		int i = -1;
		try {
			i = providerDao.deleteProvider(providerId);
		} catch (Exception e) {
			System.out.println(i);
		}
		if (i > 0) {
			return "Success";
		}
		return "Failure";
	}

	public String updateProvider(Provider provider) {
		int i = -1;
		try {
			i = providerDao.updateProvider(provider);
		} catch (Exception e) {
			System.out.println(i);
		}
		if (i > 0) {
			return "Success";
		}
		return "Failure";
	}

	public Provider findProviderByProviderId(int providerId) {
		return providerDao.findProviderByProviderId(providerId);
	}

	public List<Provider> fidnProviderLikeName(String providerName) {
		return providerDao.fidnProviderLikeName(providerName);
	}
}
