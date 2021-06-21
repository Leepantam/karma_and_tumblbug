/**
 * 


 */

$(document).ready(function(){
	if($("#id").val().length>0){
		$("#state").text("가입하지 않은 아이디이거나, 잘못된 비밀번호입니다.");
	}
});

$("#btn").click(function(){
	if($("#id").val()==""){
		$("#state").text("아이디를 입력해주세요.");
	} else if($("#pw").val()==""){
		$("#state").text("비밀번호를 입력해주세요.");
	}else{
		$("#frm").submit();
	}
});


