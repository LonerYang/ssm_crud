<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>

<!-- 引入jquery文件 -->
<script src="${pageContext.request.contextPath }/static/js/jquery-1.11.3.min.js"></script>

<!-- 引入bootstrap  css文件 -->
<link href="${pageContext.request.contextPath }/static/bootstrap-3.3.5-dist/css/bootstrap.min.css" rel="stylesheet">

<!-- 引入bootstrap  js文件 -->
<script src="${pageContext.request.contextPath }/static/bootstrap-3.3.5-dist/js/bootstrap.min.js" ></script>
</head>
<style>
	#pageInfo span{
		background-color:blue;
		color:white;
	}
	
</style>
<body>

	<!-- 修改模态框 -->
	<div class="modal fade" id="emp_update_model" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">修改员工</h4>
	      </div>
	      <div class="modal-body">
	      <!-- 修改表单 -->
	      <form class="form-horizontal">
			  <div class="form-group">
			    <label for="emp_name_input" class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			      <p class="form-control-static"></p>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="emp_email_input" class="col-sm-2 control-label">empEmail</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="empEmail" id="emp_update_email_input" placeholder="please input emp's email">
			      <span id="helpBlock2" class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
				  <label for="emp_email_input" class="col-sm-2 control-label">empGender</label>
				  <div class="col-sm-10">
					  <label class="radio-inline" >
						  <input type="radio" name="empGender" checked="checked" value="M"> 男
					  </label>
					  <label class="radio-inline">
						  <input type="radio" name="empGender"  value="F"> 女
					  </label>
				  </div>
			  </div>
			  <div class="form-group">
			 	  <label  class="col-sm-2 control-label">deptName</label>
			 	   <div class="col-sm-4">
					  <select class="form-control" name="empDeptId">
					  </select>
				   </div>
			  </div>
			  <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button type="button" class="btn btn-primary" id="emp_update_btn">修改</button>
		      </div>
		</form>
	    </div>
	  </div>
	  </div>
	</div>

	<!-- 增加模态框 -->
	<div class="modal fade" id="emp_add_model" tabindex="-1" role="dialog">
	  <div class="modal-dialog" role="document">
	    <div class="modal-content">
	      <div class="modal-header">
	        <button type="button" class="close" data-dismiss="modal" aria-label="Close"><span aria-hidden="true">&times;</span></button>
	        <h4 class="modal-title">添加员工</h4>
	      </div>
	      <div class="modal-body">
	      <!-- 添加表单 -->
	      <form class="form-horizontal">
			  <div class="form-group">
			    <label for="emp_name_input" class="col-sm-2 control-label">empName</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="empName" id="emp_name_input" placeholder="please input emp's name">
			   	  <span id="helpBlock2" class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
			    <label for="emp_email_input" class="col-sm-2 control-label">empEmail</label>
			    <div class="col-sm-10">
			      <input type="text" class="form-control" name="empEmail" id="emp_email_input" placeholder="please input emp's email">
			      <span id="helpBlock2" class="help-block"></span>
			    </div>
			  </div>
			  <div class="form-group">
				  <label for="emp_email_input" class="col-sm-2 control-label">empGender</label>
				  <div class="col-sm-10">
					  <label class="radio-inline" >
						  <input type="radio" name="empGender" checked="checked" value="M"> 男
					  </label>
					  <label class="radio-inline">
						  <input type="radio" name="empGender"  value="F"> 女
					  </label>
				  </div>
			  </div>
			  <div class="form-group">
			 	  <label  class="col-sm-2 control-label">deptName</label>
			 	   <div class="col-sm-4">
					  <select class="form-control" name="empDeptId">
					  </select>
				   </div>
			  </div>
			  <div class="modal-footer">
		        <button type="button" class="btn btn-default" data-dismiss="modal">关闭</button>
		        <button type="button" class="btn btn-primary" id="emp_save_btn">保存</button>
		      </div>
		</form>
	    </div>
	  </div>
	  </div>
	</div>
	
	<div class="container">
		<!-- 1、logo部分 -->
		<div class="row">
			<div class="col-md-12"><h1>SSM_CRUD</h1></div>
		</div>
		<!-- 2、添加删除按钮 -->
		<div class="row">
			<div class="col-md-4 col-md-offset-8">
				<button class="btn btn-primary" id="emp_add_btn">添加</button>
				<button class="btn btn-danger" id="emp_del_btn">删除</button>
			</div>
		</div>
		<!-- 3、显示分页列表 -->
		<div class="row">
			<table class="table table-hover" id="emps_table">
				<thead>
					<tr>
						<th><input type="checkbox" id="checkAll" /></th>
						<th>#</th>
						<th>empName</th>
						<th>gender</th>
						<th>Email</th>
						<th>deptName</th>
						<th>操作</th>
					</tr>
				</thead>
				<tbody>
				
				</tbody>
			</table>
		</div>
		<!-- 4、分页条 -->
		<div class="row">
			<!-- 分页信息 -->
			<div class="col-md-6" id="pageInfo">
			
			</div>
			<!-- 分页条 -->
			<div class="col-md-6" id="pageNav">
			</div>
		</div>
	</div>
