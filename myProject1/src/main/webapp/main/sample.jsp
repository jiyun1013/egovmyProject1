<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
 <head>
  <meta charset="UTF-8">
  <title>sample</title>
<style>
body{
	text-align: center;
	font-size:12px;
	margin: 0;
	padding : 0;
}
a {
	text-decoration: none;
}
.wrap {
    width:100%;
    height:900px;
    margin: 0px auto;
}
header{
   width:100%;
   height : 100px;
	line-height: 100px;
	margin-bottom:3px;
}
.top_header {
	width:100%;
	height:100px;
	background:#f2f2f2;
	float:left;
}
nav{
	background:#ffffcc;
	width:100%;
	height:30px;
	margin-bottom:3px;
	padding-top:5px;
	padding-bottom:5px;
	line-height:2.0;
}
aside {
	float:left; 
	line-height: 350px;
	background:#999900;
	width:200px;
	height:600px;
}
section{
	background:#f8f8f8;
	height : 600px;
	padding-left: 10px;
}
article {
	position:relative;
	width:100%;
	height:500px;
	padding-top:50px;
	padding-left:220px;
}
footer {
	background:#0099ff;            
	height : 55px;
	line-height : 55px;
}
.nav_left_space {
	position:relative;
	float: left;
	/*background:pink;*/
	width:10%;

}
.nav_left_space {
	position:relative;
	float: left;
	/*background:pink;*/
	width:10%;

}
.nav_right_space {
	position:relative;
	float: left;
	/*background:pink;*/
	width:10%;
}
.nav_center_space {
	position:relative;
	float: left;
	/*background:green;*/
	width:80%;
}

.menuLink {
	position:relative;
	float: left;
	left:12%;
	list-style: none; 
	background-color: #e4effc;  
	line-height: 30px;   
	text-align: center;
	width: 10%;   
	border:1px solid #ffffff;
	margin-top:-12px;
}

table {
    width: 600px;
    border: 1px solid #444444;
    border-collapse: collapse;
}
th, td {
    border: 1px solid #444444;
    padding: 10px;
}

</style>
</head>
<body>
<div class="wrap">
    <header>
		<div class="top_header">

		</div>
    </header>
    <nav>
    <%@ include file="../include/nav.jsp" %>
    </nav>
	<aside>
	<%@ include file="../include/aside.jsp" %>
	</aside>
    <section>
       <article>

		<table>
		<caption> CSS 적용 테이블 </caption>
		<colgroup>
			 <col width="20%"/>
			 <col width="50%"/>
			 <col width="30%"/>
		 </colgroup>
		 <thead>
			 <tr>
				  <th>번호</th>
				  <th>제목</th>
				  <th>날짜</th>
			 </tr>
		 </thead>
		 <tbody>
			 <tr>
				  <td>1</td>
				  <td>도시까스요금..</td>
				  <td>2018-02-02</td>
			 </tr>
			 <tr>
				   <td>2</td>
				   <td>도시까스요금..</td>
				   <td>2018-02-02</td>
			  </tr>
		 </tbody>
		</table>

       </article>
    </section>
    <footer>
	<%@ include file="../include/footer.jsp" %>
    </footer>
</div>
</body>
</html>