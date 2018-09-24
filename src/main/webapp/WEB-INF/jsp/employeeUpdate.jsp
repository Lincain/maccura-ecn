<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<html>
<head>
    <title>员工更改页面</title>
</head>
<body>
<div class="modal fade emp-update-modal" tabindex="-1" role="dialog" aria-labelledby="emp-update-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">员工更改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_emp_form">
                    <div class="form-group">
                        <label for="update_empNo" class="col-sm-2 control-label">员工编号</label>
                        <div class="col-sm-8">
                            <input type="text" name="employeeNo" class="form-control" id="update_empNo">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_empName" class="col-sm-2 control-label">员工名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="employeeName" class="form-control" id="update_empName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_deptLeader" class="col-sm-2 control-label">部门名称</label>
                        <div class="col-sm-8">
	                        <select id="update_dept" name="departmentName" class="selectpicker show-tick form-control">
							</select>
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary emp_update_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script type="text/javascript">
    <!-- ==========================部门新增操作=================================== -->
    //1 点击编辑按钮，发送AJAX请求查询对应id的部门信息，进行回显；
    //2 进行修改，点击更新按钮发送AJAX请求，将更改后的信息保存到数据库中；
    //3 跳转到当前更改页；
    var edit_deptId = 0;
    var curPageNo = ${curPageNo};

    $(".emp_edit_btn").click(function () {
        edit_empId = $(this).parent().parent().find("td:eq(0)").text();
        //查询对应deptId的部门信息
        $.ajax({
            url:"${pageContext.request.contextPath}/emp/getEmpById/"+edit_empId,
            type:"GET",
            success:function (data) {
                if (data != null){
                    //回显数据
                    $("#update_empNo").val(data.employee.employeeNo);
                    $("#update_empName").val(data.employee.employeeName);
                    
                    //清空下拉，并回显
                    $("#update_dept").empty();
                    var option = document.createElement("option");
                    $(option).val(data.employee.department.departmentName);
                	$(option).text(data.employee.department.departmentName);
                	$("#update_dept").append(option);
                    for(var i=0;i<data.department.length;i++){
                    	var option = document.createElement("option");
                    	if(data.employee.department.departmentName == data.department[i].departmentName){
                    		continue;
                    	}
                    	$(option).val(data.department[i].departmentName);
                    	$(option).text(data.department[i].departmentName);
                    	$("#update_dept").append(option);
                    }
                }else {
                    alert("操作失败");
                }
            }
            
        });
    });

    $(".emp_update_btn").click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/emp/updateEmp/"+edit_empId,
            type:"PUT",
            data:$(".update_emp_form").serialize(),
            success:function (data) {
                if(data.code==200){
                	window.location.href = "${pageContext.request.contextPath}/emp/getEmpList?pageNo="+curPageNo;
                } else {
                    alert("更新失败");
                }
            }

        });
    });


</script>
</body>
</html>
