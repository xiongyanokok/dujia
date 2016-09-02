<%@ page language="java" contentType="text/html; charset=utf-8" pageEncoding="utf-8"%>
<%@ include file="../common/taglibs.jsp"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>度假广告查询</title>
<%@ include file="../common/css.jsp"%>
<%@ include file="../common/js.jsp"%>
<style>
	html{*overflow-y:scroll;*overflow-x:hidden}
	td{line-height:30px}
	.inputText{width:200px;height:22px}
	
	#tab{position:relative;}
	#tab .tabList ul li{
		float:left;
		background:#fefefe;
		background:-moz-linear-gradient(top, #fefefe, #ededed);	
		background:-o-linear-gradient(left top,left bottom, from(#fefefe), to(#ededed));
		background:-webkit-gradient(linear,left top,left bottom, from(#fefefe), to(#ededed));
		border:1px solid #ccc;
		padding:5px 0;
		width:150px;
		text-align:center;
		margin-left:-1px;
		position:relative;
		cursor:pointer;
	}
	#tab .tabList li.cur{
		border-bottom:none;
		background:#4682B4;
	}
</style>
</head>
<body style="background: #afb8bf; overflow-x: hidden; overflow-y: scroll; *overflow-y: hidden">
<table>
	<tr>
		<td background="${_domain}/images/RigNav.gif" height="31">
			<table>
				<tr>
					<td class="TextRig"><img src="${_domain}/images/nav_3.gif" style="width: 11" height="7" /></td>
					<td style="width: 97%" class="NavText">您的位置：度假广告管理&gt;度假广告查询</td>
				</tr>
			</table>
		</td>
	</tr>
	<tr>
		<td>
			<div class="RightBg">
				<div class="RightTab">
					<form action="${_domain}/admin/advert/homeFocusList.html" method="post" id="pageform" name="advertForm">
						<table id="searchTable">
							<tr>
								<td width="80px;" align="right">
									<span class="cx" style="margin:0px 5px 0px 0px">平台</span>
								</td>
								<td>
									<input type="hidden" id="plateformValue" value="${advert.plateform}"/>
									<select id="plateform" name="plateform" style="width: 130px; height: 22px">
										<option value="">全部</option>
									</select>
								</td>
								<td width="80px;" align="right">
									<span class="cx" style="margin:0px 5px 0px 0px">页面位置</span>
								</td>
								<td>
									<input type="hidden" id="moduleValue" value="${advert.module}"/>
									<select id="module" name="module" style="width: 130px; height: 22px" onchange="getPositions();">
										<option value="">全部</option>
									</select>
								</td>
								<td width="80px;" align="right">
									<span class="cx" style="margin:0px 5px 0px 0px">广告位置</span>
								</td>
								<td>
									<input type="hidden" id="positionValue" value="${advert.position}"/>
									<select id="position" name="position" style="width: 130px; height: 22px">
										<option value="">全部</option>
									</select>
								</td>
								<td width="80px;" align="right">
									<span class="cx" style="margin:0px 5px 0px 0px">投放时间</span>
								</td>
								<td>
									<input id="startTimeStr" name="startTime" type="text" readonly="readonly" class="Wdate" style="width: 130px;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd'})" value="<fmt:formatDate value="${advert.startTime}" pattern="yyyy-MM-dd" />" />&nbsp; -
									<input id="endTimeStr" name="endTime" type="text" readonly="readonly" class="Wdate" style="width: 130px;" onclick="WdatePicker({dateFmt:'yyyy-MM-dd',minDate:'#F{$dp.$D(\'startTimeStr\',{d:0});}'})" value="<fmt:formatDate value="${advert.endTime}" pattern="yyyy-MM-dd" />" />&nbsp;&nbsp;
								</td>
								<td align="right">
									<input type="hidden" id="states" name="states" value="${advert.states}"/>
									<input style="width: 120px; height: 30px; color: #485058" type="button" onclick="submitForm();" value="查询" />
								</td>
							</tr>
						</table>
					</form>
				</div>
				<div class="H10"></div>
				<div class="RightTab">
					<table>
						<tr>
							<td style="line-height:25px">
								<div id="tab" style="margin-top:2px;">
								  <div class="tabList">
									<ul>
										<li onclick="search(5)">
											<a style="text-decoration:none;font-weight:bold;">全部</a>
										</li>
										<li onclick="search(1)">
											<a style="text-decoration:none;font-weight:bold;">展示中</a>
										</li>
										<li onclick="search(0)">
											<a style="text-decoration:none;font-weight:bold;">待展示</a>
										</li>
										<li onclick="search(3)">
											<a style="text-decoration:none;font-weight:bold;">已暂停</a>
										</li>
										<li onclick="search(4)">
											<a style="text-decoration:none;font-weight:bold;">已过期</a>
										</li>
									</ul>
								  </div>
								</div>
							</td>
							<td  align="right">
								<input style="width: 120px; height: 30px; color: #485058" type="button" onclick="toAdd();" value="添加" />
							</td>
						</tr>
						<tr>
							<td colspan="2">
								<table class="LBoder">
									<thead>
										<tr class="TextCen fB GDDray">
											<td style="width: 50px" class="LBodRit">序号</td>
											<td style="width: 50px" class="LBodRit">平台</td>
											<td style="width: 100px" class="LBodRit">展示页面</td>
											<td style="width: 100px" class="LBodRit">展示位置</td>
											<td style="width: 150px" class="LBodRit">标题名称</td>
											<td style="width: 100px" class="LBodRit">图片</td>
											<td style="width: 150px" class="LBodRit">投放时段</td>
											<td style="width: 100px" class="LBodRit">操作时间</td>
											<td style="width: 100px" class="LBodRit">操作人</td>
											<td style="width: 100px" class="LBodRit">状态</td>
											<td style="width: 100px" class="LBodRit">操作</td>
										</tr>
									</thead>
									<tbody>
										<c:forEach varStatus="vstatus" var="advert" items="${pageInfo.pageList }">
											<tr class="TextCen LBodTop">
												<td class="LBodRit LBodTop" style="color: gray;">${vstatus.count+(pageInfo.currentPage-1)*pageInfo.perPageRows}</td>
												<td class="LBodRit LBodTop" style="color: gray;">${sourceMap[advert.plateform]}</td>
												<td class="LBodRit LBodTop" style="color: gray;">${pAdvert[advert.module]}</td>
												<td class="LBodRit LBodTop" style="color: gray;">${pAdvert[advert.position]}</td>
												<td class="LBodRit LBodTop" style="color: gray;">${advert.titleName }</td>
												<td class="LBodRit LBodTop" style="color: gray;"><img id="viewImg" style="width: 75px; height: 50px" src="${advert.productImage}" /></td>
												<td class="LBodRit LBodTop" style="color: gray;">
													<fmt:formatDate value="${advert.startTime }" pattern="yyyy-MM-dd" />/
													<fmt:formatDate value="${advert.endTime }" pattern="yyyy-MM-dd" />
												</td>
												<td class="LBodRit LBodTop" style="color: gray;"><fmt:formatDate value="${advert.updateTime }" pattern="yyyy-MM-dd HH:mm:ss" /></td>
												<td class="LBodRit LBodTop" style="color: gray;">${advert.updateUser}</td>
												<td class="LBodRit LBodTop" style="color: gray;">
													<c:if test="${advert.states==0}">待展示</c:if>
													<c:if test="${advert.states==1}">展示中</c:if>
													<c:if test="${advert.states==3}">已暂停</c:if>
													<c:if test="${advert.states==4}">已过期</c:if>
												</td>
												<td class="LBodRit LBodTop">
													<c:if test="${advert.states!=1}">  
														<a href="${_domain}/admin/advert/toHomeFocusAddorUp.html?id=${advert.id}"><font color="blue">编辑</font></a>&nbsp;
													</c:if>
													<a href="${_domain}/admin/advert/showHomeFocus.html?id=${advert.id}"><font color="blue">查看</font></a>&nbsp;
													<c:if test="${advert.states==3}">  
														<a href="#" onclick="updateStaus(${advert.id},0);"><font color="blue">启用</font></a>
													</c:if>
													<c:if test="${advert.states!=3}">
														<a href="#"  onclick="updateStaus(${advert.id},3);"><font color="blue">暂停</font></a>
													</c:if>
												</td>
											</tr>
										</c:forEach>
									</tbody>
								</table>
							</td>
						</tr>
						<tr>
							<td colspan="11" class="td1">
								<div align="right">
									<c:out value="${pageInfo.html}" escapeXml="false" />
								</div>
							</td>
						</tr>
					</table>
				</div>
			</div>
		</td>
	</tr>
</table>
<script type="text/javascript">
	function search(obj){
		if(obj<5){
			$("#states").val(obj);
		}else{
			$("#states").val("");
		}
		submitForm();
	}

	function toAdd(){
		window.location.href ="${_domain}/admin/advert/toHomeFocusAddorUp.html";
	}
	$(function() {
		var states = '${advert.states}';
		if(states==''){
			$('div ul li:first-child').addClass('cur').children("a").css("color","#FFF");
		}else if(states==1){
			$("div ul li").eq(-4).addClass('cur').children("a").css("color","#FFF");
		}else if(states==3){
			$("div ul li").eq(-2).addClass('cur').children("a").css("color","#FFF");
		}else if(states==4){
			$("div ul li").eq(-1).addClass('cur').children("a").css("color","#FFF");
		}else{
			$("div ul li").eq(-3).addClass('cur').children("a").css("color","#FFF");
		}
		moduleChange();
		plateformChange();
	})
	
	//更改订单状态
	function updateStaus(id,status) {
		var msg = (status==3)?"确认暂停此广告":"确认启用此广告";
		if(confirm(msg)){
			$.ajax({
				type : "POST",
				async : false,
				url : "${_domain}/admin/advert/updateStatus.html?status="+status+"&id="+id,
				contentType : "application/json; charset=utf-8",
				success : function(data) {
					var obj = eval("(" + data + ")");
					alert(obj.msg);
					submitForm();
				},
				error : function() {
					alert("更改状态失败");
				}
			});
		}
	}
	//动态加载平台下拉选项
	function plateformChange() {
		$("#plateform").children().remove();
		var plateform_select = ($("#plateformValue").val()=='') ?0:$("#plateformValue").val();
		$.ajax({
			type : "POST",
			async : false,
			url : "${_domain}/admin/advert/getPlateformList.html?selected="+plateform_select,
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				$("#plateform").append(data);
			},
			error : function() {
				$("#plateform").append('<option value="">无数据</option>');
			}
		});
	}
	
	//动态加载页面设置下拉选项
	function moduleChange() {
		$("#module").children().remove();
		var module_select = $("#moduleValue").val();
		$.ajax({
			type : "POST",
			async : false,
			url : "${_domain}/admin/advert/getModuleList.html?selected="+module_select,
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				$("#module").append(data);
			},
			error : function() {
				$("#module").append('<option value="">无数据</option>');
			}
		});
		getPositions();
	}
	//动态加载广告位置下拉选项
	function getPositions() {
		$("#position").children().remove();
		var plateform = $("#plateform").val();
		var module_select = $("#module").val();
		var pos_select = $("#positionValue").val();
		$.ajax({
			type : "POST",
			async : false,
			url : "${_domain}/admin/advert/getPositionList.html?plateform="+ plateform + "&module=" + module_select+"&selected="+pos_select,
			contentType : "application/json; charset=utf-8",
			success : function(data) {
				$("#position").append(data);
			},
			error : function() {
				$("#position").append('<option value="">无数据</option>');
			}
		});
	}
	function submitForm(){
		$("#pageform").submit();
	}

</script>
</body>
</html>