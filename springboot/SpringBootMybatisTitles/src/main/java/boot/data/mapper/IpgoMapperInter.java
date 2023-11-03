package boot.data.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Mapper;

import boot.data.dto.IpgoDto;

@Mapper
public interface IpgoMapperInter {

	public int IpgogetTotalCount();
	public void insertIpgo(IpgoDto dto);
	public List<IpgoDto> IpgogetAllData();
	public void deleteIpgo(String num);
	public IpgoDto IpgogetOneData(int num);
	public void updateIpgo(IpgoDto dto);
	
}
