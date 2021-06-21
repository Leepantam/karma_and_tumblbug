package com.karma_and_tumblbug.p1.payment;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class PaymentService {

	@Autowired
	private PaymentDAO paymentDAO;

	public List<PaymentDTO> getList(PaymentDTO paymentDTO) throws Exception{
		return paymentDAO.getList(paymentDTO);
	}
	public int setDelete(PaymentDTO paymentDTO) throws Exception{
		return paymentDAO.setDelete(paymentDTO);
	}
	
	public int setInsert(PaymentDTO paymentDTO) throws Exception{
		if(paymentDTO.getDefaultMethod().equals("true")) {
			PaymentDTO temp = new PaymentDTO();
			temp.setId(paymentDTO.getId());
			temp.setDefaultMethod("true");
			temp = paymentDAO.getDefault(temp);
			if(temp != null) {
				int tempResult = paymentDAO.setUpdateDefault(temp);
			}
		} else {
			PaymentDTO temp = new PaymentDTO();
			temp.setId(paymentDTO.getId());
			temp.setDefaultMethod("true");
			temp = paymentDAO.getDefault(temp);
			if(temp == null) {
				paymentDTO.setDefaultMethod("true");
			}
		}

		String division = paymentDTO.getDivision();
		System.out.println(division);
		if(division.equals("account")) {
			String str = paymentDTO.getBankAccount();
			System.out.println(str);
			str = str.replace(",", "-");
			paymentDTO.setBankAccount(str);
		}

		if(division.equals("card")) {
			String str = paymentDTO.getCardNumber();
			System.out.println(str);
			str = str.replace(",", "");
			System.out.println(str);
			paymentDTO.setCardNumber(str);
			String str2 = paymentDTO.getExpirationDate();
			str2 = str2.replace(",", "/");
			paymentDTO.setExpirationDate(str2);
			System.out.println(str2);
		}

		return paymentDAO.setInsert(paymentDTO);
	}


}
