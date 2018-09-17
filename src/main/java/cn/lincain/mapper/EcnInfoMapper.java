package cn.lincain.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import cn.lincain.domain.EcnInfo;

@Repository
public interface EcnInfoMapper {
    @Select({"select * from tb_ecn"})
    int getEcnCount();
    
    
    List<EcnInfo> getEcnInfoList(int offset, int limit);

}
