package cn.lincain.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lincain.domain.Employee;
import cn.lincain.mapper.EmployeeMapper;
import cn.lincain.service.EmployeeService;

@Service
public class EmployeeServiceImpl implements EmployeeService {
	
	@Autowired
	private EmployeeMapper empMapper;
	
	public Employee findEmployee(Integer empId) {
		return empMapper.getEmployeeById(empId);
	}

	public int getEmpCount() {
		return empMapper.getEmpCount();
	}

	public List<Employee> getEmpList(Integer offset, Integer limit) {
		return empMapper.selectEmpsByLimitAndOffset(offset,limit);
	}

	public Employee getEmpById(Integer empId) {
		return empMapper.getEmployeeById(empId);
	}
	
	public Employee getEmpByNo(Integer empNo) {
		return empMapper.getEmployeeByNo(empNo);
	}
	

	public int updateEmpById(Integer empId, Employee emp) {
		return empMapper.updateEmpById(empId,emp);
	}

	public int addEmp(Employee emp) {
		return empMapper.addEmp(emp);
	}
}
