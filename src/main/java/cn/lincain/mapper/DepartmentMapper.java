package cn.lincain.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import cn.lincain.domain.Department;

@Repository
public interface DepartmentMapper {
	
	@Select({"select count(*) from tb_dept"})
	int getDeptCount();

	List<Department> selectDeptsByLimitAndOffset(@Param("offset")Integer offset, 
			@Param("limit")Integer limit);
	
	Department selectDeptById(@Param("deptNo")Integer deptNo);

	int updateDeptById(@Param("deptId")Integer deptId,
			@Param("department")Department department);

	int addDeptById(@Param("department")Department department);

	List<Department> selectAllDepts();
	
	@Select({"select dept_no from tb_dept where dept_name=#{deptName}"})
	Integer getDeptId(@Param("deptName")String deptName);
}
