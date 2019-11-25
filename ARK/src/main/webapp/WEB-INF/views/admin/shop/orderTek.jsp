<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../../includes/adminHeader.jsp" %>




<style>
.table-responsive{
font-size: 14px;
font-family: '맑은 고딕', 'Malgun Gothic', 'Dotum', '돋움', 'arial', 'verdana', sans-serif;
color: #2e3039;
word-spacing: -1px;
margin: 0 0 30px;
padding: 30px 20px;
border-radius: 2px;
border: 1px solid #ddd;
background: #fff;
box-shadow: 0px 2px 1px 0px rgba(205,211,222,1);
}

.a{
font-family: '맑은 고딕', 'Malgun Gothic', 'Dotum', '돋움', 'arial', 'verdana', sans-serif;
color: #2e3039;
word-spacing: -1px;
border-spacing: 0;
border-collapse: collapse;
text-align: center;
margin: 0;
word-wrap: break-word;
vertical-align: top;
border: 1px solid #dedede;
border-top-width: 0;
height: 31px;
font-size: 13px;
line-height: 26px;
padding: 5px 4px 4px;
border-right-width: 0;
}
.b{
font-size: 14px;
font-family: '맑은 고딕', 'Malgun Gothic', 'Dotum', '돋움', 'arial', 'verdana', sans-serif;
color: #2e3039;
word-spacing: -1px;
border-spacing: 0;
border-collapse: collapse;
line-height: 1.5;
text-align: center;
}
</style>




<section id="content">
 
 <ul class="orderList">
 <c:forEach items="${orderList}" var="orderList">
 <li>
 <div>
 <div class="table-responsive">
  <p><span>주문번호:</span><a href="/admin/shop/orderView?n=${orderList.orderId}">${orderList.orderId}</a></p>
  <p><span>주문자:</span>${orderList.userId}</p>
  <p><span>수령인:</span>${orderList.orderRec}</p>
  <p><span>주소:</span>(${orderList.userAddr1}) ${orderList.userAddr2} ${orderList.userAddr3}</p>
  <p><span>가격:</span><fmt:formatNumber pattern="###,###,###" value="${orderList.amount}" /> 원</p> 
  <p><span>상태:</span>${orderList.delivery}</p>
 </div>
 </div>
 
 </li>
 </c:forEach>
</ul>

</section>

<%@ include file="../../includes/adminFooter.jsp" %>