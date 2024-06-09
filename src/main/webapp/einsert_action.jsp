<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

// 사번
String eid = request.getParameter("eid");
// 이름
String ename = request.getParameter("ename");
// 부서코드
String deptcode = request.getParameter("deptcode");
// 직급
String grade = request.getParameter("grade");
// 계약연봉
String salary = request.getParameter("salary");

// DB 저장
try {
	String sql = "INSERT INTO TBL_EMPLOYEE_202406 VALUES (?, ?, ?, ?, ?)";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, eid);
	pstmt.setString(2, ename);
	pstmt.setString(3, deptcode);
	pstmt.setString(4, grade);
	pstmt.setString(5, salary);
	
	pstmt.execute();
} catch(Exception e) {
	e.printStackTrace();
}

// 입력 창으로 이동
%>
<jsp:forward page="./einsert.jsp"></jsp:forward>