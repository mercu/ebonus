/**
 * 
 */
function insert() {
	// validation
	let result = validate();
	if (result == false) {
		return;
	}
	
	// form submit
	document.insertForm.submit();
}

function validate() {
	let frm = document.insertForm;
	// 사번 체크
	if (!frm.eid.value || !frm.eid.value.trim()) {
		alert("사번이 입력되지 않았습니다!");
		frm.eid.focus();
		return false;
	}
	
	// 이름 체크
	if (!frm.ename.value || !frm.ename.value.trim()) {
		alert("이름이 입력되지 않았습니다!");
		frm.ename.focus();
		return false;
	}
	
	// 직급 체크
	if (!frm.grade.value || !frm.grade.value.trim()) {
		alert("직급이 입력되지 않았습니다!");
		frm.grade.focus();
		return false;
	}
	
	// 계약연봉 체크
	if (!frm.salary.value || !frm.salary.value.trim() || isNaN(frm.salary.value)) {
		alert("계약연봉은 숫자가 아니거나 입력되지 않았습니다!");
		frm.salary.focus();
		return false;
	}
	
	// 유효성 체크 성공
	alert("직원정보가 정상적으로 등록되었습니다!");
	return true;
}

function reset_form() {
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	document.insertForm.reset();
}



