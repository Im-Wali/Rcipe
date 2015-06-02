<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html style="font-size: 13px">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<head>
<link rel="stylesheet"
	href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.4/css/bootstrap.min.css">
<link
	href="//maxcdn.bootstrapcdn.com/font-awesome/4.1.0/css/font-awesome.min.css"
	rel="stylesheet">
<link href="../css/recipe01.css" rel="stylesheet">
<script
	src="https://ajax.googleapis.com/ajax/libs/jquery/1.11.1/jquery.min.js"></script>
<script type="text/javascript" src="../js/recipe01.js"></script>

<TITLE>Recipe</TITLE>
<style type="http://127.0.0.1:8080/rcipe/text/css">
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
}

/*
Ref:
Thanks to:
http://www.jqueryscript.net/layout/Simple-jQuery-Plugin-To-Create-Pinterest-Style-Grid-Layout-Pinterest-Grid.html
*/
body {
	background-color: #eee;
}

#pinBoot {
	position: relative;
	max-width: 100%;
	width: 100%;
}

#pinBoot img {
	width: 100%;
	max-width: 100%;
	height: auto;
}

.white-panel {
	position: absolute;
	background: white;
	box-shadow: 0px 1px 2px rgba(0, 0, 0, 0.3);
	padding: 10px;
}
/*
stylize any heading tags withing white-panel below
*/
.white-panel h1 {
	font-size: 1em;
}

.white-panel h1 a {
	color: #A92733;
}

