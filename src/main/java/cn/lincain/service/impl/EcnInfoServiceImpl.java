package cn.lincain.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lincain.domain.EcnInfo;
import cn.lincain.mapper.EcnInfoMapper;
import cn.lincain.service.EcnInfoService;

@Service
public class EcnInfoServiceImpl implements EcnInfoService {
    
    @Autowired
    private EcnInfoMapper ecnInfoMapper;
    @Override
    public int getEcnCount() {
        return ecnInfoMapper.getEcnCount();
    }

    @Override
    public List<EcnInfo> getEcnInfoList(int offset, int limit) {
        return ecnInfoMapper.getEcnInfoList(offset,limit);
    }

    @Override
    public EcnInfo getEcnInfoById(Integer ecnNO) {
        return null;
    }

}
