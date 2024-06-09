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
	// 부서코드 체크
	if (!frm.deptcode.value || !frm.deptcode.value.trim()) {
		alert("부서코드가 입력되지 않았습니다!");
		frm.deptcode.focus();
		return false;
	}
	
	// 보너스율 체크
	if (!frm.bper.value || !frm.bper.value.trim() || isNaN(frm.bper.value)) {
		alert("보너스율은 숫자가 아니거나 입력되지 않았습니다!");
		frm.bper.focus();
		return false;
	}
	
	// 유효성 체크 성공
	alert("보너스정보가 정상적으로 등록되었습니다!");
	return true;
}

function reset_form() {
	alert("정보를 지우고 처음부터 다시 입력합니다!");
	document.insertForm.reset();
}



