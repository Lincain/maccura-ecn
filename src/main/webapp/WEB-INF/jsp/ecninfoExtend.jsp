<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>ECN详情页面</title>
</head>
<body>
<div class="modal fade ecn-extend-modal" tabindex="-1" role="dialog" aria-labelledby="ecn-extend-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">ECN详情</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal extend_ecn_form">
                    <div class="form-group">
                        <label for="extend_workNo" class="col-sm-3 control-label">申请人工号</label>
                        <div class="col-sm-8">
                            <input type="text" name="employeeNo" class="form-control" id="extend_workNo">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="extend_workName" class="col-sm-3 control-label">申请人姓名</label>
                        <div class="col-sm-8">
                            <input type="text" name="employeeName" class="form-control" id="extend_workName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="extend_workDept" class="col-sm-3 control-label">申请人部门</label>
                        <div class="col-sm-8">
                            <input type="text" name="departmentName" class="form-control" id="extend_workDept">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->

<script type="text/javascript">
    <!-- ==========================部门新增操作=================================== -->
    //1 点击编辑按钮，发送AJAX请求查询对应id的部门信息，进行回显；
    //2 进行修改，点击更新按钮发送AJAX请求，将更改后的信息保存到数据库中；
    //3 跳转到当前更改页；
    var select_workno = 0;
    var curPageNo = ${curPageNo};

    $(".ecn_select_btn").click(function () {
    	select_workno = $(this).parent().parent().find("td:eq(4)").text();
        //查询对应deptId的部门信息
        $.ajax({
            url:"${pageContext.request.contextPath}/emp/getEmpByNo/"+select_workno,
            type:"GET",
            success:function (data) {
                if (data != null){
                    //回显
                    $("#extend_workNo").val(data.employee.employeeNo);
                    $("#extend_workName").val(data.employee.employeeName);
                    $("#extend_workDept").val(data.employee.department.departmentName);
                }else {
                    alert("操作失败");
                }
            }
            
        });
    });
</script>
</body>
</html>
