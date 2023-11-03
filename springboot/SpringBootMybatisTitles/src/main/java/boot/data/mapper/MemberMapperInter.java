package boot.data.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.MemBoardDto;
import boot.data.dto.MemberDto;

@Mapper
public interface MemberMapperInter {

	//TotalCount
	public int MembergetTotalCount();
		
	//insert
	public void insertMember(MemberDto dto);
	
	//select 하나의 데이터 조회
	public MemberDto MembergetOneData(int num);
	
	//select 전체 조회
	public List<MemberDto> MembergetAllData();
	
	//update
	public void updateMember(MemberDto dto);
	
	//delete
	public void deleteMember(String num);
	
	//login
	public int getSearchId(String id);
	
	//이름값 불러오기
	public String getName(String id);
	
	//id, pass가 일치하는지
	public int loginPassCheck(Map<String, String> map);
	
	//id에 따른 조회
	public MemberDto getDataById(String id);
	
	//num에 의한 사진 변경
	public void updatePhoto(Map<String, String> map);
	
	//사진 삭제를 위한 num 받아오기
	public MemberDto getDataByNum(String num);
	
	//myinfo update
	public void updateMyInfo(MemberDto dto);
}
