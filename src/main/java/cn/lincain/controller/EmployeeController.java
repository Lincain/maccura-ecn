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
import cn.lincain.domain.Employee;
import cn.lincain.service.impl.DepartmentServiceImpl;
import cn.lincain.service.impl.EmployeeServiceImpl;

@Controller
@RequestMapping("/emp")
public class EmployeeController {
	
	@Autowired
	private EmployeeServiceImpl empServiceImpl;
	@Autowired
	private DepartmentServiceImpl deptServiceImpl;
	
	@RequestMapping("/getEmpList")
	public ModelAndView getEmpList(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo) {
		ModelAndView mav = new ModelAndView("employeePage");
		
		int limit = 5;
        //总记录数
        int totalItems = empServiceImpl.getEmpCount();
        int temp = totalItems / limit;
        
        int totalPages = (totalItems % limit== 0) ? temp : temp+1;
        //每页的起始行(offset+1)数据，如第一页(offset=0，从第1(offset+1)行数据开始)
        int offset = (pageNo - 1)*limit;
		List<Employee> employees = empServiceImpl.getEmpList(offset, limit);
		
		mav.addObject("employees", employees)
        .addObject("totalItems", totalItems)
        .addObject("totalPages", totalPages)
        .addObject("curPageNo", pageNo);
		return mav;
	}
	
	@RequestMapping("/getEmpById/{empId}")
	@ResponseBody
	public Map<String,Object> getEmpById(@PathVariable("empId")Integer empId) {
		
		Map<String,Object> result = new HashMap<>();
		Employee employee = null;
		
		if(empId > 0) {
			employee = empServiceImpl.getEmpById(empId);
			result.put("employee", employee);
		}
		List<Department> depts = deptServiceImpl.getAllDepts();
		result.put("department", depts);
		
		if(result.get("employee") != null) {
			return result;
		}
		return null;
	}
	
	@RequestMapping(value="/updateEmp/{empId}",method = RequestMethod.PUT)
	@ResponseBody
	public Map<String,Integer> updateEmp(@PathVariable("empId")Integer empId,Employee emp,Department dept){
		System.out.println(dept);
		Map<String,Integer> result = new HashMap<>();
		Integer deptNo = deptServiceImpl.getDeptId(dept.getDepartmentName());
		emp.setDepartmentNo(deptNo);
		int number = empServiceImpl.updateEmpById(empId,emp);
		if(number != 1) {
			result.put("code", 100);
			return result;
		}
		result.put("code", 200);
		return result;
	}
	
	@RequestMapping(value = "/addEmp",method = RequestMethod.PUT)
	@ResponseBody
	public Map<String,Integer> addEmp(Employee emp,Department dept){
		Map<String,Integer> result = new HashMap<>();
		Integer deptNo = deptServiceImpl.getDeptNo(dept.getDepartmentName());
		emp.setDepartmentNo(deptNo);
		int code = empServiceImpl.addEmp(emp);
		if(code == 1) {
			result.put("code", 200);
			return result;
		}
		return result;
	}
	@RequestMapping(value = "/getTotalPages",method = RequestMethod.GET)
	@ResponseBody
	public Map<String,Integer> getTotalPages(){
		Map<String,Integer> result = new HashMap<>();
		int limit = 5;
		int totalItems = empServiceImpl.getEmpCount();
		int temp = totalItems / limit;
		int totalPages = (totalItems % limit== 0) ? temp : temp+1;
		result.put("code", totalPages);
		return result;
	}
}
