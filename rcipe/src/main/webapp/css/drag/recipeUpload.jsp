<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">




<html class="no-js" lang="ko">
<head>
<meta charset="UTF-8">
<title>레시피 등록</title>
<meta http-equiv="X-UA-Compatible" content="IE=edge">


<!--[if lt IE 9]><link rel="stylesheet" href="/static/css/ie_201504111523.min.css"><![endif]-->
<script src="/static/js/modernizr.custom.min.js"></script>

<script src="jquery.js"></script>
<script src="javascript.js"></script>
<link rel="stylesheet" type="text/css" href="style.css" />
<link rel="stylesheet" type="text/css" href="pacifico.css" />

</head>
<body>


	<form id="user_recipe" action="/recipe/user/save" method="post">
		<div id="wrap" style="margin-top: 15px;">

			<div class="index">

				<input type="hidden" id="eventId" name="eventId" value="" />


				<!-- 드래그 & 드랍 추가 시작-->
				<div class="content">
					<div>
						<label style="color: red; font-size: large;">이미지 등록</label> <label
							style="color: black; font-size: small; padding: 10px;">요리
							방법 이미지를 순서대로 올려주세요^^</label>
					</div>
					<div id="drop-files" ondragover="return false">이미지 드래그 & 드롭</div>
					<div class="cont-set">
						<div id="uploaded-holder">
							<div id="dropped-files">
								<div id="upload-button">
									<a href="#" class="upload">Upload!</a> <a href="#"
										class="delete">delete</a> <span>0 Files</span>
								</div>
							</div>
							<div id="extra-files">
								<div class="number">0</div>
								<div id="file-list">
									<ul></ul>
								</div>
							</div>
						</div>

						<div id="loading">
							<div id="loading-bar">
								<div class="loading-color"></div>
							</div>
							<div id="loading-content">Uploading file.jpg</div>
						</div>

						<div id="file-name-holder">
							<ul id="uploaded-files">
								<h1>Uploaded Files</h1>
							</ul>
						</div>
					</div>
				</div>
			</div>
		</div>
	</form>
	<script>
		if (!window.console)
			console = {
				log : function() {
				}
			};

		var aaf_host = "http://" + document.location.hostname, aaf_port = document.location.port;
		if (aaf_port) {
			aaf_host += ":" + aaf_port;
		}

		function popOpen(url, title, width, height) {
			var option, cw, ch, sw, sh, ml, mt;
			cw = screen.availWidth;
			ch = screen.availHeight;
			sw = width;
			sh = height;
			ml = (cw - sw) / 2;
			mt = (ch - sh) / 2;

			option = "width=" + sw + ", height=" + sh + ", top=" + mt
					+ ", left=" + ml
					+ ", resizable=1, scrollbars=yes, status=no;";
			window.open(url, $.trim(title), option);
		}

		function myApp() {

			location.href = "/my";

		}
	</script>


	<script>
		$(function() {
			nav();
		});
	</script>



	<!-- Google Analytics Tracking Code / 2014-10-20 -->
	<script>
		(function(i, s, o, g, r, a, m) {
			i['GoogleAnalyticsObject'] = r;
			i[r] = i[r] || function() {
				(i[r].q = i[r].q || []).push(arguments)
			}, i[r].l = 1 * new Date();
			a = s.createElement(o), m = s.getElementsByTagName(o)[0];
			a.async = 1;
			a.src = g;
			m.parentNode.insertBefore(a, m)
		})(window, document, 'script',
				'//www.google-analytics.com/analytics.js', 'ga');

		ga('create', 'UA-55909700-1', 'auto');
		ga('require', 'displayfeatures');
		ga('send', 'pageview');
	</script>

	<script type="text/javascript">
		var TRS_AIDX = 8922;
		var TRS_PROTOCOL = document.location.protocol;
		document.writeln();
		var TRS_URL = TRS_PROTOCOL
				+ '//'
				+ ((TRS_PROTOCOL == 'https:') ? 'analysis.adinsight.co.kr'
						: 'adlog.adinsight.co.kr') + '/emnet/trs_esc.js';
		document
				.writeln("<scr"+"ipt language='javascript' src='" + TRS_URL + "'></scr"+"ipt>");
	</script>

	<script type="text/javascript">
		/* <![CDATA[ */
		var google_conversion_id = 957251549;
		var google_custom_params = window.google_tag_params;
		var google_remarketing_only = true;
		/* ]]> */
	</script>
	<script type="text/javascript"
		src="//www.googleadservices.com/pagead/conversion.js">
		
	</script>

</body>
</html>