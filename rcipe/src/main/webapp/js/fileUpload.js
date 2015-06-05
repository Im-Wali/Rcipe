/*
 * 해당 JS파일은 id:fileUpload를 가지고 있는 객체에 drop이벤트가 발생하면 
 * sendFile이라는 AJAX로 함수를 호출하여 서버에 파일을 업로드를 하는 jQurey이다.
 */

$("cocument")
		.ready(
				function() {
					var dropzone1 = document.getElementById('fileUpload');
					setDnDhandler(dropzone1);

					function setDnDhandler(obj) {
						obj.addEventListener("dragover", function(event) {
							event.preventDefault();
						}, true);
						obj
								.addEventListener(
										"drop",
										function(event) {
											event.preventDefault();
											var allTheFiles = event.dataTransfer.files;
											// 여러개 의 파일을 업로드할 경우를 대비하여 이런
											// 방법을사용했다.
											if (allTheFiles.length === 1) {
												for (var i = 0; i < allTheFiles.length; i++) {
													var element = document
															.createElement('div');
													element.id = 'f' + i;
													document.body
															.appendChild(element);
													sendFile(allTheFiles[i],
															element.id);
												}
											} else {
												alert("하나만 업로드 가능합니다.");
											}
										}, true);
					}
					function sendFile(file, fileId) {
						var xhr = new XMLHttpRequest();
						xhr.onreadystatechange = function() {
							if (xhr.readyState == 4 && xhr.status == 200) {
								// 정확히 수행되면 alert창 띄움
								var str=decodeURIComponent(xhr.responseText);
								str=str.replace( /\+/g, " ");
								var str2=str.split("massage")[1].substring("1").split(",")[0];
								alert(str2);
								var str3=str.split("changeImg")[1].substring("1").split(",")[0];
								$("#fileUpload").attr("src","../images/"+str3);
							}
						};
						// var p=$('#pictureLcation').val();
						// xhr.open("POST","../app/"+p);
						xhr.open("POST", "../file/profileUpload");
						var fd = new FormData();
						fd.append("file", file);
						xhr.send(fd);
					}
				});