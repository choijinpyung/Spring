package spring.mvc.reboard;

import java.util.HashMap;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class BoardDao implements BoardInter {
	
	@Autowired
	private SqlSession session;
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return session.selectOne("getTotalCountOfReboard");
	}
	@Override
	public int getMaxNum() {
		// TODO Auto-generated method stub
		return session.selectOne("MaxNumOfReboard");
	}
	@Override
	public void updateRestep(int regroup, int restep) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		
		map.put("regroup", regroup);
		map.put("restep", restep);
		
		session.update("UpdateStepOfReboard", map);
		
	}
	@Override
	public void insertReboard(BoardDto dto) {
		// TODO Auto-generated method stub
		int num=dto.getNum();
		int regroup=dto.getRegroup();
		int restep=dto.getRestep();
		int relevel=dto.getRelevel();
		
		if(num==0)//새글
		{
			regroup=getMaxNum()+1;
			restep=0;
			relevel=0;
		}
		else//답글
		{
			//같은 그릅중에서 전달받은 restep 보다 큰 글들은 모두 +1
			updateRestep(regroup, restep);
			
			//전달받은 step과 level 모두 +1
			restep++;
			relevel++;
		}
		
		//바뀐 값들을 다시 dto에 담는다
		dto.setRegroup(regroup);
		dto.setRestep(restep);
		dto.setRelevel(relevel);
		
		//insert
		session.insert("insertOfReboard", dto);
	}
	@Override
	public List<BoardDto> getPagingList(int start, int perpage) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		map.put("start", start);
		map.put("perpage", perpage);
		
		return session.selectList("SelectPagingOfReboard", map);
	}
	@Override
	public BoardDto getData(int num) {
		// TODO Auto-generated method stub
		return session.selectOne("getDataOfReboard", num);
	}
	@Override
	public void updateReadcount(int num) {
		// TODO Auto-generated method stub
		session.update("updateReadCountOfReboard", num);
	}
	@Override
	public int getCheckPass(int num, int pass) {
		// TODO Auto-generated method stub
		HashMap<String, Integer> map=new HashMap<String, Integer>();
		
		map.put("num", num);
		map.put("pass", pass);
		
		return session.selectOne("checkpassEqualOfReboard", map);
	}
	@Override
	public void updateReboard(BoardDto dto) {
		
		session.update("updateOfReboard", dto);
		
	}
	@Override
	public void deleteReboard(int num) {
		// TODO Auto-generated method stub
		session.delete("deleteOfReboard", num);
	}

}
