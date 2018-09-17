package cn.lincain.service;

import java.util.List;

import cn.lincain.domain.EcnInfo;

public interface EcnInfoService {
    
    public int getEcnCount();
    
    public List<EcnInfo> getEcnInfoList(int offset,int limit);
    
    public EcnInfo getEcnInfoById(Integer ecnNO);
    
}
