<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://www.springframework.org/security/tags"
	prefix="sec"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<!DOCTYPE html>
<html>
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<script src="https://code.jquery.com/ui/1.12.1/jquery-ui.min.js"
	integrity="sha256-VazP97ZCwtekAsvgPBSUwPFKdrwD3unUfSGVYrahUqU="
	crossorigin="anonymous">
	
</script>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">


<script src="http://code.jquery.com/jquery-latest.js"></script>


<!--다음 api 기능 -->
<script src="http://dmaps.daum.net/map_js_init/postcode.v2.js"></script>

<style>
.w3-margin-top {
	margin-top: 16px !important;
}

.w3-card-4 {
	box-shadow: 0 4px 10px 0 rgba(0, 0, 0, 0.2), 0 4px 20px 0
		rgba(0, 0, 0, 0.19);
}

.w3-margin-top .infoForm {
	margin: 0 auto;
	width: 950px;
	margin-top: 100px;
}

.w3-margin-top {
	margin-top: 30px !important;
    text-align: center;
    font-family: cursive;
}

.w3-margin-top h3{
	font-weight: 400;
	margin:10px 0;
	font-size: xx-large;

}

.list_usermenu {
    position: absolute;
    right: 30%;
    font-weight: 900;
}

.id-btn {
	width: 180px;
	height: 40px;
	line-height: 40px;
	border: 1px #3399dd solid;
	margin: 15px auto;
	background-color: #f7f7f7;
	text-align: center;
	font-size: 18px;
	cursor: pointer;
	color: #333;
	border-radius: .25rem;
}

.form-cont {
	width: 300px;
	padding: .375rem .75rem;
	font-size: 1rem;
	font-weight: 400;
	line-height: 1.5;
	color: #495057;
	background-color: #fff;
	background-clip: padding-box;
	border: 1px solid #ced4da;
	border-radius: .25rem;
	transition: border-color .15s ease-in-out, box-shadow .15s ease-in-out;
}

.nameform {
	color: #6b6b6b;
	padding-left: 10px;
	background: #f3f4f8;
	align: left;
	border: 2px solid #dedee0;
	text-align: center;
}

.infoWrite {
	padding: 30px;
	border: 1px soid #e4e4e4;
	background: #f7f7f7;
}

.infoWrite table {
	width: 100%;
}

.infoWrite th {
	padding-left: 24px;
	text-align: left;
	font-size: 15px;
}

.infoWrite td, .infoWrite th {
	padding: 20px 0 20px;
}

.infoWrite input[type=password], .infoWrite input[type=text], .infoWrite select
	{
	box-sizing: border-box;
	height: 36px;
	width: 42%;
}

.my_line {
	border: 2px solid #dedee0;
}

.orderOpne_bnt {
	width: 100%;
	font-size: 18px;
	padding: 0px;
	height: 40px;
	line-height: 40px;
	border: #3399dd00;
	background-color: #ffffff;
}

.orderOpne_bnt :hover {
	box-shadow: 200px 0 0 0 rgba(0, 0, 0, 0.5) inset;
}
</style>

<script>
	//본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
	function sample4_execDaumPostcode() {
		new daum.Postcode(
				{
					oncomplete : function(data) {
						// 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

						// 도로명 주소의 노출 규칙에 따라 주소를 조합한다.
						// 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
						var fullRoadAddr = data.roadAddress; // 도로명 주소 변수
						var extraRoadAddr = ''; // 도로명 조합형 주소 변수

						// 법정동명이 있을 경우 추가한다. (법정리는 제외)
						// 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
						if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
							extraRoadAddr += data.bname;
						}
						// 건물명이 있고, 공동주택일 경우 추가한다.
						if (data.buildingName !== '' && data.apartment === 'Y') {
							extraRoadAddr += (extraRoadAddr !== '' ? ', '
									+ data.buildingName : data.buildingName);
						}
						// 도로명, 지번 조합형 주소가 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
						if (extraRoadAddr !== '') {
							extraRoadAddr = ' (' + extraRoadAddr + ')';
						}
						// 도로명, 지번 주소의 유무에 따라 해당 조합형 주소를 추가한다.
						if (fullRoadAddr !== '') {
							fullRoadAddr += extraRoadAddr;
						}

						// 우편번호와 주소 정보를 해당 필드에 넣는다.
						document.getElementById('uoop').value = data.zonecode; //5자리 새우편번호 사용
						document.getElementById('doro').value = fullRoadAddr;
						document.getElementById('jibun').value = data.jibunAddress;

						// 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
						if (data.autoRoadAddress) {
							//예상되는 도로명 주소에 조합형 주소를 추가한다.
							var expRoadAddr = data.autoRoadAddress
									+ extraRoadAddr;
							document.getElementById('guide').innerHTML = '(예상 도로명 주소 : '
									+ expRoadAddr + ')';

						} else if (data.autoJibunAddress) {
							var expJibunAddr = data.autoJibunAddress;
							document.getElementById('guide').innerHTML = '(예상 지번 주소 : '
									+ expJibunAddr + ')';

						} else {
							document.getElementById('guide').innerHTML = '';
						}
					}
				}).open();
	}
