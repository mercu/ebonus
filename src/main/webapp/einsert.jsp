<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script type="text/javascript" src="./einsert_script.js"></script>
</head>
<body>
<jsp:include page="header.jsp"/>

<section style="position:fixed; top:70px; left:0px; width:100%; height:100%; background-color:lightgray;">
  <h2 style="text-align:center;">직원입력</h2>
  
  <form name="insertForm" action="einsert_action.jsp" method="post" style="display:flex; align-items:center; justify-content:center; text-align:center;">
  <table border="1">
  	<tr>
  		<td>사번</td><td><input name="eid" type="text"></td>
  	</tr>
  	<tr>
  		<td>이름</td><td><input name="ename" type="text"></td>
  	</tr>
  	<tr>
  		<td>부서코드</td>
  		<td>
  			<select name="deptcode">
<%
try {
	String sql = "SELECT deptcode, deptname "
		+ "FROM TBL_DEPART_202406 " 
		+ "ORDER BY deptcode";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	while(rs.next()) {
		%>
  				<option value="<%=rs.getString("deptcode")%>"> <%=rs.getString("deptcode")%>-<%=rs.getString("deptname")%> </option>
		<%
	}
} catch(Exception e) {
	e.printStackTrace();
}
%>
  			</select>
  		</td>
  	</tr>
  	<tr>
  		<td>직급</td><td><input name="grade" type="text"></td>
  	</tr>
  	<tr>
  		<td>계약연봉</td><td><input name="salary" type="number"></td>
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