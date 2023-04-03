function writeSave(){
	
	if(document.writeForm.title.value==""){
		alert("글 제목을 입력해주세요.");
		document.writeForm.title.focus();
		return false;
	}
	
	if(document.writeForm.writer.value==""){
		alert("이름을 입력해주세요.");
		document.writeForm.writer.focus();
		return false;
	}
	
	if(document.writeForm.pass.value==""){
		alert("비밀번호를 입력해주세요.");
		document.writeForm.pass.focus();
		return false;
	}
	
	if(document.writeForm.content.value==""){
		alert("내용을 입력해주세요.");
		document.writeForm.content.focus();
		return false;
	}
}

function updateSave(){
	
	if(document.updateForm.title.value==""){
		alert("글 제목을 입력해주세요.");
		document.updateForm.title.focus();
		return false;
	}
	
	if(document.updateForm.pass.value==""){
		alert("비밀번호를 입력해주세요.");
		document.updateForm.pass.focus();
		return false;
	}
	
	if(document.updateForm.content.value==""){
		alert("내용을 입력해주세요.");
		document.updateForm.content.focus();
		return false;
	}
}

function deleteSave(){
	if(document.delForm.pass.value==""){
		alert("비밀번호를 입력해주세요.");
		document.delForm.pass.focus;
	return false;
	}
}

function com_check(){
	if(document.check.c_content.value.length==0){
		alert("댓글 내용을 입력해주세요.");
		document.check.c_content.focus;
	return flase;
	}
}