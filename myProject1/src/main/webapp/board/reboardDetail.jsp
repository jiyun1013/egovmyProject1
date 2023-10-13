
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>boardDetail(상세화면)</title>
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

	function fn_reply(){
		location ="/myProject1/replyWrite.do?unq=${vo.unq}&thread=${vo.thread}";
	}
	function fn_modify(){
		location ="/myProject1/reboardModify.do?unq=${vo.unq}";
	}

	function fn_delete(){
		location ="/myProject1/reboardPassWrite.do?unq=${vo.unq}";
	}
	
	function fn_action(){
		location = "/myProject1/reboardList.do";
	}
</script>

<body>
	<div>
		<table>
			<caption class="caption1">게시판 상세화면</caption>
			<tr>
				<th>제목</th>
				<td>${vo.title }</td>
			</tr>
			<tr>
				<th>글쓴이</th>
				<td>${vo.name }</td>
			</tr>
			<tr>
				<th>등록일</th>
				<td>${vo.rdate }</td>
			</tr>
			<tr>
				<th>내용</th>
				<td>${vo.content }</td>
			</tr>
		</table>
	</div>
	<div class="button_area">
		<button type="button" onclick="fn_reply()">답변</button>
		<button type="button" onclick="fn_modify()">수정</button>
		<button type="button" onclick="fn_delete()">삭제</button>
		<button type="button" onclick="fn_action()">목록</button>
	</div>
</body>
</html>