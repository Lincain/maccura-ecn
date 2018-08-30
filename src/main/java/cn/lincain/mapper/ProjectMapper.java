package cn.lincain.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;
import org.springframework.stereotype.Repository;

import cn.lincain.domain.Department;
import cn.lincain.domain.Project;

@Repository
public interface ProjectMapper {
	
	@Select({"select count(*) from tb_pro"})
	int getProCount();

	List<Department> selectProsByLimitAndOffset(@Param("offset")int offset, 
			@Param("limit")int limit);

	Project selectProById(@Param("proId")Integer proId);

	int updateProById(@Param("proId")Integer proId, 
			@Param("project")Project project);

	int addProByNo(@Param("project")Project project);

}
