<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%><!-- jstl core 쓸때 태그에 c 로 표시. -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>

<%@ include file="../includes/adminHeader.jsp" %>

	

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


<!-- DataTables Example -->
        <div class="card mb-3">
          <div class="card-body">
            <div class="table-responsive">
             <table class="table table-bordered" id="dataTable" width="100%"
				cellspacing="0">
				<thead class="a">
					<tr>
						<th>#회원번호</th>
						<th>ID</th>
						<th> 이름 </th>
						<th>전화번호</th>
						<th>이메일</th>
						<th>가입날짜</th>
						<th>회원등급</th>
						<th>우편번호</th>
						<th>도로명주소</th>
						<th>지번</th>
						
						<!-- <th>Salary</th> -->
					</tr>
				</thead>
				<!-- <tfoot>
					<tr>
						<th>Name</th>
						<th>Position</th>
						<th>Office</th>
						<th>Age</th>
						<th>Start date</th>
						<th>Salary</th>
					</tr>
				</tfoot> -->
				<tbody class="">
					<c:forEach var="mem" items="${mem }">
						<tr>
							<td><c:out value="${mem.mb }" /></td>
							<td><c:out value="${mem.id }" /></td>
							<td><c:out value="${mem.name }" /></td>
							<td><c:out value="${mem.phonenum }" /></td>
							<td><c:out value="${mem.useremail }" /></td>
							<td><fmt:formatDate pattern="yyyy-MM-dd"
									value="${mem.userday }" /></td>
							<td><c:out value="${mem.authList[0].auth}" /></td>
							<td><c:out value="${mem.uoop }" /></td>
							<td><c:out value="${mem.doro }" /></td>
							<td><c:out value="${mem.jibun }" /></td>
							
						</tr>
					</c:forEach>
					
					
				</tbody>
			</table>
		</div>
	</div>
</div>
  						</div>
 			 	  </div>
        	</div>
      </div>
      <!-- /.container-fluid -->
             <!-- Sticky Footer -->
      <footer class="sticky-footer">
        <div class="container my-auto">
          <div class="copyright text-center my-auto">
            <span>Copyright © Your Website 2019</span>
          </div>
        </div>
      </footer>


    </div>
    <!-- /.content-wrapper -->

  </div>
  <!-- /#wrapper -->



<%@ include file="../includes/adminFooter.jsp" %>


            