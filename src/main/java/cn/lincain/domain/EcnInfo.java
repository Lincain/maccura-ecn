package cn.lincain.domain;

public class EcnInfo {
    private Integer ecnId;
	private String ecrName;
	private String ecrNo;
	private String ecnNo;
	private String proNo;
	private String empNo;
	public Integer getEcnId() {
		return ecnId;
	}
	public void setEcnId(Integer ecnId) {
		this.ecnId = ecnId;
	}
	public String getEcrName() {
		return ecrName;
	}
	public void setEcrName(String ecrName) {
		this.ecrName = ecrName;
	}
	public String getEcrNo() {
		return ecrNo;
	}
	public void setEcrNo(String ecrNo) {
		this.ecrNo = ecrNo;
	}
	public String getEcnNo() {
		return ecnNo;
	}
	public void setEcnNo(String ecnNo) {
		this.ecnNo = ecnNo;
	}
	public String getProNo() {
		return proNo;
	}
	public void setProNo(String proNo) {
		this.proNo = proNo;
	}
	public String getEmpNo() {
		return empNo;
	}
	public void setEmpNo(String empNo) {
		this.empNo = empNo;
	}
	@Override
	public String toString() {
		return "EcnInfo [ecnId=" + ecnId + ", ecrName=" + ecrName + ", ecrNo=" + ecrNo + ", ecnNo=" + ecnNo + ", proNo="
				+ proNo + ", empNo=" + empNo + "]";
	}
}
