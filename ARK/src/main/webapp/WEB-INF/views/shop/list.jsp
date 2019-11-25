<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ include file="../includes/header.jsp"%>

<style>
.allkill_title {
	position: relative;
	margin-bottom: 20px;
	height: 28px;
	font-size: 20px;
	font-weight: 900;
	color: #222;
	text-align: center;
}

section#content ul li {
	display: inline-block;
	margin: 10px;
}

section#content div.goodsThumb img {
	width: 100%;
	-webkit-transition: height 0.2s;
	-moz-transition: height 0.2s;
	height: auto;
	text-align: center;
	overflow: visible;
	position: relative;
	-moz-transition: height 0.2s;
}

section#content div.goodsName {
	display: inline-block;
	-webkit-transition: height 0.2s;
	-moz-transition: height 0.2s;
	transition: height 0.2s;
	height: auto !important;
	min-height: 160px;
	font-size: 20px;
	text-align: right;
	font-weight: 500;
}

section#content div.goodsName a {
	color: #000;
}

.section_module-wrap {
	background: #fff;
	margin-bottom: 0;
	border-radius: 6px;
}

.item_list_wrap {
	float: none;
	display: block;
	top: 0px;
	left: 0px;
	width: 1500px;
	margin: 0 auto;
}

.inner {
	position: relative;
	border: 3px solid rgba(0,123,255,.25);
	background: #fff;
}

.Thumb {
	margin: 0 0 17px;
}

.Thumb h2 {
	width: 1000px;
	height: 20px;
	margin: 0 30px 0 350px;
	border-bottom: 2px dotted #c2c2c2;
	padding: 10px 0 35px 0;
	font-weight: bold;
	font-size: 30px;
	font-family: "맑은고딕", "Malgun Gothic", Arial, "돋움", Dotum, sans-serif;
	color: #9f9f9f;
	text-align: center;
	font-weight: 900;
}

.goodsThumb {
	text-align: center;
}

.goodsThumb_title {
	display: block;
	overflow: hidden;
	margin: 12px 13px 0;
	font-size: 20px;
	color: #222;
	text-overflow: ellipsis;
	white-space: nowrap;
	text-decoration: none;
	letter-spacing: 0;
}

.price {
	font-size: 15px;
	font-weight: 900;
	font-family: auto;
}

.function {
    overflow: hidden;
    font-size: 15px;
    text-align: right;
    line-height: 38px;
    border: 0px solid #d7d5d5;
    margin: 0 26% 0 0;
}

.normalmenu{
    display: inline;
    margin: 0 4px 0 0;
}

.sub_top_ban {
    width: 100%;
    clear: both;
    height: 240px;
    margin-bottom: 30px;
    background-color: #222;
    background-image: url(/resources/images/sub_top_bg.jpg);
    background-position-x: center;
    background-repeat: no-repeat;
    background-position-y: 0px;
    background-attachment: fixed;
    background-size: cover;
    background-origin: padding-box;
}

</style>

<div class="sub_top_ban"></div>
<section id="content">
	<div class="section_module-wrap">
		<div class="section_module-wrap">
			<div class="Thumb">
				<h2>
					<span>도마뱀</span>
				</h2>
			</div>
			<div class="function">
				<ul id="type"
					class="normalmenu">
					<li class="xans-record"><a
						href="">신상품</a></li>
					<li class="xans-record"><a
						href="">상품명</a></li>
					<li class="xans-record"><a
						href="">낮은가격</a></li>
					<li class="xans-record"><a
						href="">높은가격</a></li>
					<li class="xans-record"><a
						href="">제조사</a></li>
					<li class="xans-record"><a
						href="">사용후기</a></li>
				</ul>
			</div>
			<div class="item_list_wrap">
				<ul>
					<c:forEach items="${list}" var="list">
						<li>
							<div class="inner">
								<div class="goodsThumb">
									<a href="/shop/view?n=${list.gdsNum }"> <img
										style="width: 300px; height: 300px;"
										src="/resources/images/upload${list.gdsThumbImg}"> <span
										class="goodsThumb_title">${list.gdsName}</span>
									</a> <span class="price" ><fmt:formatNumber pattern="###,###,###" value="${list.gdsPrice}" /> 원</span>
								</div>
							</div>
						</li>
					</c:forEach>
				</ul>
			</div>
		</div>
	</div>
</section>

<%@ include file="../includes/footer2.jsp"%>