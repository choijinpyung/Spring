package spring.mvc.friday;

import java.util.ArrayList;
import java.util.List;
import java.util.Map;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class InfoDao implements InfoInter{
	
	@Autowired
	SqlSession session;

	@Override
	public int getTotalCount() {
		return session.selectOne("selectTotalCountOfMyInfo");
	}

	@Override
	public void insertMyInfo(InfoDto dto) {
		session.insert("insertOfMyInfo", dto);
	}
	
	/*
	@Override
	public List<InfoDto> getAllInfos() {
		List<InfoDto> list=new ArrayList<InfoDto>();
		return session.selectList("selectAllOfMyInfo");
	}
	*/

	@Override
	public void delectMyInfo(int num) {
		session.delete("delectOfMyInfo", num);
		
	}

	@Override
	public InfoDto getOneInfo(String num) {
		
		return session.selectOne("selectOneMyInfo", num);
	}

	@Override
	public void updateMyInfo(InfoDto dto) {
		// TODO Auto-generated method stub
		session.update("updateOfMyInfo", dto);
	}

	@Override
	public List<InfoDto> getAllInfos(Map<String, String> map) {
		// TODO Auto-generated method stub
		return session.selectList("selectAllOfMyInfo", map);
	}	
	
}
