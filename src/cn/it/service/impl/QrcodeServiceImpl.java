package cn.it.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.it.dao.QrcodeDao;
import cn.it.model.Qrcode;
import cn.it.service.QrcodeService;

@Service
public class QrcodeServiceImpl implements QrcodeService {

	@Autowired
	private QrcodeDao qrcodeDao;

	public String addQrcode(Qrcode qrCode) {
		if (qrcodeDao.addQrcode(qrCode) > 0) {
			return "Success";
		}
		return "Failure";
	}

	public String deleteQrcode(String qrContent) {
		if (qrcodeDao.deleteQrcode(qrContent) > 0) {
			return "Success";
		}
		return "Failure";
	}

	public String updateQrcode(Qrcode qrCode) {
		if (qrcodeDao.updateQrcode(qrCode) > 0) {
			return "Success";
		}
		return "Failure";
	}

	public List<Qrcode> findQrcodeLikeQrContent(String qrContent) {
		return qrcodeDao.findQrcodeLikeQrContent(qrContent);
	}

	public List<Qrcode> findAll() {
		return qrcodeDao.findAll();
	}

}
