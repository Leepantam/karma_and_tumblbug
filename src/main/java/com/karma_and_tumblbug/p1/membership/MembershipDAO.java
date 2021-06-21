package com.karma_and_tumblbug.p1.membership;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import com.karma_and_tumblbug.p1.profile.ProfileDTO;

@Repository
public class MembershipDAO {
	
	@Autowired
	private SqlSession sqlSession;
	
	private final String NAMESPACE="com.karma_and_tumblbug.p1.membership.MembershipDAO.";
	
	public MembershipDTO login(MembershipDTO membershipDTO) throws Exception{
		membershipDTO = sqlSession.selectOne(NAMESPACE+"login", membershipDTO);
		return membershipDTO;
	}
	
	public int join(MembershipDTO membershipDTO) throws Exception{
		return sqlSession.insert(NAMESPACE+"join", membershipDTO);
	}
	public int joinProfile(ProfileDTO profileDTO, MembershipDTO membershipDTO)throws Exception{
		return sqlSession.insert(NAMESPACE+"joinProfile", profileDTO);
	}
	public int update(MembershipDTO membershipDTO) throws Exception{
		return sqlSession.update(NAMESPACE+"update", membershipDTO);
	}
	public int delete(MembershipDTO membershipDTO) throws Exception{
		return sqlSession.delete(NAMESPACE+"delete", membershipDTO);
	}
	public MembershipDTO getIdCheck(MembershipDTO membershipDTO) throws Exception{
		return sqlSession.selectOne(NAMESPACE+"getIdCheck", membershipDTO);
	}
}
