package Spring.anno.ex4;

import org.springframework.stereotype.Component;

@Component //자동으로 빈의 등록 등록(id는 클래스명, 단 첫글자만 소문자 즉 myDao가 아이디가됨)
public class myDao implements DaoInter {

	@Override
	public void insertData(String str) {
		
		System.out.println(str+"_str 데이터를 DB 추가 성공!!");
	}

	@Override
	public void deleteData(String num) {
		
		System.out.println(num+"_num 데이터를 DB 삭제 성공!!");
	}

}
