<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>项目更改页面</title>
</head>
<body>
<div class="modal fade pro-update-modal" tabindex="-1" role="dialog" aria-labelledby="pro-update-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">项目更改</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_pro_form">
                    <div class="form-group">
                        <label for="update_projectName" class="col-sm-2 control-label">项目编号</label>
                        <div class="col-sm-8">
                            <input type="text" name="projectNo" class="form-control" id="update_proNo">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_projectName" class="col-sm-2 control-label">项目名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="projectName" class="form-control" id="update_proName">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary pro_update_btn">保存</button>
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

    $(".pro_edit_btn").click(function () {
        edit_proId = $(this).parent().parent().find("td:eq(0)").text();
        //查询对应deptId的部门信息
        $.ajax({
            url:"${pageContext.request.contextPath}/pro/getProById/"+edit_proId,
            type:"GET",
            success:function (data) {
                if (data.departmentNo != 0){
                    //回显
                    $("#update_proNo").val(data.projectNo);
                    $("#update_proName").val(data.projectName);
                }else {
                    alert("操作失败");
                }
            }
            
        });
    });

    $(".pro_update_btn").click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/pro/updatePro/"+edit_proId,
            type:"PUT",
            data:$(".update_pro_form").serialize(),
            success:function (data) {
                if(data.code==200){
                	window.location.href = "${pageContext.request.contextPath}/pro/getProList?pageNo="+curPageNo;
                } else {
                    alert("更新失败");
                }
            }

        });
    });


</script>
</body>
</html>
