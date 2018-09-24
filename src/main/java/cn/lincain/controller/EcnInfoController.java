package cn.lincain.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.lincain.domain.EcnInfo;
import cn.lincain.service.EcnInfoService;

@Controller
@RequestMapping("/ecn")
public class EcnInfoController {
    @Autowired
    private EcnInfoService ecnInfoServiceImpl;

    @RequestMapping(value = "/getEcnList")
    public ModelAndView getEcnList(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo) {
        ModelAndView mav = new ModelAndView("ecninfoPage");

        int limit = 5;
        int valueCount = ecnInfoServiceImpl.getEcnCount();
        int temp = valueCount / limit;
        int totalPages = (valueCount % limit == 0) ? temp : temp + 1;

        int offset = (pageNo - 1) * limit;
        
        List<EcnInfo> ecnInfos = ecnInfoServiceImpl.getEcnInfoList(offset, limit);
        
        mav.addObject("ecnInfos", ecnInfos)
        .addObject("valueCount", valueCount)
        .addObject("totalPages", totalPages)
        .addObject("curPageNo", pageNo);
        
        return mav;
    }
    @RequestMapping("/getEcnById/{ecnId}")
    @ResponseBody
    public EcnInfo getEcnInfoById(@PathVariable("ecnId")Integer ecnId) {
    	EcnInfo ecnInfo = ecnInfoServiceImpl.getEcnInfoById(ecnId);
    	return ecnInfo;
    }
    
    @RequestMapping("/updateEcn/{ecnId}")
    @ResponseBody
    public Map<String,Integer> updateEcnById(@PathVariable("ecnId")Integer ecnId,EcnInfo ecnInfo) {
    	int code = ecnInfoServiceImpl.updateEcnById(ecnId,ecnInfo);
    	Map<String,Integer> map = new HashMap<String,Integer>();
    	
    	if (code != 1) {
			map.put("result", 100);
			return map;
		}
		map.put("result", 200);
		return map;
	}
}
