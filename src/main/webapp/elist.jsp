<%@ page import="java.text.*" %>
<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
</head>
<body>
<jsp:include page="header.jsp"/>

<section style="position:fixed; top:70px; left:0px; width:100%; height:100%; background-color:lightgray;">
  <h2 style="text-align:center;">직원현황</h2>
  <table border="1" style="margin-left:auto; margin-right:auto; text-align:center;">
  <thead>
  	<tr>
  		<th>사번</th>
  		<th>이름</th>
  		<th>부서명</th>
  		<th>직급</th>
  		<th>계약연봉</th>
  	</tr>
  </thead>
  <tbody>
<%
try {
	String sql = "SELECT em.eid, em.ename, de.deptname, em.grade, em.salary "
		+ "FROM TBL_EMPLOYEE_202406 em, TBL_DEPART_202406 de " 
		+ "WHERE em.deptcode = de.deptcode";
	PreparedStatement pstmt = con.prepareStatement(sql);
	ResultSet rs = pstmt.executeQuery();
	DecimalFormat salaryFormat = new DecimalFormat("###,###");
			
	while(rs.next()) {
		%>
	<tr>
		<td><%=rs.getString("eid") %></td>
  		<td><%=rs.getString("ename") %></td>
  		<td><%=rs.getString("deptname") %></td>
  		<td><%=rs.getString("grade") %></td>
  		<td><%=salaryFormat.format(rs.getInt("salary")/10000) %>만원</td>
	</tr>		
		<%
	}
} catch(Exception e) {
	e.printStackTrace();
}
%>
  </tbody>
  </table>

</section>

<jsp:include page="footer.jsp"/>
</body>
</html>