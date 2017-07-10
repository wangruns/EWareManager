package cn.it.service;

import java.util.List;

import cn.it.model.Qrcode;

public interface QrcodeService {
	public String addQrcode(Qrcode qrCode);

	public String deleteQrcode(String qrContent);

	public String updateQrcode(Qrcode qrCode);

	public List<Qrcode> findQrcodeLikeQrContent(String qrContent);

	public List<Qrcode> findAll();

}
