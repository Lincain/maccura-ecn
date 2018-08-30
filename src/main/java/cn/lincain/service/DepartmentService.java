package cn.lincain.service;

import java.util.List;

import cn.lincain.domain.Department;

public interface DepartmentService {
	
	public int getDeptCount();
	
	public List<Department> getDeptList(int offset, int limit);
	
	public Department getDeptById(Integer deptNo);
	
	public int updateDept(Integer deptId, Department department);
	
}
