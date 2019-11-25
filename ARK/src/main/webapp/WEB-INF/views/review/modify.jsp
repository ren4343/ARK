<%@ page language="java" contentType="text/html; charset=UTF-8"
pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ include file="../includes/header.jsp"%>

<h1>수정 하기</h1> 
<form role="form" action="/review/modify"
method="post">
<input type="hidden" name="${_csrf.parameterName }" value="${_csrf.token }" />
<div>
게시물 번호<input name="num" value='<c:out value="${review.num }"/>' readonly="readonly">
</div>

<div>
제목<input name="title" value='<c:out value="${review.title }"/>'>
</div>

<div>
내용
<textarea rows="3" name="content"><c:out
value="${review.content }" /></textarea>
</div>

<p>썸네일</p>
<img style="width:200px; height:150px;"  src="/resources/images/upload${review.gdsthumbimg}">


<div>
작성자<input name="writer" value='<c:out value="${review.writer }"/>' readonly="readonly">
</div>

<div>
날짜<input
name="ttdate"
value='<fmt:formatDate
pattern="yyyy/MM/dd"
value="${review.ttdate }"/>'
readonly="readonly">
</div>

<button type="submit" data-oper="modify" class="btn btn-warning">수정</button>
<button type="submit" data-oper="remove" class="btn btn-danger">삭제</button>
<button type="submit" data-oper="list" class="btn btn-info">목록 </button>
</form>

<script>
$(document).ready(function() {
console.log("history.state : " + history.state);
var formObj = $("form");
$('button').on("click", function(e) {
e.preventDefault();
var operation = $(this).data("oper");

if (operation === 'remove') {
formObj.attr("action", "/review/remove");

}else if(operation === 'list'){
	formObj.attr("action","/review/list").attr("method","get");
var pageNumTag
=$("input[name='pageNum']").clone();
var amountTag
=$("input[name='amount']").clone();
formObj.empty();
formObj.append(pageNumTag);
formObj.append(amountTag);
}

formObj.submit();
});
});
</script>


<%@ include file="../includes/footer2.jsp"%>