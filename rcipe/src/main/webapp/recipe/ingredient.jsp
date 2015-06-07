<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(document)
			.ready(
					function() {
						var ingredientCount = 0;
						var ingredientNumber = 0;

						//해당 ingredient의 PK를 집어놓고 search할경우 이곳에 값이 들어있을 경우 버튼을 disable로 출력한다.
						var ingredientIds = "/";
						;
						//해당 index
						var ingredientValues;
						//여기에 대한 로직을 구해야함 추가한 IngredientNumber에 대한 disable을 적용시켜야함
						$(document.body).on(
								"click",
								'#ingredientSearch',
								function(event) {
									var str = $("#ingredientKeyword").val();
									chk1 = /[가-힝]/; //적어도 한개의 a-z 확인
									chk2 = /[a-z]{2}/i; //적어도 한개의 0-9 확인
									if (str == "") {
										alert("검색 키워드이 없습니다.");
										return;
									} else if (!chk1.test(str)
											&& !chk2.test(str)) {
										alert("검색 키워드가 올바르게 입력되지않았습니다.");
										return;
									}
									$("#searchIngredients").empty(); 
									$.ajax({
										url : 'getIngredientList',
										type : 'POST',
										dataType : 'json',
										data : "keyword="+str,
										success : function(data) {
											var list=data.list;
											var tag="";
											for(var i in list){
												 tag+="<div class='col-md-3' align='center' style='margin-top: 1%'>"
													+"<label id='name_"+list[i].ingredientNo+"' style='margin-right:1%'>"+list[i].ingredientName+"</label>";
												if(ingredientIds.indexOf("/"+list[i].ingredientNo+"/")!==-1){
													tag+="<button class='btn btn-info addIngredient' value='"+list[i].ingredientNo+"'"
													+"id='button_"+list[i].ingredientNo+"' disabled='disabled'>추가</button></div>";
												}else{
													tag+="<button class='btn btn-info addIngredient' value='"+list[i].ingredientNo+"'"
													+"id='button_"+list[i].ingredientNo+"'>추가</button></div>";
												}
											}
											if(tag==""){
												alert("검색어를 포함하는 재료는 없습니다.");
											}
											$("#searchIngredients").html(tag)
										},
										error : function(data) {
											alert("해당 검색결과가 존재하지 않습니다.");
										}
									});
								});
						$(document.body).on(
								'click',
								'.deleteIngredient',
								function() {
									var number = $(this).val();
									$("#button_" + number).removeAttr("disabled",
											false);
									$("#ingredient_" + number).remove();
									ingredientIds = ingredientIds.split("/"
											+ number + "/")[0]
											+ "/"
											+ ingredientIds.split("/" + number
													+ "/")[1];
									ingredientCount--;
								});

						$(document.body)
								.on(
										'click',
										'.addIngredient',
										function() {
											var id = $(this).val();
											var name = $("#name_" + id).html();
											$(this).attr("disabled",true);
											ingredientNumber++;
											ingredientCount++;
											ingredientIds += id + "/";
											$("#ingredientAfter")
													.after(
															"<div class='col-md-6' id='ingredient_"+id+"'>"
																	+ "<div class='form-group' style='margin-top: 1%'>"
																	+ "<input type='hidden' id='ingredient_"+ingredientNumber+"' value=''>"
																	+ "<h4 align='center' class='control-label col-sm-4' id='ingredientName_"+ingredientNumber+"'"
																	+"style='font: bolder;'>"
																	+ name
																	+ "</h4>"
																	+ "	<div class='col-sm-6'>"
																	+ "<input type='text' class='form-control' placeholder='수량입력'"
																	+"id='amount_"+ingredientNumber+"'>"
																	+ "</div>"
																	+ "<button "
																	+"class='vcontrol-label col-sm-2 btn btn-danger deleteIngredient'"
																	+"value='"+id+"'>삭제</button>"
																	+ "</div>"
																	+ "</div>");
											});
						$(document.body)
								.on(
										'click',
										'#settingIngredient',
										function() {
											ingredientValues = "";
											for (var i = 1; i <= ingredientNumber; i++) {
												var str = $("#amount_" + i)
														.val();
												if (str === "") {
													alert("수량을 적어주세요.");
													$("#amount_" + i).focus();
													return;
												}else if(str != undefined){
												ingredientValues += $(
														"#ingredientName_" + i)
														.html()
														+ "( " + str + ") , ";
												}

											}
											$("#ingredientIds").val(
													ingredientIds);
											$("#ingredients").val(
													ingredientValues);
											alert(ingredientIds);
											alert(ingredientValues);
											alert($("#ingredientIds").val());
											$("#ingredientClose").click();
										});
						$("#insertINgredientOpen").click(function(){
							$("#ingredient").modal('hide');
						});
						$("#InsertIngredientClose").click(function(){
							$("#ingredient").modal('show');
						});
						$("#ingredientAdmitButton").click(function(){
							var str=$("#ingredientAdmitText").val();
							chk1 = /[가-힝]/; //적어도 한개의 a-z 확인
							chk2 = /[a-z]{2}/i; //적어도 한개의 0-9 확인
							if (str == "") {
								alert("등록할 재료명을 입력하세요");
								return;
							} else if (!chk1.test(str)
									&& !chk2.test(str)) {
								alert("등록할 재료명을 정확하게 작성해주세요");
								return;
							}else{
								$.ajax({
									url : 'insertIngredient',
									type : 'POST',
									data : "ingredientName="+str,
									success : function(data) {
										if(data=="true"){
											alert("음식재료가 등록되었습니다. 다시 검색해주세요");
											$("#insertIngredient").modal('hide');
											$("#ingredient").modal('show');
										}else{
											alert("해당 재료명의 재료가 존재합니다.");
										}
									},
									error : function(data) {
										alert("해당 재료명의 재료가 존재합니다.");
									}
								});
							}
						});
					});
