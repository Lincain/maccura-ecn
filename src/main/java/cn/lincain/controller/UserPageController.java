package cn.lincain.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import cn.lincain.domain.Project;
import cn.lincain.service.impl.DepartmentServiceImpl;
import cn.lincain.service.impl.EcnInfoServiceImpl;
import cn.lincain.service.impl.EmployeeServiceImpl;
import cn.lincain.service.impl.ProjectServiceImpl;

@Controller
@RequestMapping("/user")
public class UserPageController {

	@Autowired
	DepartmentServiceImpl departmentServiceImpl;

	@Autowired
	EcnInfoServiceImpl ecnInfoServiceImpl;

	@Autowired
	EmployeeServiceImpl employeeServiceImpl;

	@Autowired
	ProjectServiceImpl projectServiceImpl;
	
	@RequestMapping("/getPro")
	@ResponseBody
	public Map<String,Object> getProList() {
		
		Map<String,Object> result = new HashMap<String, Object>();
		
		List<Project> projects = projectServiceImpl.getProListByEcn();
		
		result.put("projects", projects);
		return result;
	}
}
