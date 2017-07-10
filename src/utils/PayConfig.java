package utils;

import java.io.IOException;
import java.util.Properties;

public class PayConfig {

	private static Properties prop = new Properties();

	static {
		try {
			prop.load(PayConfig.class.getClassLoader().getResourceAsStream("merchantInfo.properties"));
		} catch (IOException e) {
			throw new RuntimeException(e);
		}
	}

	public static String getValue(String key) {
		return prop.getProperty(key);
	}

}
