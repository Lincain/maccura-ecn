<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>部门更改页面</title>
</head>
<body>
<div class="modal fade dept-update-modal" tabindex="-1" role="dialog" aria-labelledby="dept-update-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">部门更改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_dept_form">
                    <div class="form-group">
                        <label for="update_deptName" class="col-sm-2 control-label">部门编号</label>
                        <div class="col-sm-8">
                            <input type="text" name="departmentNo" class="form-control" id="update_deptNo">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_deptLeader" class="col-sm-2 control-label">部门名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="departmentName" class="form-control" id="update_deptName">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary dept_update_btn">保存</button>
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

    $(".dept_edit_btn").click(function () {
        edit_deptId = $(this).parent().parent().find("td:eq(0)").text();
        //查询对应deptId的部门信息
        $.ajax({
            url:"${pageContext.request.contextPath}/dept/getDeptById/"+edit_deptId,
            type:"GET",
            success:function (data) {
                if (data.departmentNo != 0){
                    //回显
                    $("#update_deptNo").val(data.departmentNo);
                    $("#update_deptName").val(data.departmentName);
                }else {
                    alert("操作失败");
                }
            }
            
        });
    });

    $(".dept_update_btn").click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/dept/updateDept/"+edit_deptId,
            type:"PUT",
            data:$(".update_dept_form").serialize(),
            success:function (data) {
                if(data.code==200){
                	window.location.href = "${pageContext.request.contextPath}/dept/getDeptList?pageNo="+curPageNo;
                } else {
                    alert("更新失败");
                }
            }

        });
    });


</script>
</body>
</html>
