// 자바 스크립트 코드 넣는 곳

$(document).ready(function() {
	var exp = /^[0-9]{3}-[0-9]{4}-[0-9]{4}$/;  // ^: 정규식의 시작, $:정규식의 끝
	// [0-9] : 0~9중에서 와야함 {3} : 3개가 와야함 
	$("#sendBtn").click(function() {
		
		if($("#name").val()=="") {
			alert("이름을 입력하세요");
			$("#name").focus();
			return false;
		}
		
		if($("#userid").val()=="") {
			alert("아이디를 입력하세요");
			$("#userid").focus();
			return false
		}
		
		if($("#pwd").val()=="") {
			alert("비밀번호를 입력하세요");
			$("#pwd").focus();
			return false
		}
		if($("#pwd").val() != $("#pwd_check").val()) {
			alert("비밀번호가 일치하지 않습니다.")
			$("#pwd_check").focus();
			return false;
		}
		if($("#email").val()=="") {
			alert("이메일을 입력하세요");
			$("#email").focus();
			return false;
		}
		
		if(!$("#phone").val().match(exp)) {  // 전화번호가 exp와 맞지 않으면
			alert("전화번호 형식이 아닙니다.");
			$("#phone").focus();
			return false;
		} 
		/*if(!exp.test($("#phone").val())){  // 정규식 표현을 앞에 쓰면 test라는 함수를 사용함
			alert("전화번호 형식이 아닙니다.");
			$("#phone").focus();
			return false;
		} */
		$("#frm").submit()
	})  // sendBtn
	
	// 아이디 중복 버튼을 클릭하면 아이디 중복(idCheck.jsp) 팝업창을 띄움
	 $("#idCheckBtn").click(function(){
		window.open("idCheck.jsp","", "width=600 height=300")
	}) // idCheckBtn click
	
	// idUseBtn
	$("#idUseBtn").click(function(){
		if($("#userid").val()==""){
			alert("아이디를 입력하세요")
			return
			}
			$.ajax({  // 비동기 함수 사용(팝업창을 새로 띄우지않게 하기 위해)
				type:"post",
				url:"idCheck",
				data : {"userid" : $("#userid").val()},
				success:function(resp){  
					//alert(resp.trim().length) // trim()공백제거해줌 
					if(resp.trim()=="yes"){
						alert("사용가능한 아이디입니다.")
						// 나를 부른 memberForm.jsp의 id가 userid를 찾아서 userid의 값을 받아온 값으로 셋팅해줌
						$(opener.document).find("#userid").val($("#userid").val())
						self.close()
					}else {
						alert("사용 불가능한 아이디입니다.")
						$("#userid").val('')  // 공백입력
						$("#userid").focus()  // 포커스를 맞춰줌
					}
				},
				error : function(e) {
					alert(e+"error")
				}
			})  // ajax
		})  // idUseBtn 
		
})  //docuemnt

// 삭제
function del(userid,mode){
	if(mode=="관리자"){
		alert("삭제가 불가능 합니다.")
		return;  // 함수종료 
	}
	if(confirm('정말 삭제할까요?')){
		var str="";
		$.getJSON("memberDeletePro.jsp", //서버페이지
		{"userid" : userid},  // 서버에 전달할 값
		function(resp){  // 콜백함수(서버에서 전달해준 제이슨 객체를 원하는 형태로 출력해줌)
			//alert(resp.countObj.count)
			$.each(resp.jarrObj, function(key,val){  // 본문의 내용을 바꾸기 위해 반복문들 돌림
						str+="<tr>"
						str+="<td>"+val.name+"</td>"
						str+="<td>"+val.userid+"</td>"
						str+="<td>"+val.phone+"</td>"
						str+="<td>"+val.email+"</td>"
						str+="<td>"+val.admin+"</td>"
						str+="<td><a href=javascript:del('"+val.userid+"','"+val.admin+"')>삭제</td>"  // 삭제를 클릭하면 삭제가 된다.
						str+="</tr>" 
			})  //each
			$("table tbody").html(str);  // table 밑에 있는 tbody의 위치에 str을 넣을것이다.
			$("#cntSpan").text(resp.countObj.count)
			
		}// function
	); //getJSON
} // if


	
	
}