<%@ include file="db.jsp" %>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>

<%
request.setCharacterEncoding("UTF-8");

// 부서코드
String deptcode = request.getParameter("deptcode");
// 보너스율
String bper = request.getParameter("bper");

// DB 저장
try {
	String sql = "MERGE INTO TBL_BONUS_202406 "
			+ "USING DUAL "
			+ "ON (trim(deptcode) = ?) "
			+ "WHEN MATCHED THEN "
			+ "  UPDATE SET BPER = ? "
			+ "WHEN NOT MATCHED THEN "
			+ "  INSERT VALUES (?, ?) ";
	PreparedStatement pstmt = con.prepareStatement(sql);
	pstmt.setString(1, deptcode);
	pstmt.setString(2, bper);
	pstmt.setString(3, deptcode);
	pstmt.setString(4, bper);
	
	pstmt.executeUpdate();
} catch(Exception e) {
	e.printStackTrace();
}

// 입력 창으로 이동
%>
<jsp:forward page="./binsert.jsp"></jsp:forward>