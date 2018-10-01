package cn.lincain.tool;

public class EcnTools {
	
	public static String toEcr(String ecrTime, int count) {
		String department = "PD";
		String ecrOrder = null;
		ecrOrder = count < 10 ? ("00" + count) : (count < 100 ? ("0" + count) : Integer.valueOf(count).toString());
		return "ECR-" + department + "-" + ecrTime + ecrOrder;
	}

	public static String toEcn(String ecnTime, int count) {
		String department = "PD";
		String ecnOrder = null;
		ecnOrder = count < 10 ? ("00" + count) : (count < 100 ? ("0" + count) : Integer.valueOf(count).toString());
		return "ECN-" + department + "-" + ecnTime + ecnOrder;
	}
}
