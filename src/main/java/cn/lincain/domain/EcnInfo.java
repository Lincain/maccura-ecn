package cn.lincain.domain;

public class EcnInfo {
    private Integer ecnId;
	private String ecrName;
	private String ecrNo;
	private String ecnNo;
	private Integer workNo;
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
    public Integer getWorkNo() {
        return workNo;
    }
    public void setWorkNo(Integer workNo) {
        this.workNo = workNo;
    }
    @Override
    public String toString() {
        return "EcnInfo [ecnId=" + ecnId + ", ecrName=" + ecrName + ", ecrNo=" + ecrNo + ", ecnNo=" + ecnNo
                + ", workNo=" + workNo + "]";
    }
}
