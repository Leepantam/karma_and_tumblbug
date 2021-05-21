package com.karma_and_tumblbug.p1.sponsor;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;


import com.karma_and_tumblbug.p1.util.Pager;

@Service
public class SponsorService {
	
	@Autowired
	private SponsorDAO sponsorDAO;
	
	public int setInsert(SponsorDTO sponsorDTO)throws Exception {
		return sponsorDAO.setInsert(sponsorDTO);
	}

	public SponsorDTO getSelect(SponsorDTO sponsorDTO) throws Exception{
		return sponsorDAO.getSelect(sponsorDTO);
	}
	
	public List<SponsorDTO> getListMon(Pager pager)throws Exception{
		// -------startRow, lastRow--------
		pager.makeRow();
		//-------------페이징계산  -----------
		long totalCountMon = sponsorDAO.getTotalCountMon(pager);
		
		if(totalCountMon==0) {
			totalCountMon=1;
		}
		
		pager.makeNum(totalCountMon);
		return sponsorDAO.getListMon(pager);
	}
	
	public Long getTotalSumMon(Pager pager)throws Exception{
		return sponsorDAO.getTotalSumMon(pager);
	}
	
	
	
	public List<SponsorDTO> getList(Pager pager) throws Exception{
		// -------startRow, lastRow--------
		pager.makeRow();
		//------------페이징계산 -------------
		long totalCount= sponsorDAO.getTotalCount(pager);

		pager.makeNum(totalCount);
		return sponsorDAO.getList(pager);
	}
	
	public Long getTotalSum(Pager pager) throws Exception{
		return sponsorDAO.getTotalSum(pager);
	}

	
	public long getTotalCountMon(Pager pager)throws Exception{
		return 0;
	}
	
	public long getTotalCount(Pager pager) throws Exception {
		return 0;
	}

	
}
