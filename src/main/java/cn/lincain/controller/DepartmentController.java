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
import cn.lincain.service.impl.DepartmentServiceImpl;

@Controller
@RequestMapping("/dept")
public class DepartmentController {

	@Autowired
	private DepartmentServiceImpl deptServiceImpl;
	
	@RequestMapping("/getDeptList")
	public ModelAndView getDeptList(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo) {
		ModelAndView mav = new ModelAndView("departmentPage");
		
		int limit = 5;
        //总记录数
        int totalItems = deptServiceImpl.getDeptCount();
        int temp = totalItems / limit;
        
        int totalPages = (totalItems % limit== 0) ? temp : temp+1;
        //每页的起始行(offset+1)数据，如第一页(offset=0，从第1(offset+1)行数据开始)
        int offset = (pageNo - 1)*limit;
        List<Department> departments = deptServiceImpl.getDeptList(offset, limit);

        mav.addObject("departments", departments)
                .addObject("totalItems", totalItems)
                .addObject("totalPages", totalPages)
                .addObject("curPageNo", pageNo);
		return mav;
	}
	
	@RequestMapping("/getDeptById/{deptNo}")
	@ResponseBody
	public Department updateDeptById(@PathVariable("deptNo")Integer deptNo) {
		Department department = null;
		
		if(deptNo > 0) {
			department = deptServiceImpl.getDeptById(deptNo);
		}
		if(department != null) {
			return department;
		}
		return null;
	}
	
	@RequestMapping(value = "/updateDept/{deptNo}",method = RequestMethod.PUT)
	@ResponseBody
	public Map<String,Integer> updateDept(@PathVariable("deptNo")Integer deptNo,Department department) {
		Map<String,Integer> result = new HashMap<String,Integer>();
		int number = deptServiceImpl.updateDept(deptNo,department);
		if(number != 1) {
			result.put("code", 100);
			return result;
		}
		result.put("code", 200);
		return result;
	}
	
	@RequestMapping(value = "/addDept",method = RequestMethod.PUT)
	@ResponseBody
	public Map<String,Integer> addDept(Department department){
		Map<String,Integer> result = new HashMap<String,Integer>();
		int number = deptServiceImpl.addDept(department);
		if(number != 1) {
			result.put("code", 100);
			return result;
		}
		result.put("code", 200);
		return result;
	}
	
	@RequestMapping(value = "/getTotalPages",method = RequestMethod.GET)
	@ResponseBody
	public Map<String,Integer> getTotalPages(){
		Map<String,Integer> result = new HashMap<String,Integer>();
		int limit = 5;
		int totalItems = deptServiceImpl.getDeptCount();
		int temp = totalItems / limit;
		int totalPages = (totalItems % limit== 0) ? temp : temp+1;
		result.put("code", totalPages);
		return result;
	}
	
}