</script>


<title>회원정보 변경</title>
</head>
<body>
	<div class="w3-content w3-container w3-margin-top">
		<div class="infoForm">
			<div class="w3-container w3-card-4">
				<div class="w3-center w3-large w3-margin-top">
					<h3>회원 정보변경</h3><a href="/withdrawal" class="list_usermenu">회원탈퇴</a>
				</div>		
				<div>
					<form action="/member/mypage" method="POST"
						enctype="multipart/form-data">
						<div class="inputArea">

							<div class="select_img" style="text-align-last: center;">

								<img name="file" width="150px" height="150px"
									src="/resources/images/upload${list }" /> <input type="file"
									id="gdsImg" name="file" style="text-align-last: start;">
							</div>

							<script>
								$("#gdsImg")
										.change(
												function() {
													if (this.files
															&& this.files[0]) {
														var reader = new FileReader;
														reader.onload = function(
																data) {
															$(".select_img img")
																	.attr(
																			"src",
																			data.target.result);
														}
														reader
																.readAsDataURL(this.files[0]);
													}
												});
							</script>

						</div>
						<div class="infoWrite">
							<table width="100%" cellspacing="0" cellpadding="0"
								style="border-collapse: collapse;">


								<!-- 아이디 -->
								<tbody>
									<tr>
										<td class="nameform"><label>ID</label></td>
										<td style="padding: 8px;" bgcolor="#ffffff" align="left"
											class="my_line"><input class="form-cont" type="text"
											id="id" name="id" readonly
											value="<sec:authentication property="principal.username"/>">
										</td>
									</tr>
									<tr>
										<td class="nameform"><label>Email</label></td>
										<td style="padding: 8px;" bgcolor="#ffffff" align="left"
											class="my_line"><input class="form-cont" type="text"
											id="email" name="email" readonly
											value="<sec:authentication property="principal.member.useremail"/>">
										</td>
									</tr>
									<tr>
										<td class="nameform"><label>새 비밀번호</label></td>
										<td style="padding: 8px;" bgcolor="#ffffff" align="left"
											class="my_line"><input class="form-cont" id="pass"
											name="pass" type="password" required value=""></td>
									</tr>
									<tr>
										<td class="nameform"><label>이름</label></td>

										<td style="padding: 8px;" bgcolor="#ffffff" align="left"
											class="my_line"><input class="form-cont" name="name"
											id="name" type="text" readonly
											value="<sec:authentication property="principal.member.name"/>"></td>
									</tr>
									<tr>
										<td class="nameform"><label>전화번호</label></td>
										<td style="padding: 8px;" bgcolor="#ffffff" align="left"
											class="my_line"><input class="form-cont" name="phonenum"
											id="phonenum" type="text" required
											value="<sec:authentication property="principal.member.phonenum"/>">
										</td>
									</tr>
									<tr>

										<td class="nameform"><label for="jooso">주소입력</label></td>

										<td style="padding: 8px;" bgcolor="#ffffff" align="left"
											class="my_line"><input type="text" class="form-cont"
											id="uoop" name="uoop"
											value="<sec:authentication property="principal.member.uoop"/>">

											<input type="button" class="id-btn"
											onclick="sample4_execDaumPostcode()" value="우편번호 찾기">
											<br> <input type="text" class="form-cont" id="doro"
											name="doro"
											value="<sec:authentication property="principal.member.doro"/>">

											<input type="text" class="form-cont" id="jibun" name="jibun"
											value="<sec:authentication property="principal.member.jibun"/>">

											<span id="guide" style="color: #999"></span></td>
									</tr>
								</tbody>
							</table>
						</div>
						<input type="hidden" name="${_csrf.parameterName }"
							value="${_csrf.token }" />


						<div>
							<a><button type="submit" id="joinBtn" class="orderOpne_bnt">회원정보
								변경</button></a>
						</div>

					</form>
				</div>
			</div>
		</div>
	</div>
</body>





<!--이미지 첨부처리 -->
<!-- <script>

    var fileCallPath = "${list.gdsthumbimg}";
	 var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/"); 
	  

<script>
$(document).ready(function(){
	$("#profileImg").click(function(){
		$("#input_img").click() ;
		})			
	})

</script> -->


<!-- <script>
var sel_file;
$(document).ready(function() {
    $("#input_img").on("change", fileChange);
});

