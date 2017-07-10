package cn.it.dao;

import java.util.List;

import cn.it.model.Provider;

public interface ProviderDao {
	public int addProvider(Provider provider);

	public int deleteProvider(int providerId);

	public int updateProvider(Provider provider);

	public List<Provider> findAll();

	public Provider findProviderByProviderId(int providerId);

	public List<Provider> fidnProviderLikeName(String providerName);

}
