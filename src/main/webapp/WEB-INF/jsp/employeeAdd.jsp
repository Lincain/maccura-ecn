<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>员工新增页面</title>
</head>
<body>
<div class="modal fade emp-add-modal" tabindex="-1" role="dialog" aria-labelledby="emp-add-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal add_emp_form">
                    <div class="form-group">
                        <label for="add_empNo" class="col-sm-2 control-label">员工编号</label>
                        <div class="col-sm-8">
                            <input type="text" name="employeeNo" class="form-control" id="add_empNo">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_empName" class="col-sm-2 control-label">员工名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="employeeName" class="form-control" id="add_empName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_deptName" class="col-sm-2 control-label">部门名称</label>
                        <div class="col-sm-8">
                        	<select id="add_dept" name="departmentName" class="selectpicker show-tick form-control">
	                        	<option selected="selected">请选择部门</option>
							</select>
                            <!-- <input type="text" name="departmentName" class="form-control" id="add_deptName"> -->
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary emp_save_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">
    <!-- ==========================部门新增操作=================================== -->
    // 为简单操作，省去了输入名称的验证、错误信息提示等操作
    //1 点击部门新增按钮，弹出模态框；
    //2 输入新增部门信息，点击保存按钮，发送AJAX请求到后台进行保存；
    //3 保存成功跳转最后一页
    $(".emp_add_btn").click(function () {
        //查询对应deptId的部门信息
        $.ajax({
            url:"${pageContext.request.contextPath}/emp/getEmpById/"+1,
            type:"GET",
            success:function (data) {
                if (data != null){
                    //回显
                    $("#add_dept").empty();
                    var option = document.createElement("option");
                    $(option).val("选择部门");
                	$(option).text("请选择部门");
                	$("#add_dept").append(option);
                    for(var i=0;i<data.department.length;i++){
                    	var option = document.createElement("option");
                    	/*if(i==0){ 
                    		$(option).val("选择部门");
                        	$(option).text("请选择部门");
                        	/* $("#add_dept").append(option);
                    	} */
                    	$(option).val(data.department[i].departmentName);
                    	$(option).text(data.department[i].departmentName);
                    	$("#add_dept").append(option); 
                    }
                }else {
                    alert("操作失败");
                }
            }
            
        });
    }); 

    $(".emp_save_btn").click(function () {
        /* var departmentNo = $("#add_deptNo").val();
        var departmentName = $("#add_deptName").val(); */
        //验证省略...
        $.ajax({
            url:"${pageContext.request.contextPath}/emp/addEmp",
            type:"PUT",
            data:$(".add_emp_form").serialize(),
            success:function (result) {
                if(result.code == 200){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/emp/getTotalPages",
                        type:"GET",
                        success:function (result) {
                             var totalPage = result.code;
                             window.location.href="${pageContext.request.contextPath}/emp/getEmpList?pageNo="+totalPage;
                        }
                    });
                }else {
                    alert("添加失败");
                }
            }
        });



    });



</script>
</body>
</html>