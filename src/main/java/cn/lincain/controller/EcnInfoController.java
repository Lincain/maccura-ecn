package cn.lincain.controller;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
}
