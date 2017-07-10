package cn.it.dao;

import java.util.List;

import cn.it.model.Qrcode;

public interface QrcodeDao {
	public int addQrcode(Qrcode qrCode);

	public int deleteQrcode(String qrContent);

	public int updateQrcode(Qrcode qrCode);

	public List<Qrcode> findQrcodeLikeQrContent(String qrContent);

	public List<Qrcode> findAll();

}
