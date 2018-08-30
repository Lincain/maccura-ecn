package cn.lincain.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lincain.domain.Department;
import cn.lincain.mapper.DepartmentMapper;
import cn.lincain.service.DepartmentService;

@Service
public class DepartmentServiceImpl implements DepartmentService {
	
	@Autowired
	private DepartmentMapper deptMapper;
	
	public int getDeptCount() {
		
		return deptMapper.getDeptCount();
	}

	public List<Department> getDeptList(int offset, int limit) {
		
		return deptMapper.selectDeptsByLimitAndOffset(offset,limit);
	}

	public Department getDeptById(Integer deptNo) {
		
		return deptMapper.selectDeptById(deptNo);
	}

	public int updateDept(Integer deptId, Department department) {
		return deptMapper.updateDeptById(deptId,department);
	}

	public int addDept(Department department) {
		return deptMapper.addDeptById(department);
	}

	public List<Department> getAllDepts() {
		return deptMapper.selectAllDepts();
	}
	
	public Integer getDeptId(String deptName) {
		return deptMapper.getDeptId(deptName);
	}

	public Integer getDeptNo(String departmentName) {
		
		return deptMapper.getDeptId(departmentName);
	}
}
