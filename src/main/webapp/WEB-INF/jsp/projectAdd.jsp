<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>项目新增页面</title>
</head>
<body>
<div class="modal fade pro-add-modal" tabindex="-1" role="dialog" aria-labelledby="pro-add-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">项目新增</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal add_pro_form">
                    <div class="form-group">
                        <label for="add_proNo" class="col-sm-2 control-label">项目编号</label>
                        <div class="col-sm-8">
                            <input type="text" name="projectNo" class="form-control" id="add_proNo">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_proName" class="col-sm-2 control-label">项目名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="projectName" class="form-control" id="add_proName">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary pro_save_btn">保存</button>
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
    /* $(".dept_add_btn").click(function () {
        $('.dept-add-modal').modal({
        	backdrop:'static',
        	keyboard:false
        });
    });  */

    $(".pro_save_btn").click(function () {
        /* var departmentNo = $("#add_proNo").val();
        var departmentName = $("#add_proName").val(); */
        //验证省略...
        $.ajax({
            url:"${pageContext.request.contextPath}/pro/addPro",
            type:"PUT",
            data:$(".add_pro_form").serialize(),
            success:function (result) {
                if(result.code == 200){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/pro/getTotalPages",
                        type:"GET",
                        success:function (result) {
                             var totalPage = result.code;
                             window.location.href="${pageContext.request.contextPath}/pro/getProList?pageNo="+totalPage;
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