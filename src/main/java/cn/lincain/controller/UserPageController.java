package cn.lincain.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.mysql.cj.xdevapi.Result;

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
	public Map<String, Object> getProList() {

		Map<String, Object> result = new HashMap<String, Object>();

		List<Project> projects = projectServiceImpl.getProListByEcn();

		result.put("projects", projects);
		
		return result;
	}

	@RequestMapping("/addEcn")
	@ResponseBody
	public Map<String, Integer> addEcn(HttpServletRequest request) {
		Map<String, Integer> map = new HashMap<>();
		String projectNo = null;
		String ecrName = null;
		String ecrTime = null;
		String empNo=null;

		projectNo = request.getParameter("projectNo");
		ecrName = request.getParameter("ecrName");
		ecrTime = request.getParameter("ecrTime");
		empNo = request.getParameter("empNo");
		
		ecrTime = (ecrTime.length() == 0? "暂时不取ECR" : ecrTime.replaceAll("-", ""));
		
		int code = ecnInfoServiceImpl.addEcnByUser(projectNo,ecrName,ecrTime,empNo);
		
		if(code != 1) {
			map.put("result",200);
		}else {
			map.put("result", 100);
		}
		
		return map;
	}
}
