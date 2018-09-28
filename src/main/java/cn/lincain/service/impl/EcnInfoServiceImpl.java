package cn.lincain.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lincain.domain.EcnInfo;
import cn.lincain.mapper.EcnInfoMapper;
import cn.lincain.service.EcnInfoService;
import cn.lincain.tool.EcnTools;

@Service
public class EcnInfoServiceImpl implements EcnInfoService {
    
    @Autowired
    private EcnInfoMapper ecnInfoMapper;
    
    @Override
    public int getEcnCount() {
        return ecnInfoMapper.getEcnCount();
    }

    @Override
    public List<EcnInfo> getEcnInfoList(Integer offset, Integer limit) {
        return ecnInfoMapper.getEcnInfoList(offset,limit);
    }

    @Override
    public EcnInfo getEcnInfoById(Integer ecnId) {
        return ecnInfoMapper.getEcnInfoById(ecnId);
    }

	@Override
	public int updateEcnById(Integer ecnId, EcnInfo ecnInfo) {
		return ecnInfoMapper.updateEcnById(ecnId,ecnInfo);
	}

	@Override
	public int addEcnByUser(String projectNo,String ecrName,String ecrTime,String empNo) {
		
		int count = 1;
		List<EcnInfo> ecnInfos = ecnInfoMapper.getEcnInfoListByUser();
		
		for (EcnInfo ecnInfo : ecnInfos) {
			
			if(ecnInfo.getEcrNo().contains(ecrTime)) {
				count++;
			}
		}
		
		String ecrNo = EcnTools.toEcr(ecrTime, count);
		
		System.out.println(ecrNo);
		
		return ecnInfoMapper.addEcnByUser();
		
	}
	
}
