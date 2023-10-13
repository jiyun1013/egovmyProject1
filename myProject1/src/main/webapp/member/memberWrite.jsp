<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<title>memberWrite(회원가입화면)</title>
<link rel="stylesheet"
	href="//code.jquery.com/ui/1.13.2/themes/base/jquery-ui.css">
<link rel="stylesheet" href="/resources/demos/style.css">
<link rel="stylesheet" href="/css/main.css">
<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
<script src="https://code.jquery.com/ui/1.13.2/jquery-ui.js"></script>
<style>
</style>
</head>
<script>
	$(function() {
		$("#birth").datepicker();
		
		$("#userid").keyup(function(){
			
			let msg = "";
			let userid = $("#userid").val();
			if(userid.length < 6 || userid.length > 12){
				msg = "<font color='red'>아이디는 6-12자 사이입니다.";
			}else{
				$.ajax({
					type : "post",
					url  : "/useridChk.do", //@ResponseBody가 달린 url
					data : "userid=" + userid,
					
					datatype : "text",
					success : function(msg1){
						if(msg1 == "0"){
							msg = "<font color='green'>사용가능한 아이디입니다.";
						}else if(msg1 == "1"){
							msg = "<font color='red'>이미 사용중인 아이디입니다.";
						}else if(msg1 == "2"){
							msg = "<font color='red'>아이디는 영문+숫자만 사용 가능합니다.";
						}
						$("#userid_msg").html(msg);
					},
					error : function(){
						alert("전송실패");
					}
				});
				
			}
			
			$("#userid_msg").html(msg);
		});
		
		$("#btn_save").click(function(){
			
			let userid = $.trim($("#userid").val());
			let pass = $.trim($("#pass").val());
			
			$("#userid").val(userid);
			$("#pass").val(pass);


			if(userid.length < 6 || userid.length > 12){
				alert("아이디는 6~12자 사이로 입력해주세요.");
				$("#userid").focus();
				return false;
			}
			
			if(pass == ""){
				alert("암호를 입력해주세요.");
				$("#pass").focus();
				return false;
			}
			
			// name 사용방법(라디오는 네임으로만 가능)
			if($("input:radio[name=gender]").is(":checked") == false){
				alert("성별을 입력해주세요.");
				return false;
				
			}
			
			var form = $("#frm").serialize();
			$.ajax({
				type : "post",
				url  : "/memberWriteSave.do",
				data : form,
				
				datatype : "text",
				success : function(msg1){
					if(msg1 == "ok"){
						alert("저장 성공");
						location = "/loginWrite.do"
					}else{
						alert("저장 실패");
					}
					$("#userid_msg").html(msg);
				},
				error : function(){
					alert("전송 실패");
				}
			});
		});
	});
</script>
<body>
	<div class="wrap">
		<header>
			<div class="top_header"></div>
		</header>
		<nav>
			<%@ include file="../include/nav.jsp"%>
		</nav>
		<aside>
			<%@ include file="../include/aside.jsp"%>
		</aside>
		<section>
			<article>
				<form id="frm">
					<table>
						<caption>회원가입 폼</caption>
						<colgroup>
							<col width="30%" />
							<col width="*" />
						</colgroup>
						<tbody>
							<tr>
								<th>아이디</th>
								<td>
								<input type="text" name="userid" id="userid">
								<span id="userid_msg"></span>
								</td>
							</tr>
							<tr>
								<th>암호</th>
								<td><input type="password" name="pass" id="pass"></td>
							</tr>
							<tr>
								<th>이름</th>
								<td><input type="text" name="name" id="name"></td>
							</tr>
							<tr>
								<th>생년월일</th>
								<td><input type="text" name="birth" id="birth"></td>
							</tr>
							<tr>
								<th>성별</th>
									<!-- name이 같아야 둘 중 하나만 선택 가능/ 다르면 둘 다 선택이 가능함 -->
									<!-- checked 쓰면 디폴트로 체크된 상태로 만들 수 있음-->
								<td><input type="radio" name="gender" id="gender" value="M">남
									<input type="radio" name="gender" id="gender" value="F">여
								</td>
							</tr>
							<tr>
								<th>핸드폰</th>
								<td><input type="text" name="mobile" id="mobile"></td>
							</tr>
							<tr>
								<th>주소</th>
								<td><input type="text" name="zipcode" id="zipcode"><br>
									<input type="text" name="addr" id="addr"></td>
							</tr>
						</tbody>
					</table>
					<div style="width:600px; text-align:center; margin-top:10px;">
						<button type="submit" id="btn_save" onclick="return false;">저장</button>
						<button type="reset">취소</button>
					</div>
				</form>
			</article>
		</section>
		<footer>
			<%@ include file="../include/footer.jsp"%>
		</footer>
	</div>
</body>
</html>