</body>
<!-- 页面加载完成后就发送ajax请求到后端 -->
<script type="text/javascript">
	//定义全局变量存储总记录数
	var global_total,global_current_page;


	//员工姓名表单改变触发该函数
	$("#emp_name_input").change(function(){
		$("#emp_name_input").parent().removeClass("has-error has-success");
		$("#emp_name_input").next().text("");
		$.ajax({
			url:"${pageContext.request.contextPath}/isExistEmp",
			data:{"empName":$(this).val()},
			type:"POST",
			async:true,
			success:function(result){
				//无论成功与否都给保存按钮添加一个属性标识 (这里仅仅是个显示效果并没有拦截)
				if(result.code == 200){
					show_validate_info("#emp_name_input","success","用户名可用");
					$("#emp_save_btn").attr("ajax-va","success");
				} else if(result.code == 500){
					show_validate_info("#emp_name_input","error",result.data.error);
					$("#emp_save_btn").attr("ajax-va","error");
				}
			},
			dataType:"json"
		});
	});

	

	//点击保存就使表单ajax请求
	$("#emp_save_btn").click(function(){
		//1、保存员工之前先进行校验
		if(!validate_save()){
			return false;
		}
		//1、判断保存按钮的属性
		if($("#emp_save_btn").attr("ajax-va") == "error"){
			show_validate_info("#emp_name_input","error","用户名已存在");
			return false;
		}
		//2、保存员工  一定设置非异步的，不然还没保存还没执行完下面代码就已经执行了
		saveEmp();
	})
	
	//校验
	function validate_save(){
		//每次点击之前清空样式
		$("#emp_name_input").parent().removeClass("has-error has-success");
		$("#emp_name_input").next().text("");
		$("#emp_email_input").parent().removeClass("has-error has-success");
		$("#emp_email_input").next().text("");
		
		//使用正则表达式  英文字母或数字横杠下划线6到16位，中文2到5位
		var regName = /(^[a-zA-Z0-9_-]{6,16}$)|(^[\u2E80-\u9FFF]{2,5})/;
		var $empNameVal = $("#emp_name_input").val();
		
		if(!regName.test($empNameVal)){
			show_validate_info("#emp_name_input","error","姓名为6-16位的英文字母数字组合或者2-5位的中文");
			return false;
		} else {
			show_validate_info("#emp_name_input","success","");
		}
		var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		var $empEmailVal = $("#emp_email_input").val();
		if(!regEmail.test($empEmailVal)){
			show_validate_info("#emp_email_input","error","邮箱格式不正确");
			return false;
		} else {
			show_validate_info("#emp_email_input","success","");
		}
		//上面校验都通过就返回true
		return true;
	}
	
	//显示校验信息
	function show_validate_info(ele,status,info){
		if(status == "error"){
			$(ele).parent().addClass("has-error");
			$(ele).next().text(info);
		} else if(status == "success"){
			$(ele).parent().addClass("has-success");
			$(ele).next().text(info);
		}
	}
	
	//保存员工
	function saveEmp(){
		$.ajax({
			url:"${pageContext.request.contextPath}/saveEmp",
			data:$("#emp_add_model form").serialize(),
			type:"POST",
			async:false,
			success:function(result){
				//如果后台校验没有通过的话就在页面显示错误信息否则就关闭模态框并查询最后一页的数据
				if(result.code == 500){
					if(undefined != result.data.endError.empEmail){
						show_validate_info("#emp_email_input","error",result.data.endError.empEmail);
					}
					if(undefined != result.data.endError.empName){
						show_validate_info("#emp_name_input","error",result.data.endError.empName);
					}
				} else {
					alert("响应码:"+result.code+";响应信息:"+result.info);
					//3、关闭模态框
					$("#emp_add_model").modal("hide");
					//4、查最后一页的数据，Mybatis设置了参数合理化所以这里设置一个最大的数就一定是最后一页
					to_page(global_total);
				}
				
			},
			dataType:"json"
		})
	}
	
	function reset_form(ele){
		//重置所有的输入框
		$(ele)[0].reset();
		//移除所有的样式
		$(ele).find("*").removeClass("has-success has-error");
		//设置所有的信息都为空
		$(ele).find(".help-block").text("");
	}
	
	//点击添加按钮弹出模态框
	$("#emp_add_btn").click(function(){
		//每次弹出添加模态框之前先清空表单数据
		reset_form("#emp_add_model form");
		
		$("#emp_add_model").modal({
			backdrop:"static"
		})
		echoDepts("#emp_add_model select");
	})

	//ajax请求到后端回显部门信息
	function echoDepts(ele){
		//每次回显之前清空下拉列表
		$(ele).empty();
		
		$.ajax({
			url:"${pageContext.request.contextPath}/echoDepts",
			type:"POST",
			async:true,
			success:function(result){
				$.each(result.data.depts,function(){
					var $opEle = $("<option></option>").append(this.deptName).prop("value",this.deptId);
					$opEle.appendTo($(ele));
				})
			},
			dataType:"json"
		})
	}

	$(function(){
		to_page(1);
	})
	
	//发送ajax请求到后端
	function to_page(page){
		$.ajax({
			url:"${pageContext.request.contextPath}/showEmpPageList",
			data:{"page":page},
			type:"POST",
			async:true,
			success:function(result){
				//1、解析显示列表数据
				build_emps_table(result);
				//2、解析显示分页文字信息
				build_page_info(result);
				//3、解析显示分页条信息
				build_page_nav(result);
			},
			dataType:"json"
		});
	}
	
	//解析列表数据
	function build_emps_table(result){
		global_total = result.data.pageInfo.total;
		global_current_page = result.data.pageInfo.pageNum;
		//每次调用都清空之前的数据
		$("#emps_table tbody").empty();
		$.each(result.data.pageInfo.list,function(index,item){
			var checkTd = $("<td><input type='checkbox' class='check_itme' /> </td>");
			var empIdTd = $("<td></td>").append(item.empId);
			var empNameTd = $("<td></td>").append(item.empName);
			var empGenderTd = $("<td></td>").append(item.empGender=="M" ? "男":"女");
			var empEmailTd = $("<td></td>").append(item.empEmail);
			var empDeptName = $("<td></td>").append(item.dept.deptName);
			/* 
			<button class="btn btn-primary btn btn-default btn-sm">
						<span class="" aria-hidden="true"></span>编辑
					</button>
			*/
			var editBtn = $("<button></button>").addClass("btn btn-primary btn btn-default btn-sm edit_btn")
							.append($("<span></span>").addClass("glyphicon glyphicon-pencil ")).append("编辑");
			//给编辑按钮添加一个自定义属性保存id
			editBtn.attr("edit-id",item.empId);
			var delBtn = $("<button></button>").addClass("btn btn-danger btn btn-default btn-sm del_btn")
			.append($("<span></span>").addClass("glyphicon glyphicon-trash")).append("删除");
			//给删除按钮添加一个自定义属性保存id
			delBtn.attr("del-id",item.empId);
			var btnTd = $("<td></td>").append(editBtn).append(" ").append(delBtn);
			
			$("<tr></tr>").append(checkTd)
						  .append(empIdTd).append(empNameTd).append(empGenderTd).append(empEmailTd)
						  .append(empDeptName).append(btnTd)
						  .appendTo($("#emps_table tbody"));
		});
	}
	//完成单个删除功能
	$(document).on("click",".del_btn",function(){
		//find("td:eq(2)") 查找td元素 过滤条件是索引为2的
		var empName = $(this).parents("tr").find("td:eq(2)").text();
		if(confirm("你是否要删除"+empName+"?")){
			//如果点击了确定就发送ajax请求到后台
			delEmp($(this).attr("del-id"));
		}
	});
	
	//完成批量删除功能
	$("#emp_del_btn").click(function(){
		var $check_array = $("tbody :checked");
		var empNames = "";
		var empIds = "";
		$.each($check_array,function(index,item){
			empNames += "【"+$(item).parents("tr").find("td:eq(2)").text()+"】,";
			empIds += $(item).parents("tr").find("td:eq(1)").text()+"-";
		});
		empNames = empNames.substring(0,empNames.length-1); //substring()以索引为单位，前包后不包
		empIds = empIds.substring(0,empIds.length-1);
		
		if(confirm("你要批量删除"+empNames+"吗？")){
			delEmp(empIds);
		}
	});
	
	
	function delEmp(ids){
		$.ajax({
			url:"${pageContext.request.contextPath}/deleteEmp/"+ids,
			type:"DELETE",
			async:true,
			success:function(result){
				alert(result.info);
				//查当前页数据
				to_page(global_current_page);
			},
			dataType:"json"
		})
	}
	
	
	//完成全选/全不选功能
	//使用原生的属性推荐prop(),自定义的属性推荐使用attr()
	$("#checkAll").click(function(){
		//使列表中的多选框的状态同表头多选框一致
		$(".check_itme").prop("checked",$(this).prop("checked"));
	})
	
	//因为列表中的多选框是发送ajax请求到后端读到数据时才创建的，
	//所以直接绑定点击事件无效(绑定时没有多选框),这里使用on方法
	$(document).on("click",".check_itme",function(){
		var flag = $("tbody :checked").length == $("tbody [type='checkbox']").length;
		$("#checkAll").prop("checked",flag);
	})
	
	
	//解析显示分页信息
	/* 
	<div class="col-md-6" id="pageInfo">
				总记录数为<span>${pageInfo.total }；</span>
				总页数为<span>${pageInfo.pages }；</span>
				当前页数为<span>${pageInfo.pageNum }；</span>
			</div>
			*/
	function build_page_info(result){
		var $pageInfo = $("#pageInfo");
		$pageInfo.empty();
		
		$pageInfo.append("总记录数为").append($("<span></span>").append(result.data.pageInfo.total)).append(",")
				 .append("总页数为").append($("<span></span>").append(result.data.pageInfo.pages)).append(",")
				 .append("当前页数为").append($("<span></span>").append(result.data.pageInfo.pageNum));
		}
	
	//分页条
	function build_page_nav(result){
		$("#pageNav").empty();
		var pageInfo = result.data.pageInfo; 
		
		var ulEle = $("<ul></ul>").addClass("pagination");
		
		var firstLi = $("<li></li>").append($("<a></a>").prop("href","#").append($("<span></span>").append("首页")));
		var preLi = $("<li></li>").append($("<a></a>").prop("href","#").append($("<span></span>").append("&laquo;")));
		
		//如果当前页数等于1就设置首页和上一页不能选中
		if(pageInfo.pageNum == 1){
			firstLi.addClass("disabled");
			preLi.addClass("disabled");
		} else {
			//否则就可以请求到后台
			firstLi.click(function(){
				to_page(1);
			})
			preLi.click(function(){
				to_page(pageInfo.pageNum - 1);
			})
		}
		
		
		var lastLi = $("<li></li>").append($("<a></a>").prop("href","#").append($("<span></span>").append("尾页")));
		var nextLi = $("<li></li>").append($("<a></a>").prop("href","#").append($("<span></span>").append("&raquo;")));
		//如果当前页数等于最大页数就设置首页和上一页不能选中
		if(pageInfo.pageNum == pageInfo.pages){
			lastLi.addClass("disabled");
			nextLi.addClass("disabled");
		} else {
			//否则就可以请求到后台
			lastLi.click(function(){
				to_page(pageInfo.pages);
			})
			nextLi.click(function(){
				to_page(pageInfo.pageNum + 1);
			})
		}
		
		
		//1、先添加首页和上一页元素
		ulEle.append(firstLi).append(preLi);
		
		$.each(pageInfo.navigatepageNums,function(index,item){
			var pageLi = $("<li></li>").append($("<a></a>").prop("href","#").append(item));
			//2、再添加页码
			ulEle.append(pageLi);
			
			//如果当前页数等于遍历中的一页就使其选中
			if(item == pageInfo.pageNum){
				pageLi.addClass("active");
			}
			pageLi.click(function(){
				to_page(item);
			});
			
		});
		//3、再添加下一页和尾页元素
		ulEle.append(nextLi).append(lastLi);
		
		var navEle = $("<nav></nav>").append(ulEle).appendTo($("#pageNav"));
	}
	
	//编辑按钮点击事件
	//这种会失效，因为在按钮创建之前就绑定了所有没有生效
	//解决方案：1、直接在按钮创建好的时候绑定事件。 2、用on方法：就算是绑定这个方法之后创建好的元素也会绑定上
	/* $(".edit_btn").click(function(){
		alert("aaa");
	}) */
	/*  
	#emps_table:给该元素绑定on方法
	on:param1(click):一个或多个事件
	   param2(.edit_btn):绑定on方法元素的子元素---》给该元素绑定param1的事件
	   param3(function(){}):param1的事件触发回调的函数
	*/
	//点击编辑按钮显示修改模态框
	$("#emps_table").on("click",".edit_btn",function(){
		$("#emp_update_model").modal({
			backdrop:"static"
		})
		//1、回显所有的部门信息
		echoDepts("#emp_update_model select");
		//2、回显该员工的所有信息
		echoEmp($(this).attr("edit-id"));
		//给修改按钮添加自定义属性
		$("#emp_update_btn").attr("edit-id",$(this).attr("edit-id"));
	})
	
	//根据id去后台查询员工并在修改模态框中回显
	function echoEmp(id){
		$.ajax({
			url:"${pageContext.request.contextPath}/echoEmp/"+id,
			type:"POST",
			async:true,
			success:function(result){
				
				var emp = result.data.emp;
				$("#emp_update_model p").text(emp.empName);
				$("#emp_update_email_input").val(emp.empEmail);
				$("#emp_update_model input[name=empGender]").val([emp.empGender]);
				$("#emp_update_model select").val([emp.empDeptId]);
			},
			dataType:"json"
		})	   
	}
	
	$("#emp_update_btn").click(function(){
		//先校验
		var regEmail = /^([a-z0-9_\.-]+)@([\da-z\.-]+)\.([a-z\.]{2,6})$/;
		var $empEmailVal = $("#emp_update_email_input").val();
		if(!regEmail.test($empEmailVal)){
			show_validate_info("#emp_update_email_input","error","邮箱格式不正确");
			return false;
		} else {
			show_validate_info("#emp_update_email_input","success","");
		}
		
		$.ajax({
			url:"${pageContext.request.contextPath}/updateEmp/"+$(this).attr("edit-id"),
			type:"PUT",
			data:$("#emp_update_model form").serialize(),
			async:true,
			success:function(result){
				//保存成功后关闭模态框然后查询当前页的数据
				$("#emp_update_model").modal("hide");
				to_page(global_current_page);
			},
			dataType:"json"
		})
	})
	
</script>

</html>