<%@ page contentType="text/html;charset=UTF-8" language="java" %>

<div class="panel-group col-sm-2" id="hrms_sidebar_left" role="tablist" aria-multiselectable="true">
    <ul class="nav nav-pills nav-stacked emp_sidebar">
        <li role="presentation" class="active">
            <a href="#" data-toggle="collapse" data-target="#collapse_emp">
                <span class="glyphicon glyphicon-user" aria-hidden="true">员工管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_emp">
                <li role="presentation"><a href="#" class="emp_info">员工信息</a></li>
                <li role="presentation"><a href="#" role="button" class="emp_add_btn" data-toggle="modal" data-target=".emp-add-modal">员工新增</a></li>
            </ul>
        </li>
    </ul>
    <ul class="nav nav-pills nav-stacked dept_sidebar">
        <li role="presentation" class="active">
            <a href="#"  data-toggle="collapse" data-target="#collapse_dept">
                <span class="glyphicon glyphicon-cloud" aria-hidden="true">部门管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_dept">
                <li role="presentation"><a href="#" class="dept_info">部门信息</a></li>
                <li role="presentation"><a href="#" class="dept_add_btn" data-toggle="modal" data-target=".dept-add-modal">部门新增</a></li>
            </ul>
        </li>
    </ul>
    <ul class="nav nav-pills nav-stacked pro_sidebar">
        <li role="presentation" class="active">
            <a href="#"  data-toggle="collapse" data-target="#collapse_pro">
                <span class="glyphicon glyphicon-cloud" aria-hidden="true">项目管理</span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_pro">
                <li role="presentation"><a href="#" class="pro_info">项目信息</a></li>
                <li role="presentation"><a href="#" class="pro_add_btn" data-toggle="modal" data-target=".pro-add-modal">项目新增</a></li>
            </ul>
        </li>
    </ul>
	<ul class="nav nav-pills nav-stacked ecn_sidebar">
        <li role="presentation" class="active">
            <a href="#"  data-toggle="collapse" data-target="#collapse_ecn">
                <span class="glyphicon glyphicon-cloud" aria-hidden="true">工程更改</span>
            </a>
            <ul class="nav nav-pills nav-stacked" id="collapse_ecn">
                <li role="presentation"><a href="#" class="ecn_info">工程更改信息</a></li>
                <li role="presentation"><a href="#" class="ecn_add_btn" data-toggle="modal" data-target=".ecn-add-modal">工程更改新增</a></li>
            	<li class=”nav-divider”></li>
            </ul>
        </li>
    </ul>
</div><!-- /.panel-group，#hrms_sidebar_left -->

<script type="text/javascript">
    //跳转到员工页面
    $(".emp_info").click(function () {
        $(this).attr("href", "${pageContext.request.contextPath}/emp/getEmpList");
    });
    //跳转到部门页面
    $(".dept_info").click(function () {
        $(this).attr("href", "${pageContext.request.contextPath}/dept/getDeptList");
    });
  	//跳转到项目页面
    $(".pro_info").click(function () {
        $(this).attr("href", "${pageContext.request.contextPath}/pro/getProList");
    });
  	//跳转到ECN页面
    $(".ecn_info").click(function () {
        $(this).attr("href", "${pageContext.request.contextPath}/ecn/getEcnList");
    });
</script>