function fileChange(e) {
	e.preventDefault();
	var csrfHeaderName = "${_csrf.headerName}";
	var csrfTokenValue = "${_csrf.token}";
	var files = e.target.files;
    var filesArr = Array.prototype.slice.call(files);

    filesArr.forEach(function(f) {
        if(!f.type.match("image.*")) {
            alert("확장자는 이미지 확장자만 가능합니다.");
            return;
        }

        sel_file = f;

        var reader = new FileReader();
        reader.onload = function(e) {
            $("#profileImg").attr("src", e.target.result);
        	$("#profileImg").css("height", "100px")
        }
        reader.readAsDataURL(f);
    });

    var file = files[0]
    console.log(file)
    
    
    var formData = new FormData();
    formData.append("file", file);

		$.ajax({
    	url: '/uploadAjax',
		  data: formData,
		  beforeSend: function(xhr){
				xhr.setRequestHeader(
						csrfHeaderName
						,csrfTokenValue);
				
			},
			 dataType:'text',
		  processData: false,
		  contentType: false,
		
		  type: 'POST',
		  success: function(data){

			alert("프로필 이미지가 변경 되었습니다.")

		  }
		})


 		function checkImageType(fileName){
 			var pattern = /jpg$|gif$|png$|jpeg$/i;
 			return fileName.match(pattern);
 		}


 		function getOriginalName(fileName){
 			if(checkImageType(fileName)){
 				return;
 			}

 			var idx = fileName.indexOf("_") + 1 ;
 			return fileName.substr(idx);

 		}


 		function getImageLink(fileName){

 			if(!checkImageType(fileName)){
 				return;
 			}
 			var front = fileName.substr(0,12);
 			var end = fileName.substr(14);

 			return front + end;

 		}

}
</script> -->
<!-- <script>
var csrfHeaderName = "${_csrf.headerName}";
var csrfTokenValue = "${_csrf.token}";

$(".uploadResult").on("click","b",function(e){
	console.log("delete file");
	
	var targetFile=$(this).data("file");
	var type=$(this).data("type");
	var targetLi=$(this).closest("li");
	
	$.ajax({
		url:'/deleteFile',
		data:{fileName : targetFile,
			type:type
			},
			beforeSend: function(xhr){
				xhr.setRequestHeader(
						csrfHeaderName
						,csrfTokenValue);
				
			},
		dataType:'text',
		type: 'POST',
		success: function(result){
			alert(result);
			targetLi.remove();
		}
	})
});
////// 파일첨부

$("input[type='file']").change(function(e){
		// 인풋타입이 file 이  change 되었을때(이벤트 발생)
		// 즉 파일첨부가 시행될때마다 실행되는것이다
		
		var formData = new FormData();
		//https://www.zerocho.com/category/HTML&DOM/post/59465380f2c7fb0018a1a263
		// FormData 페이지 전환을 하지않고 작업을할때 사용한다
		
		var inputFile=$("input[name='uploadFile']");
		// 인풋중에 name uploadFile 인것을 = inputFile 로 선언
	
		
		var files=inputFile[0].files;
		// files 라는것은 첨파일안에 추가되있는 파일들을 가리키는함수
		// 그것을 배열화 해서  files 안에 넣어준다는 뜻
		
	
		for(var i=0;i<files.length;i++){
			if(!checkExtension(files[i].name
					,files[i].size)){
				return false;
			}
			formData.append("uploadFile",files[i]);
		}
		
		$.ajax({
			url:'/uploadAjaxAction',
			processData:false,
			contentType:false,
			beforeSend: function(xhr){
				xhr.setRequestHeader(
						csrfHeaderName
						,csrfTokenValue);
				
			},
			data:formData,
			type:'POST',
			dataType:'json',
			success:function(result){
				console.log(result);
				showUploadResult(result);
				
				//첨부 파일 업로드 결과를 json으로 받으면
				//그내용을 화면에 표시	
			}
		}); //end ajax
	});

function showUploadResult(uploadResultArr){
	
	if(!uploadResultArr || uploadResultArr.length==0){
		return;
	}
	
	var uploadUL=$(".uploadResult ul");
	var str="";
	
	// each  받아온 갯수만큼 반복
	$(uploadResultArr).each(function(i,obj){
		
		var fileCallPath = encodeURIComponent(obj.uploadPath+"/"+obj.uuid+"_"+obj.fileName);
		// encdoeURIComponent: uri 로 전달되는 특수문자의 치환.
		
		// & ? 특수문자를 함수로 인식하지마라
		var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
		// 전달되는 값들중 역슬러시를 찾아서 슬러시로 변경
		str+="<li data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'>";        
		str+="<div>";
		str+="<img src='/resources/img/다운로드.png'>";
		str+="<span>'"+obj.fileName+"'</span>";
		str+="<b data-file='"+fileCallPath+"' data-type='file'>[x]</b>";
		str+="</div></li>";
	});
	uploadUL.append(str);

}//end_showUploadResult


</script>

 -->

</html>