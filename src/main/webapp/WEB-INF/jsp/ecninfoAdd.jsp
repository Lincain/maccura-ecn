<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<html>
<head>
    <title>工程更改申请</title>
</head>
<body>
<div class="modal fade ecn-add-modal" tabindex="-1" role="dialog" aria-labelledby="ecn-add-modal">
    <div class="modal-dialog" role="document">
        <div class="modal-content">
            <div class="modal-header">
                <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
                <h4 class="modal-title">工程更改申请</h4>
            </div>
            <div class="modal-body">
                <form class="form-horizontal add_ecn_form">
                    <div class="form-group">
                        <label for="add_ProNo" class="col-sm-3 control-label">项目编号</label>
                        <div class="col-sm-8">
	                        <select id="add_pro" name="projectNo" class="selectpicker show-tick form-control">
							</select>
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_ecrName" class="col-sm-3 control-label">更改名称</label>
                        <div class="col-sm-8">
                            <input type="text" name="ecrName" class="form-control" id="add_ecrName">		
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_ecrTime" class="col-sm-3 control-label">ECR申请时间</label>
                        <div class="col-sm-8">
                            <input type="text" name="ecrTime" class="ecn_time form-control" id="add_Time">
                        </div>
                    </div>
                    <div class="form-group">
                        <label for="add_ecnTime" class="col-sm-3 control-label">ECN申请时间</label>
                        <div class="col-sm-8">
                            <input type="text" name="ecnTime" class="ecn_time form-control" id="add_Time">
                        </div>
                    </div>
                </form>
            </div>
            <div class="modal-footer">
                <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
                <button type="button" class="btn btn-primary ecn_save_btn">保存</button>
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
    $(".add_ecn_btn").click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/user/getPro/",
            type:"GET",
            success:function (data) {
                if (data != null){                
                    
                    //清空下拉，并回显
                    $("#add_pro").empty();
                    var option = document.createElement("option");
                    $(option).val("请选择项目");
                	$(option).text("---请选择项目---");
                	$("#add_pro").append(option);
                    for(var i=0;i<data.projects.length;i++){
                    	var option = document.createElement("option");
                    	$(option).val(data.projects[i].projectNo);
                    	$(option).text(data.projects[i].projectNo);
                    	$("#add_pro").append(option);
                    }
                }else {
                    alert("操作失败");
                }
            }
            
        });
    });  
	
    $(".ecn_save_btn").click(function () {
        $.ajax({
            url:"${pageContext.request.contextPath}/user/addEcn",
            type:"PUT",
            data:$(".add_ecn_form").serialize(),
            success:function (result) {
                if(result.code == 200){
                    $.ajax({
                        url:"${pageContext.request.contextPath}/ecn/getTotalPages",
                        type:"GET",
                        success:function (result) {
                             var totalPage = result.code;
                             window.location.href="${pageContext.request.contextPath}/user/getEcnList?pageNo="+totalPage;
                        }
                    });
                }else {
                    alert("添加失败");
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