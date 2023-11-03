package spring.mysql.mycar;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class MyCarDao {
	
	//sql 세션 값을 받아오는 용도 자동으로 받기위해 Autowired
	@Autowired
	SqlSession session;
	
	String namespace="spring.mysql.mycar.MyCarDao";
	
	public int getTotalCount() {
		
		//세션 값을 하나만 받아오기 때문에 selectOne, 여러개를 불러오려면 selectlist
		return session.selectOne(namespace+".getAllListOfMyCar");
	}
	
	//insert
	public void insertcar(MyCarDto dto) {
		
		session.insert("insertOfMycar", dto);
				
	}
	
	//전체목록
	public List<MyCarDto> getAllcars() {
		
		return session.selectList("getAllMyCar");
	}
	
	//delete
	public void deletecar(int num) {
		
		session.delete("deleteOfMycar", num);
	}
	
	//하나의 데이터 조회
	public MyCarDto getData(String num) {
		
		return session.selectOne("selectOneOfMycar", num);
	}
	
	//update
	public void updatecar(MyCarDto dto) {
				
		session.update("updateOfMycar", dto);
	}
}
