package data.model.service;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import data.model.dto.MarketDto;
import data.model.mapper.MarketMapperInter;

@Service
public class MarketService implements MarketServiceInter {

	@Autowired
	MarketMapperInter mapperinter;
	
	@Override
	public int getTotalCount() {
		// TODO Auto-generated method stub
		return mapperinter.getTotalCount();
	}

	@Override
	public List<MarketDto> getAllData() {
		// TODO Auto-generated method stub
		return mapperinter.getAllData();
	}

	@Override
	public void insertMarket(MarketDto dto) {
		// TODO Auto-generated method stub
		mapperinter.insertMarket(dto);
	}

	@Override
	public MarketDto getData(String num) {
		// TODO Auto-generated method stub
		return mapperinter.getData(num);
	}

	@Override
	public void updateMarket(MarketDto dto) {
		// TODO Auto-generated method stub
		mapperinter.updateMarket(dto);
	}

	@Override
	public void deleteMarket(String num) {
		// TODO Auto-generated method stub
		mapperinter.deleteMarket(num);
	}
	
}
