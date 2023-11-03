package spring.mysql.carmember;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CarMemberDao implements CarMemberInter {

	@Autowired
	private SqlSession session;

	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return session.selectOne("getTotalCountOfCarMember");
	}

	public void insertMember(CarMemberDto dto) {

		session.insert("insertOfMember", dto);
	}

	public List<CarMemberDto> getAllMembers() {

		return session.selectList("SelectAllOfMyCarMember");
	}

	@Override
	public void deleteMember(int num) {

		session.delete("deleteOfMember", num);
	}

	@Override
	public CarMemberDto getdata(String num) {

		return session.selectOne("updateOfMemberOne", num);
		
	}

	@Override
	public void updateMember(CarMemberDto dto) {

		session.update("updateOfMember", dto);

	}

}
