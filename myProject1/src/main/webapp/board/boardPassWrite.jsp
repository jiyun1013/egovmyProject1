
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardPassWrite(암호입력화면)</title>
</head>

<style>
body {
	padding: 0;
	margin: 0-auto;
	font-size: 12px;
	font-family: 맑은고딕;
	color: 000;
	font-size: 12px;
}

table {
	width: 600px;
	border-collapse: collapse; /* 셀 사이 간격 0으로 */
	border: 1px solid #ccc;
}

th, td {
	border: 1px solid #ccc;
	padding: 5px;
}

.button_area {
	width: 600px;
	text-align: center;
	margin-top: 10px;
}

.caption1 {
	font-size: 20px;
	font-weigth: bold;
	color: brown;
	padding: 5px;
}

input, textarea, button {
	font-size: 12px;
}

.input1 {
	width: 98%;
}

.textarea1 {
	width: 98%;
	height: 50px;
}
</style>

<script>
	function fn_save() {
		if (document.frm.pass.value == "") {
			alert("암호를 입력해주세요.");
			document.frm.pass.focus();
			return false;
		}
		document.frm.submit();
	}
	
	function fn_action(){
		location = "/myProject1/boardList.do";
	}
</script>

<body>
	<form name="frm" method="post" action="/myProject1/boardDelete.do">
	<input type="hidden" name="unq" value="${unq }">
		<div>
			<table>
				<caption class="caption1">게시판 암호입력화면</caption>
				<tr>
					<th>암호</th>
					<td><input type="password" name="pass" class="input1"
						placeholder="암호를 입력해주세요."></td>
				</tr>
			</table>
		</div>
		<div class="button_area">
			<button type="submit" onclick="fn_save(); return false;"
				class="button1">삭제</button>
			<button type="reset" class="button1">취소</button>
			<button type="button" onclick="fn_action()">목록</button>
		</div>
	</form>
</body>
</html>