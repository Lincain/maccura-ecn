package cn.lincain.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import cn.lincain.domain.Employee;

@Repository
public interface EmployeeMapper {
	
	Employee getEmployeeById(@Param("emp_id")Integer empId);
	
	@Select({"select count(*) from tb_emp"})
	int getEmpCount();

	List<Employee> selectEmpsByLimitAndOffset(@Param("offset")Integer offset, 
			@Param("limit")Integer limit);

	int updateEmpById(@Param("empId")Integer empId, 
			@Param("emp")Employee emp);

	int addEmp(@Param("emp")Employee emp);
	
	Employee getEmployeeByNo(@Param("emp_no")Integer empNo);
}
