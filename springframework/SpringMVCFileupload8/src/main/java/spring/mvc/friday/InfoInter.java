package spring.mvc.friday;

import java.util.List;
import java.util.Map;

public interface InfoInter {
	
	//�߻�޼��常 ���� �Ѵ�.
	//�������̽��� ������ �߻��ü�� abstract�� �Ƚ�� �ȴ�
	public int getTotalCount();
	
	public void insertMyInfo(InfoDto dto);
	//public List<InfoDto> getAllInfos();
	public void delectMyInfo(int num);
	public InfoDto getOneInfo(String num);
	public void updateMyInfo(InfoDto dto);
	public List<InfoDto> getAllInfos(Map<String, String> map);
}
