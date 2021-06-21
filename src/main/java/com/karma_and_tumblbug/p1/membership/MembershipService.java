package com.karma_and_tumblbug.p1.membership;

import java.util.HashMap;

import org.json.simple.JSONObject;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.karma_and_tumblbug.p1.profile.ProfileDTO;

import net.nurigo.java_sdk.api.Message;
import net.nurigo.java_sdk.exceptions.CoolsmsException;

@Service
public class MembershipService {

	@Autowired
	private MembershipDAO membershipDAO;
	
	/**
	 * @class ExampleSend
	 * @brief This sample code demonstrate how to send sms through CoolSMS Rest API PHP
	 */
	
	public void checkPhoneNum(String phoneNum, String checkNum) {

        String api_key = "NCS5HXBMR4JAHZAE";
        String api_secret = "5WXN2FHVMAKEMG0CYQ2RSG2CJ5EGDMAE";
        Message coolsms = new Message(api_key, api_secret);

        // 4 params(to, from, type, text) are mandatory. must be filled
        HashMap<String, String> params = new HashMap<String, String>();
        params.put("to", phoneNum);    // 수신전화번호
        params.put("from", "01097448706");    // 발신전화번호. 테스트시에는 발신,수신 둘다 본인 번호로 하면 됨
        params.put("type", "SMS");
        params.put("text", "CAP 휴대폰인증 테스트 메시지 : 인증번호는" + "["+checkNum+"]" + "입니다.");
        params.put("app_version", "test app 1.2"); // application name and version

        try {
            JSONObject obj = (JSONObject) coolsms.send(params);
            System.out.println(obj.toString());
        } catch (CoolsmsException e) {
            System.out.println(e.getMessage());
            System.out.println(e.getCode());
        }

    }
	
	public MembershipDTO login(MembershipDTO membershipDTO) throws Exception{
		membershipDTO = membershipDAO.login(membershipDTO);
		return membershipDTO;
	}
	
	public int join(MembershipDTO membershipDTO) throws Exception{
		return membershipDAO.join(membershipDTO);
	}
	public int joinProfile(ProfileDTO profileDTO, MembershipDTO membershipDTO)throws Exception{
		return membershipDAO.joinProfile(profileDTO, membershipDTO);
	}
	public int update(MembershipDTO membershipDTO) throws Exception{
		return membershipDAO.update(membershipDTO);
	}
	public int delete(MembershipDTO membershipDTO) throws Exception{
		return membershipDAO.delete(membershipDTO);
	}
	public MembershipDTO getIdCheck(MembershipDTO membershipDTO) throws Exception{
		return membershipDAO.getIdCheck(membershipDTO);
	}
}
