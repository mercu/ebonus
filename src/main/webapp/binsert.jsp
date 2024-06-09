<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./binsert_script.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>

<section style="position:fixed; top:70px; left:0px; width:100%; height:100%; background-color:lightgray;">
  <h2 style="text-align:center;">보너스입력</h2>
  
  <form name="insertForm" action="binsert_action.jsp" method="post" style="display:flex; align-items:center; justify-content:center; text-align:center;">
  <table border="1">
  	<tr>
  		<td>부서코드</td><td><input name="deptcode" type="text"></td>
  	</tr>
  	<tr>
  		<td>보너스율</td><td><input name="bper" type="number"></td>
  	</tr>
  	<tr>
  		<td colspan="2">
  			<input type="button" value="등록" onclick="insert()"/>
  			<input type="button" value="다시쓰기" onclick="reset_form()"/>
  		</td>
  	</tr>
  </table>
  </form>

</section>

<jsp:include page="footer.jsp"/>
</body>
</html>