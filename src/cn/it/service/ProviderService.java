package cn.it.service;

import java.util.List;

import cn.it.model.Provider;

public interface ProviderService {
	public List<Provider> findAllProvider();

	public String addProvider(Provider provider);

	public String deleteProvider(int providerId);

	public String updateProvider(Provider provider);

	public Provider findProviderByProviderId(int providerId);

	public List<Provider> fidnProviderLikeName(String providerName);

}
