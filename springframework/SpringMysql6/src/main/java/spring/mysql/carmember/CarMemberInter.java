package spring.mysql.carmember;

import java.util.List;

public interface CarMemberInter {

	public int getTotalCount();

	public void insertMember(CarMemberDto dto);
	
	public List<CarMemberDto> getAllMembers();
	
	public void deleteMember(int num);
	
	public CarMemberDto getdata(String num);
	
	public void updateMember(CarMemberDto dto);

}
