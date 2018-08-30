package cn.lincain.domain;

import java.util.Date;

public class EcnInfo {
	private String ecrName;
	private Date ecrTime;
	private String ecrNo;
	private Date ecnTime;
	private String ecnNo;
	public String getEcrName() {
		return ecrName;
	}
	public void setEcrName(String ecrName) {
		this.ecrName = ecrName;
	}
	public Date getEcrTime() {
		return ecrTime;
	}
	public void setEcrTime(Date ecrTime) {
		this.ecrTime = ecrTime;
	}
	public String getEcrNo() {
		return ecrNo;
	}
	public void setEcrNo(String ecrNo) {
		this.ecrNo = ecrNo;
	}
	public Date getEcnTime() {
		return ecnTime;
	}
	public void setEcnTime(Date ecnTime) {
		this.ecnTime = ecnTime;
	}
	public String getEcnNo() {
		return ecnNo;
	}
	public void setEcnNo(String ecnNo) {
		this.ecnNo = ecnNo;
	}
	@Override
	public String toString() {
		return "EcnInfo [ecrName=" + ecrName + ", ecrTime=" + ecrTime + ", ecrNo=" + ecrNo + ", ecnTime=" + ecnTime
				+ ", ecnNo=" + ecnNo + "]";
	}
}
