<%@ page contentType="text/html;charset=UTF-8" language="java"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<html>
	<head>
		<title>工程更改申请页面</title>
	</head>
	<style>
		div.ecn_info
		{
			border:3px solid #000
		}
	</style>
	<body>
		<div class="hrms_ecn_container">
			<!-- 导航栏-->
			<%@ include file="./common/head.jsp"%>
		</div>
		
		<div class="ecn">
			<div class="user_info col-sm-2">
			
				<div class="panel panel-success">
					<div class="panel-heading">
						<h2><span class="glyphicon glyphicon-user">个人信息</span></h2>
					</div><br>
					<div>
						<div class="input-group input-group-sm">
							<span class="input-group-addon">工号</span>
							<input type="text" class="form-control" placeholder="Twitterhandle">
						</div><br>
						<div class="input-group input-group-sm">
							<span class="input-group-addon">姓名</span>
							<input type="text" class="form-control" placeholder="Twitterhandle">
						</div><br>
						<div class="input-group input-group-sm">
							<span class="input-group-addon">部门</span>
							<input type="text" class="form-control" placeholder="Twitterhandle">
						</div>
					</div><br>
					<button id="fat-btn" class="add_ecn_btn btn btn-primary glyphicon glyphicon-plus btn-block" data-toggle="modal" data-target=".ecn-add-modal">申请工程更改</button><br>
				</div>	
			</div>
			<div class="dept_info col-sm-10">
				<div class="panel panel-success">
					<!-- 路径导航 -->
					<div class="panel-heading">
						<h2><span class="glyphicon glyphicon-cloud">工程更改信息</span></h2>
					</div>
					<!-- Table -->
					<table class="table table-bordered table-hover" id="dept_table">
						<thead>
							<th>序号</th>
							<th>项目编号</th>
							<th>更改名称</th>
							<th>ECR单号</th>
							<th>ECN单号</th>
							<th>操作</th>
						</thead>
						<tbody>
							<c:forEach items="${departments}" var="dept">
								<tr>
									<td>${dept.departmentId}</td>
									<td>${dept.departmentNo}</td>
									<td>${dept.departmentName}</td>
									<td>
										<a href="#" role="button" class="btn btn-primary dept_edit_btn" data-toggle="modal" data-target=".dept-update-modal">编辑</a>
										<a href="#" role="button" class="btn btn-danger dept_delete_btn">删除</a>
									</td>
								</tr>
							</c:forEach>
						</tbody>
					</table>

					<div class="panel-body">
						<div class="table_items">
							当前第<span class="badge">${curPageNo}</span>页，共有<span class="badge">${totalPages}</span>页，总记录数<span class="badge">${totalItems}</span>条。
						</div>
						<nav aria-label="Page navigation" class="pull-right">
							<ul class="pagination">
								<li><a href="${pageContext.request.contextPath}/dept/getDeptList?pageNo=1">首页</a></li>
								<c:if test="${curPageNo==1}">
									<li class="disabled">
										<a href="#" aria-label="Previous" class="prePage">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:if>
								<c:if test="${curPageNo!=1}">
									<li>
										<a href="#" aria-label="Previous" class="prePage">
											<span aria-hidden="true">&laquo;</span>
										</a>
									</li>
								</c:if>

								<c:forEach begin="1" end="${totalPages<5?totalPages:5}" step="1" var="itemPage">
									<c:if test="${curPageNo == itemPage}">
										<li class="active"><a href="${pageContext.request.contextPath}/dept/getDeptList?pageNo=${itemPage}">${itemPage}</a></li>
									</c:if>
									<c:if test="${curPageNo != itemPage}">
										<li><a href="${pageContext.request.contextPath}/dept/getDeptList?pageNo=${itemPage}">${itemPage}</a></li>
									</c:if>
								</c:forEach>

								<c:if test="${curPageNo==totalPages}">
									<li class="disabled" class="nextPage">
										<a href="#" aria-label="Next">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</c:if>
								<c:if test="${curPageNo!=totalPages}">
									<li>
										<a href="#" aria-label="Next" class="nextPage">
											<span aria-hidden="true">&raquo;</span>
										</a>
									</li>
								</c:if>
								<li><a href="${pageContext.request.contextPath}/dept/getDeptList?pageNo=${totalPages}">尾页</a></li>
							</ul>
						</nav>
					</div>
				</div><!-- /.panel panel-success -->
			</div><!-- /.dept_info -->
		
			<%@ include file="ecninfoAdd.jsp"%>
		</div>
		<script type="text/javascript">
			var curPageNo = ${curPageNo};
			var totalPages = ${totalPages};
			//上一页
			$(".prePage").click(function () {
				 if (curPageNo > 1){
					 var pageNo = curPageNo - 1;
					 $(this).attr("href", "${pageContext.request.contextPath}/dept/getDeptList?pageNo="+pageNo);
				 }
			});
			//下一页
			$(".nextPage").click(function () {
				if (curPageNo < totalPages){
					var pageNo = curPageNo + 1;
					$(this).attr("href", "${pageContext.request.contextPath}/dept/getDeptList?pageNo="+pageNo);
				}
			});
			
			<!--部门删除操作-->
			$(".delete_ecn_btn").click(function () {
				var delDeptId = $(this).parent().parent().find("td:eq(0)").text();
				var delDeptName = $(this).parent().parent().find("td:eq(1)").text();
				var curPageNo = ${curPageNo};
				if (confirm("确认删除【"+ delDeptName +"】的信息吗？")){
					$.ajax({
						url:"${pageContext.request.contextPath}/dept/delDept/"+delDeptId,
						type:"DELETE",
						success:function (result) {
							if (result.code == 100){
								alert("删除成功！");
								window.location.href = "${pageContext.request.contextPath}/dept/getDeptList?pageNo="+curPageNo;
							}else {
								alert(result.extendInfo.del_dept_error);
							}
						}
					});
				}
			});
		</script>
	</body>
</html>