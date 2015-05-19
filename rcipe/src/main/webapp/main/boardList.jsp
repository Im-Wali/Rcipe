<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<!-- id searchBoard에 전체검색,제목,작성자 0,1,2식으로 저장-->
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Recipe</title>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script
	src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/js/bootstrap.min.js"></script>
<style type="text/css">
.form-login {
	background-color: #DDDDDD;
	padding-top: 10px;
	padding-bottom: 20px;
	padding-left: 20px;
	padding-right: 20px;
	border-radius: 15px;
	border-color: #d2d2d2;
	border-width: 5px;
	box-shadow: 0 1px 0 #cfcfcf;
	
	.table-fixed thead {
  width: 97%;
}
.table-fixed tbody {
  height: 230px;
  overflow-y: auto;
  width: 100%;
}
.table-fixed thead, .table-fixed tbody, .table-fixed tr, .table-fixed td, .table-fixed th {
  display: block;
}
.table-fixed tbody td, .table-fixed thead > tr> th {
  float: left;
  border-bottom-width: 0;
}

</style>
</head>
<body>
	<jsp:include page="menuBar.jsp"></jsp:include>
	<div class="container">
  <div class="row">
      <div class="panel panel-default">
        <div class="panel-heading">
          <label>
                              게시판
          </label>
          <form class="navbar-form navbar-left" role="search" style="float: right;">
            <button type="button" class="btn btn-warning" style="color: black; margin:2px; float: right;"
          onclick="open('insertBoard.jsp','_self', '','')">글쓰기</button>
        <div class="form-group">
          <input type="text" class="form-control" placeholder="Search">
        </div>
        <button type="submit" class="btn btn-default">Submit</button>
      </form>
        </div>
        <table class="table table-fixed">
          <thead>
            <tr>
              <th class="col-xs-2">#</th><th class="col-xs-6">제목</th><th class="col-xs-2">작성자</th><th class="col-xs-2">올린날짜</th>
            </tr>
          </thead>
          <tbody>
            <tr>
               <th class="col-xs-2">1</th><th class="col-xs-6">제목1111</th><th class="col-xs-2">user01</th><th class="col-xs-2">2015-05-18</th>
            </tr>
            <tr>
               <th class="col-xs-2">1</th><th class="col-xs-6">제목1111</th><th class="col-xs-2">user01</th><th class="col-xs-2">2015-05-18</th>
            </tr>
            <tr>
               <th class="col-xs-2">1</th><th class="col-xs-6">제목1111</th><th class="col-xs-2">user01</th><th class="col-xs-2">2015-05-18</th>
            </tr>
            <tr>
               <th class="col-xs-2">1</th><th class="col-xs-6">제목1111</th><th class="col-xs-2">user01</th><th class="col-xs-2">2015-05-18</th>
            </tr>
            <tr>
               <th class="col-xs-2">1</th><th class="col-xs-6">제목1111</th><th class="col-xs-2">user01</th><th class="col-xs-2">2015-05-18</th>
            </tr>
            <tr>
               <th class="col-xs-2">1</th><th class="col-xs-6">제목1111</th><th class="col-xs-2">user01</th><th class="col-xs-2">2015-05-18</th>
            </tr>
            <tr>
               <th class="col-xs-2">1</th><th class="col-xs-6">제목1111</th><th class="col-xs-2">user01</th><th class="col-xs-2">2015-05-18</th>
            </tr>
            <tr>
               <th class="col-xs-2">1</th><th class="col-xs-6">제목1111</th><th class="col-xs-2">user01</th><th class="col-xs-2">2015-05-18</th>
            </tr>
            <tr>
               <th class="col-xs-2">1</th><th class="col-xs-6">제목1111</th><th class="col-xs-2">user01</th><th class="col-xs-2">2015-05-18</th>
            </tr>
            <tr>
               <th class="col-xs-2">1</th><th class="col-xs-6">제목1111</th><th class="col-xs-2">user01</th><th class="col-xs-2">2015-05-18</th>
            </tr>
            <tr>
               <th class="col-xs-2">1</th><th class="col-xs-6">제목1111</th><th class="col-xs-2">user01</th><th class="col-xs-2">2015-05-18</th>
            </tr>
            <tr>
               <th class="col-xs-2">1</th><th class="col-xs-6">제목1111</th><th class="col-xs-2">user01</th><th class="col-xs-2">2015-05-18</th>
            </tr>
            
          </tbody>
        </table>
      </div>
				
		<div class="col-md-2 "></div>
  </div>
</div>
</body>
</html>