.white-panel:hover {
	box-shadow: 1px 1px 10px rgba(0, 0, 0, 0.5);
	margin-top: -5px;
	-webkit-transition: all 0.3s ease-in-out;
	-moz-transition: all 0.3s ease-in-out;
	-o-transition: all 0.3s ease-in-out;
	transition: all 0.3s ease-in-out;
}
</style>
</head>
<body
	style="background-color: #fff color: #383838; padding: 0; margin: 0; font-family: Verdana, Arial, sans-serif; font-weight: 400; font-style: normal; line-height: 131%; position: relative; cursor: default">
	<div><jsp:include page="../main/menuBar.jsp"></jsp:include></div>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="form-login " style="margin-bottom: 2%;">
				<div>
					<div>
						<div style="margin-top: 1%" align="center">
							<h2>닭가슴살 한입 샌드위치</h2>
						</div>
						<div class="text-center center-block"
							style="margin-left: 70%; " >
						<jsp:include page="../sns/facebook.jsp"></jsp:include>
						<img id="share_button" src="http://127.0.0.1:8080/rcipe/img/twitter.png">
						<img id="share_button" src="http://127.0.0.1:8080/rcipe/img/mail.png">
						<img id="share_button" src="http://127.0.0.1:8080/rcipe/img/printer.png" height="60" width="60">
						</div>
					</div>
					<div align="center" style="margin-top: 2%">
						<img class="img-thumbnail" src="http://127.0.0.1:8080/rcipe/img/s/start.JPG">
					</div>

					<div class="row lead"
						style="margin-top: 2%; margin-bottom: 0%; width: 100%; margin-left: auto; margin-right: auto; margin-top: 0; margin-bottom: 0; max-width: 100rem">
						<div style="margin-top: 1%" align="right">
							<span id="stars-existing" class="starrr" data-rating='4'
								style="color: orange;"></span> 현재 평점 <span id="count-existing">4</span>
						</div>
						<div style="margin-top: 1%" align="right">
							<span id="stars" class="starrr" style="color: orange;"></span> 별점
							주기 <span id="count">0</span>
						</div>

					</div>
					<div style="font-size: medium; margin-top: 1%">간편하게 먹을 수 있 는
						닭가슴살 샌드위치 소개합니다~~! 닭가슴살만 익히면... 뚝딱...</div>
				</div>
				<div class="row"
					style="width: 100%; margin-left: auto; margin-right: auto; margin-top: 0; margin-bottom: 0; max-width: 100rem">
					<div style="margin: 1%; font-size: medium;">
						<div>
							<h3>요리재료</h3>
						</div>
						<ul>
							<li style="margin-top: 1%">
								<div>
									<div>닭가슴살(2),슬라이스치즈(빵 갯수만큼), 상추잎(빵 갯수만큼), 고추피클(30개)</div>
								</div>
							</li>
							<li style="margin-top: 1%">
								<div>
									<div>튀김옷 : 밀가루(2), 달걀+우유(1), 빵가루</div>
								</div>
							</li>
							<li style="margin-top: 1%">
								<div>
									<div>양념 : 고운고춧가루(약간),치킨튀김(약간),소금(약간), 후춧가루(약간)</div>
								</div>
							</li>
							<li style="margin-top: 1%">
								<div>
									<div>소스 : 씨겨자머스터드(2), 마요네즈(2), 케첩(2), 다진마늘(0.5) *(1)은 한
										스푼 입니다.</div>
								</div>
							</li>

						</ul>
					</div>
					<div class="recipeTips" style="margin-top: 1%">
						<h3>*Tip</h3>
						<ul>
							<li>(1)은 한 스푼 입니다.</li>
						</ul>
					</div>
					<!-- 영양정보는 보류 -->
					<!-- <div>
						<div class="h2Left"
							style="font-family: Century Gothic, Arial, Helvetica, sans-serif; font-size: 1.69231rem; color: #383838; line-height: 2rem; text-transform: lowercase; border-bottom: .07692rem solid #eee; margin: .76923rem 0">
							<h4>영양정보</h4>
						</div>
						<span>여기에다가 영양정보를 넣자</span>
						<div>
							<p></p>
						</div>
					</div> -->
				</div>
				<div>
					<div class="h2Left">
						<h3>조리 방법</h3>
					</div>
					<div align="center">
						<div>
							<div>
								<div>
									<div class="sBlog" style="margin: 1%">
										<img class="img-thumbnail" src="http://127.0.0.1:8080/rcipe/img/s/o1.JPG" />
										<h4 class="brand" style="margin: 1%">1.닭가슴살은 손가락 길이 만큼
											자르고 우유로 10분간 재어 누린네를 제거해요.</h4>
									</div>
									<div class="sBlog" style="margin: 1%">
										<img class="img-thumbnail" src="http://127.0.0.1:8080/rcipe/img/s/o2.JPG" />
										<h4 class="brand" style="margin: 1%">2.우유를 버리고 헹군 뒤
											치킨튀김가루로 밑간을 해줬어요.</h4>
									</div>
									<div class="sBlog" style="margin: 1%">
										<img class="img-thumbnail" src="http://127.0.0.1:8080/rcipe/img/s/o3.JPG" />
										<h4 class="brand" style="margin: 1%">3.밑가한 닭가슴살을 계란 > 빵가루
											순으로 튀김옷을 입혀줍니다. 빵가루는 꾹꾹 눌러가며 잘 입혀주세요.</h4>
									</div>
									<div class="sBlog" style="margin: 1%">
										<img class="img-thumbnail" src="http://127.0.0.1:8080/rcipe/img/s/o4.JPG" />
										<h4 class="brand" style="margin: 1%">4.식빵은 사면의 모서리를 잘라
											밀대로 꾹꾹 밀어 납작하게 만듭니다.</h4>
									</div>
									<div class="sBlog" style="margin: 1%">
										<img class="img-thumbnail" src="http://127.0.0.1:8080/rcipe/img/s/o5.JPG" />
										<h4 class="brand" style="margin: 1%">5.달군 팬에 기름을 둘러 약한
											불에서 치킨을 앞뒤로 노릇하게 구워내줍니다.</h4>
									</div>
									<div class="sBlog" style="margin: 1%">
										<img class="img-thumbnail" src="http://127.0.0.1:8080/rcipe/img/s/o6.JPG" />
										<h4 class="brand" style="margin: 1%">6.윗면에 소스를 발라주고, 상추,
											치즈, 치킨, 고추피클, 순으로 올린 뒤 돌돌 말아주세요.</h4>
									</div>
									<div class="sBlog" style="margin: 1%">
										<img class="img-thumbnail" src="http://127.0.0.1:8080/rcipe/img/s/o7.JPG" />
									</div>
									<div class="sBlog" style="margin: 1%">
										<img class="img-thumbnail" src="http://127.0.0.1:8080/rcipe/img/s/o8.JPG" />
										<h4 class="brand" style="margin: 1%">7.랩으로 꽁꽁 싸서 10분 이상
											두어 동그랗게 되도록 해줍니다. 10분 후 랩을 벗겨 먹기 좋게 썰어주면 완성.</h4>
									</div>
									<div class="sBlog" style="margin: 1%">
										<img class="img-thumbnail" src="http://127.0.0.1:8080/rcipe/img/s/main.JPG" />
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="form-login " style="margin-bottom: 2%;">
				<jsp:include page="../blog/blog.jsp"></jsp:include>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>
	<div class="row">
		<div class="col-md-1"></div>
		<div class="col-md-10">
			<div class="form-login " style="margin-bottom: 2%;">
				<jsp:include page="../comment/comment.jsp"></jsp:include>
			</div>
		</div>
		<div class="col-md-1"></div>
	</div>

</body>
</html>
