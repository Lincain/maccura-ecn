package cn.lincain.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import cn.lincain.domain.EcnInfo;

@Repository
public interface EcnInfoMapper {
    @Select({"select count(*) from tb_ecn"})
    int getEcnCount();
    
    
    List<EcnInfo> getEcnInfoList(@Param("offset")Integer offset, 
    		@Param("limit")Integer limit);


	EcnInfo getEcnInfoById(@Param("ecnId")Integer ecnId);


	int updateEcnById(@Param("ecnId")Integer ecnId, 
			@Param("ecninfo")EcnInfo ecnInfo);


	List<EcnInfo> getEcnInfoListByUser();

	int addEcnByUser(@Param("ecnInfo")EcnInfo ecnInfo);

}
