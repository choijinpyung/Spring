package data.model.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import data.model.dto.MovieDto;

@Mapper
public interface MovieMapperInter {

	public void insertmovie(MovieDto dto);
	public List<MovieDto> getAlldata();
	public MovieDto getData(int num);
}
