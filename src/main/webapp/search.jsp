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
  <h2 style="text-align:center;">부서별 보너스조회</h2>
  <!-- 부서코드 -->
  <form name="searchForm" action="" method="get" style="display:flex; align-items:center; justify-content:center; text-align:center;">
  <table border="1" style="margin-left:auto; margin-right:auto; text-align:center;">
  	<tr>
  		<td>부서코드</td>
  		<td><input type="text" name="deptcode"/></td>
  		<td><input type="submit" value="조회"/></td>
  	</tr>
  </table>
  </form>
  <br><br>
  <!-- 결과조회 -->
  <table border="1" style="margin-left:auto; margin-right:auto; text-align:center;">
  <thead>
  	<tr>
  		<th>사번</th>
  		<th>이름</th>
  		<th>부서명</th>
  		<th>직급</th>
  		<th>계약연봉</th>
  		<th>보너스율</th>
  		<th>보너스금액</th>
  	</tr>
  </thead>
  <tbody>
<%
request.setCharacterEncoding("UTF-8");
String deptcode = request.getParameter("deptcode");
System.out.println(deptcode);
try {
	String sql = "SELECT em.eid, em.ename, de.deptname, em.grade, em.salary, bo.bper "
			+ "FROM TBL_EMPLOYEE_202406 em, TBL_DEPART_202406 de, TBL_BONUS_202406 bo "
			+ "WHERE em.deptcode = de.deptcode AND em.deptcode = bo.deptcode "
			+ "  AND trim(em.deptcode) = ? "
			+ "ORDER BY em.eid";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, deptcode);
	DecimalFormat salaryFormat = new DecimalFormat("###,###");
	
	ResultSet rs = pstmt.executeQuery();
	while (rs.next()) {
		int salary = rs.getInt("salary");
		int bper = rs.getInt("bper");
		// 보너스 금액
		int bonus = salary * bper / 100;
%>
	<tr>
  		<td><%=rs.getString("eid") %></td>
  		<td><%=rs.getString("ename") %></td>
  		<td><%=rs.getString("deptname") %></td>
  		<td><%=rs.getString("grade") %></td>
  		<td><%=salaryFormat.format(rs.getInt("salary")/10000) %>만원</td>
  		<td><%=rs.getInt("bper") %></td>
  		<td><%=salaryFormat.format(bonus/10000) %>만원</td>
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