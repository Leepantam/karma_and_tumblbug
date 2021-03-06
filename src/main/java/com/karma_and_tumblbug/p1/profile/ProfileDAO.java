package com.karma_and_tumblbug.p1.profile;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.karma_and_tumblbug.p1.membership.MembershipDTO;

@Repository
public class ProfileDAO {

	@Autowired
	private SqlSession sqlSession;

	private final String NAMESPACE= "com.karma_and_tumblbug.p1.profile.ProfileDAO.";

	public ProfileDTO getProfile(ProfileDTO profileDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getProfile", profileDTO);
	}

	public int updateProfile(ProfileDTO profileDTO)throws Exception{
		return sqlSession.update(NAMESPACE+"updateProfile", profileDTO);
	}
	
	public int profileHome(ProfileDTO profileDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"profileHome", profileDTO);
	}
	
	public int getaccount(ProfileDTO profileDTO)throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getaccount", profileDTO);
	}
	
	public int setFileInsert(ProfilePicDTO profilePicDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"setFileInsert", profilePicDTO);
	}
	

	

}
