<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>ECN管理页面</title>
</head>
<body>
<div class="hrms_ecn_container">
    <!-- 导航栏-->
    <%@ include file="./common/head.jsp"%>


    <!-- 中间部分（左侧栏+表格内容） -->
    <div class="hrms_ecn_body">
        <!-- 左侧栏 -->
        <%@ include file="./common/leftsidebar.jsp"%>

        <!-- 部门表格内容 -->
        <div class="ecn_info col-sm-10">
            <div class="panel panel-success">
                <!-- 路径导航 -->
                <div class="panel-heading">
                    <ol class="breadcrumb">
                        <li><a href="#">ECN管理</a></li>
                        <li class="active">ECN信息</li>
                    </ol>
                </div>
                <!-- Table -->
                <table class="table table-bordered table-hover" id="ecn_table">
                    <thead>
                    	<th>序号</th>
                        <th>ECN名称</th>
                        <th>ECR编号</th>
                        <th>ECN编号</th>
                        <th>创建者</th>
                        <th>操作</th>
                    </thead>
                    <tbody>
                        <c:forEach items="${ecnInfos}" var="ecn">
                            <tr>
                            	<td>${ecn.ecnId}</td>
                                <td>${ecn.ecrName}</td>
                                <td>${ecn.ecrNo}</td>
                                <td>${ecn.ecnNo}</td>
                                <td>${ecn.workNo}</td>
                                <td>
                                    <a href="#" role="button" class="btn btn-primary ecn_select_btn" data-toggle="modal" data-target=".ecn-extend-modal">查看</a>
                                    <a href="#" role="button" class="btn btn-primary ecn_edit_btn" data-toggle="modal" data-target=".ecn-update-modal">编辑</a>
                                    <a href="#" role="button" class="btn btn-danger ecn_delete_btn">删除</a>
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
                            <li><a href="${pageContext.request.contextPath}/ecn/getEcnList?pageNo=1">首页</a></li>
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
                                    <li class="active"><a href="${pageContext.request.contextPath}/ecn/getEcnList?pageNo=${itemPage}">${itemPage}</a></li>
                                </c:if>
                                <c:if test="${curPageNo != itemPage}">
                                    <li><a href="${pageContext.request.contextPath}/ecn/getEcnList?pageNo=${itemPage}">${itemPage}</a></li>
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
                            <li><a href="${pageContext.request.contextPath}/ecn/getEcnList?pageNo=${totalPages}">尾页</a></li>
                        </ul>
                    </nav>
                </div>
            </div><!-- /.panel panel-success -->
        </div><!-- /.dept_info -->
    </div><!-- /.hrms_dept_body -->

    <%@ include file="ecninfoUpdate.jsp"%>
    <%@ include file="ecninfoExtend.jsp"%>

    <!-- 尾部-->
    <%@ include file="./common/foot.jsp"%>

</div><!-- /.hrms_dept_container -->

<script type="text/javascript">
    var curPageNo = ${curPageNo};
    var totalPages = ${totalPages};
    //上一页
    $(".prePage").click(function () {
         if (curPageNo > 1){
             var pageNo = curPageNo - 1;
             $(this).attr("href", "${pageContext.request.contextPath}/ecn/getEcnList?pageNo="+pageNo);
         }
    });
    //下一页
    $(".nextPage").click(function () {
        if (curPageNo < totalPages){
            var pageNo = curPageNo + 1;
            $(this).attr("href", "${pageContext.request.contextPath}/ecn/getEcnList?pageNo="+pageNo);
        }
    });
	
   	<!--部门删除操作-->
    $(".ecn_delete_btn").click(function () {
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
                        window.location.href = "${pageContext.request.contextPath}/ecn/getEcnList?pageNo="+curPageNo;
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
