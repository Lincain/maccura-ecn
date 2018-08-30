package cn.lincain.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.lincain.domain.Department;
import cn.lincain.domain.Project;
import cn.lincain.service.impl.ProjectServiceImpl;

@Controller
@RequestMapping("/pro")
public class ProjectController {
	
	@Autowired
	private ProjectServiceImpl proServiceImpl;
	
	@RequestMapping("/getProList")
	public ModelAndView getProList(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo) {
		ModelAndView mav = new ModelAndView("projectPage");
		
		int limit = 5;
        //总记录数
        int totalItems = proServiceImpl.getProCount();
        int temp = totalItems / limit;
        
        int totalPages = (totalItems % limit== 0) ? temp : temp+1;
        //每页的起始行(offset+1)数据，如第一页(offset=0，从第1(offset+1)行数据开始)
        int offset = (pageNo - 1)*limit;
        List<Department> projects = proServiceImpl.getProList(offset, limit);

        mav.addObject("projects", projects)
                .addObject("totalItems", totalItems)
                .addObject("totalPages", totalPages)
                .addObject("curPageNo", pageNo);
		return mav;
	}
	
	@RequestMapping(value = "/getProById/{proId}",method = RequestMethod.GET)
	@ResponseBody
	public Project getProById(@PathVariable("proId")Integer proId) {
		Project pro = null;
		if(proId > 0) {
			pro = proServiceImpl.getProById(proId);
		}
		if(pro != null) {
			return pro;
		}
		return null;
	}
	
	@RequestMapping(value = "/updatePro/{proId}",method = RequestMethod.PUT)
	@ResponseBody
	public Map<String,Integer> updatePro(@PathVariable("proId")Integer proId,Project project){
		Map<String,Integer> result = new HashMap<>();
		int code = proServiceImpl.updatePro(proId,project);
		if(code != 0) {
			result.put("code", 200);
		}
		return result;
	}
	@RequestMapping(value = "/addPro",method = RequestMethod.PUT)
	@ResponseBody
	public Map<String,Integer> addPro(Project project){
		Map<String,Integer> result = new HashMap<>();
		
		int code = proServiceImpl.addPro(project);
		if(code == 1) {
			result.put("code", 200);
		}
		return result;
	}
	
	@RequestMapping(value = "/getTotalPages",method = RequestMethod.GET)
	@ResponseBody
	public Map<String,Integer> getTotalPages() {
		
		int limit = 5;
		int totalItems = proServiceImpl.getProCount();
		int pages = totalItems / limit;
		int totalPages = (totalItems % limit == 0) ? pages : (pages + 1);
		
		Map<String,Integer> result = new HashMap<>();
		result.put("code", totalPages);
		return result;
	}
}
