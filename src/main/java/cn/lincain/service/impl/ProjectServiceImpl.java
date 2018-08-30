package cn.lincain.service.impl;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import cn.lincain.domain.Department;
import cn.lincain.domain.Project;
import cn.lincain.mapper.ProjectMapper;
import cn.lincain.service.ProjectService;

@Service
public class ProjectServiceImpl implements ProjectService {
	
	@Autowired
	private ProjectMapper proMapper;
	
	public int getProCount() {
		return proMapper.getProCount();
	}

	public List<Department> getProList(int offset, int limit) {
		return proMapper.selectProsByLimitAndOffset(offset,limit);
	}

	public Project getProById(Integer proId) {
		return proMapper.selectProById(proId);
	}

	public int updatePro(Integer proId, Project project) {
		return proMapper.updateProById(proId,project);
	}

	public int addPro(Project project) {
		return proMapper.addProByNo(project);
	}

}
