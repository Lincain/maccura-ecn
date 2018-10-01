package cn.lincain.controller;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;

import cn.lincain.domain.EcnInfo;
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
		String empNo = null;

		projectNo = request.getParameter("projectNo");
		ecrName = request.getParameter("ecrName");
		ecrTime = request.getParameter("ecrTime");
		empNo = request.getParameter("empNo");

		ecrTime = (ecrTime.length() == 0 ? "暂时不取ECR" : ecrTime.replaceAll("-", ""));

		int code = ecnInfoServiceImpl.addEcnByUser(projectNo, ecrName, ecrTime, empNo);
		System.out.println(code);
		if (code != 1) {
			map.put("result", 200);
		} else {
			map.put("result", 100);
		}

		return map;
	}

	@RequestMapping(value = "/getTotalPages", method = RequestMethod.GET)
	@ResponseBody
	public Map<String, Integer> getTotalPages() {
		Map<String, Integer> map = new HashMap<>();
		int itemCounts = ecnInfoServiceImpl.getEcnCount();
		int totalPage = (itemCounts % 5 == 0) ? itemCounts / 5 : itemCounts / 5 + 1;
		map.put("code", totalPage);
		return map;
	}

	@RequestMapping(value = "/getEcnList")
	public ModelAndView getEcnList(@RequestParam(value = "pageNo", defaultValue = "1") Integer pageNo) {
		ModelAndView mav = new ModelAndView("userpage");

		int limit = 5;
		int valueCount = ecnInfoServiceImpl.getEcnCount();
		int temp = valueCount / limit;
		int totalPages = (valueCount % limit == 0) ? temp : temp + 1;

		int offset = (pageNo - 1) * limit;

		List<EcnInfo> ecnInfos = ecnInfoServiceImpl.getEcnInfoList(offset, limit);

		mav.addObject("ecnInfos", ecnInfos).addObject("valueCount", valueCount).addObject("totalPages", totalPages)
				.addObject("curPageNo", pageNo);

		return mav;
	}
	@RequestMapping(value = "/updateEcn")
	@ResponseBody
	public Map<String, Integer> updateEcn(EcnInfo ecnInfo) {
		Map<String, Integer> map = new HashMap<>();
		int code = ecnInfoServiceImpl.updateEcn(ecnInfo);
		if (code != 1) {
			map.put("code", 100);
			return map;
		}
		map.put("code", 200);
		return map;
	}
}
