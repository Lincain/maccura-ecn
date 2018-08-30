package cn.lincain.domain;

public class Project {
	private Integer projectId;
	private String projectNo;
	private String projectName;
	public String getProjectNo() {
		return projectNo;
	}
	public Integer getProjectId() {
		return projectId;
	}
	public void setProjectId(Integer projectId) {
		this.projectId = projectId;
	}
	public void setProjectNo(String projectNo) {
		this.projectNo = projectNo;
	}
	public String getProjectName() {
		return projectName;
	}
	public void setProjectName(String projectName) {
		this.projectName = projectName;
	}
	@Override
	public String toString() {
		return "Project [projectId=" + projectId + ", projectNo=" + projectNo + ", projectName=" + projectName + "]";
	}
}
