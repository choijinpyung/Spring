package mycar.data;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Sort;
import org.springframework.stereotype.Repository;

@Repository
public class MyCarDao {

	@Autowired
	MyCarDaoInter carInter;

	// insert
	public void insertMycar(MyCarDto dto) {
		carInter.save(dto); // id타입 유무에 따라 자동으로 없으면 insert or 있으면 update
	}

	// 전체출력
	public List<MyCarDto> getAllDatas() {
		// return carInter.findAll();
		return carInter.findAll(Sort.by(Sort.Direction.DESC, "carprice")); // 가격이 높은순
	}

	// num에 대한 값(dto) 반환
	public MyCarDto getData(Long num) {
		return carInter.getReferenceById(num);
	}

}
