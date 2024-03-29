<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!-- jstl fmt 쓸때 위와 같음.
fmt : formatter 형식 맞춰서 표시 -->

<%@ include file="includes/header.jsp"%>
<br><br><br><br><br><br><br><br><br><br>

<div class="row">
<div class="col-lg-12">
<div class="panel panel-default">
<h1>로그아웃 처리</h1>
<h2>${error}</h2>
<h2>${logout }</h2>

<div class="panel-body">

<form role="form" method="post" action="/customLogout">
<input type="hidden"
name="${_csrf.parameterName }"
value="${_csrf.token }"/>
<fieldset>
<a href="index.html" class="btn btn-lg btn-success btn-block">logout</a>
</fieldset>
<input name="username" type="hidden" value="<sec:authentication property="principal.username"/>">


</form>
<!-- 겟 방식으로 로그아웃 페이지에 접근 하고,
로그아웃 버튼을 누르면 포스트 방식으로 처리  -->
</div>
</div>
</div>
</div>

<script type="text/javascript">
$(".btn-success").on("click",function(e){
	e.preventDefault();
	$("form").submit();

});

</script>
<c:if test="${param.logout !=null}">
<script>
$(document).ready(function(){
	alert("로그아웃");	
});
</script>
<!-- 로그아웃 파라미터 값이 있다면 , 로그아웃 안내창 표시 -->
</c:if>
<%@ include file="includes/footer.jsp"%>