</script>

<div class="modal fade" id="ingredient" tabindex="-1" role="dialog"
	aria-labelledby="ingredient" aria-hidden="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header" style="border-color: white" align="right">
				<button type="button" class="close" data-dismiss="modal"
					id="ingredientClose" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h3 class="modal-title" id="exampleModalLabel" align="center">음식재료
					검색</h3>
			</div>
			<div class="modal-body">
				<div class="row" style="margin-top: 2%;">
					<div class="col-md-1"></div>
					<div class="col-md-10">
							<span id="imaginary_container"> <span
								class="input-group stylish-input-group"> <input
									type="text" class="form-control" placeholder="Search"
									id="ingredientKeyword"> <span
									class="input-group-addon">
										<button type="submit" id="ingredientSearch">
											<span class="glyphicon glyphicon-search"></span>
										</button>
								</span>
							</span>
							</span>
					</div>
					<div class="col-md-1"></div>
				</div>
				<div class="row" style="margin-top: 2%;">
					<div class="col-md-12">
						<hr style="border-color: black" />
						<h4 align="center" style="font: bolder;">음식재료 선택</h4>
						<hr style="border-color: black" />
						<div class="row" style="margin-top: 2%;" id="searchIngredients">
						<!-- 음식재료을 보여주는 부분 -->
						</div>
					</div>
				</div>
				<hr style="border-color: black" />
				<div align="right">
					<div>
					<a href="#" class="btn btn-info"
									data-toggle="modal" data-target="#insertIngredient" id="insertINgredientOpen"
									data-whatever="insertIngredient" data-backdrop="false" 
									>재료 새로추가</a>
					</div>
					<div>
						<label style="color: red; font-size: small;">*만약 찾는 재료가 없을
							경우 추가하여 사용하세요</label>
					</div>
				</div>
				<hr style="border-color: black" />
				<h4 align="center" style="font: bolder;">선택된 음식재료</h4>
				<hr style="border-color: black" />
				<div class="row">
					<div class="col-md-12">
						<div class="row">
							<div id="ingredientAfter"></div>
							<!--선택된 음식을 보여주는 부분 -->

						</div>
					</div>
					<div class="modal-footer" style="border-color: white;">
						<button type="button" class="btn btn-warning "
							id="settingIngredient" style="color: black; margin-top: 1%">완료</button>
						<!-- 					<input type="image" src="login.gif" alt="로그인" /> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>

<div class="modal fade" id="insertIngredient" tabindex="-2"
	role="dialog" aria-labelledby="insertIngredient" aria-hidden="false">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal"
					id="InsertIngredientClose" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h3 class="modal-title" id="exampleModalLabel" align="center">음식재료
					새로추가</h3>
			</div>
			<div class="modal-body">
				<div class="row" style="margin-top: 2%;">
					<div class="row">
						<div class="col-md-1"></div>
						<div class="col-md-9">
							<div class="input-group ">
								<input type="text" class="form-control "
									id="ingredientAdmitText" placeholder="등록할 재료명을 입력하세요">
								<button class="input-group-addon btn" id="ingredientAdmitButton"
									style="background-color: rgb(57, 179, 215); color: white">재료등록</button>
							</div>
						</div>
						<div class="col-md-1" style="margin-left: -5%"></div>
						<div class="col-md-1"></div>
					</div>
				</div>
			</div>
			<div class="modal-footer"></div>
		</div>
	</div>
</div>