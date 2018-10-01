<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<html>
<head>
    <title>工程更改申请页面</title>
</head>
<body>
<div class="modal fade ecn-update-modal" tabindex="-1" role="dialog" aria-labelledby="ecn-update-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">工程更改申请单号</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal update_ecn_form">
                    <div class="form-group">
                        <label for="update_ecnName" class="col-sm-3 control-label">ECN名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="ecrName" class="form-control" id="update_ecnName">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_ecrNo" class="col-sm-3 control-label">工程更改申请</label>
                        <div class="col-sm-8">
                            <input type="text" name="ecrNo" class="form-control" id="update_ecrNo" readonly="readonly">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="update_ecnNo" class="col-sm-3 control-label">ECN申请时间</label>
                        <div class="col-sm-8">
                            <input type="text" name="ecnNo" class="form-control ecn_time" id="update_ecnNo">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary ecn_update_btn">保存</button>
            </div>
        </div><!-- /.modal-content -->
    </div><!-- /.modal-dialog -->
</div><!-- /.modal -->


<script type="text/javascript">
    <!-- ==========================部门新增操作=================================== -->
    //1 点击编辑按钮，发送AJAX请求查询对应id的部门信息，进行回显；
    //2 进行修改，点击更新按钮发送AJAX请求，将更改后的信息保存到数据库中；
    //3 跳转到当前更改页；
    var edit_ecnId = 0;
    var curPageNo = ${curPageNo};

    $(".ecn_edit_btn").click(function () {
    	edit_ecnId = $(this).parent().parent().find("td:eq(0)").text();
        //查询对应deptId的部门信息
        $.ajax({
            url:"${pageContext.request.contextPath}/ecn/getEcnById/"+edit_ecnId,
            type:"GET",
            success:function (data) {
                if (data != null){
                    //回显
                    $("#update_ecnName").val(data.ecrName);
                    $("#update_ecrNo").val(data.ecrNo);
                }else {
                    alert("操作失败");
                }
            }
            
        });
    });

    $(".ecn_update_btn").click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/user/updateEcn/",
            type:"PUT",
            data:$(".update_ecn_form").serialize(),
            success:function (data) {
                if(data.code==200){
                	window.location.href = "${pageContext.request.contextPath}/user/getEcnList?pageNo="+curPageNo;
                } else {
                    alert("更新失败");
                }
            }

        });
    });
	
    $(".ecn_time").datetimepicker({
        format : 'yyyy-mm-dd', // 展现格式
		startDate : "2010-01-01",// 开始时间
		endDate : "2020-01-01", // 结束时间
		autoclose : true, // 选择日期后关闭
		// 选择器打开之后首先显示的视图
		// 0表示分钟(默认),1表示小时,2表示天,3表示月,4表示年
		startView : 2,
		// 选择器所能够提供的最精确的时间选择视图
		// 0表示分钟(默认),1表示小时,2表示天,3表示月,4表示年
		minView : 2,
		language : 'zh-CN', //显示语言为中文
    });

</script>
</body>
</html>
