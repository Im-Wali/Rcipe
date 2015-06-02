<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$(document).ready(function() {
		var ingredientCount0;
		var ingredientNumber = 0;
		
		//해당 ingredient의 PK를 집어놓고 search할경우 이곳에 값이 들어있을 경우 버튼을 disable로 출력한다.
		var ingredientNos;
		//해당 index
		var ingredientValues;
		//여기에 대한 로직을 구해야함 추가한 IngredientNumber에 대한 disable을 적용시켜야함
		$(document.body).on('click', '.deleteIngredient', function() {
			alert("AAA");
			var number = $(this).val();
			$("#button" + number).attr("disabled", false);
			$("#ingredient" + number).remove();
			ingredient--;
		});
		
		$(document.body).on('click', '.addIngredient', function() {
			alert("AA");
			var id=$(this).val();
			var name=$("#name"+id).val();
			$("#ingredientAfter").after("<div class='col-md-6' id='ingredient"+id+"'>"
					+"<div class='form-group' style='margin-top: 1%'>"
					+"<h4 align='center' class='control-label col-sm-4' id='ingredientName"+id+"'"
					+"style='font: bolder;'>"+name+"</h4>"
					+"	<div class='col-sm-6'>"
					+"<input type='text' class='form-control' placeholder='수량입력'"
					+"id='amount"+id+"'>"
					+"</div>"
					+"<button"
					+"class=vcontrol-label col-sm-2 btn btn-danger deleteIngredient'"
					+"value='"+id+"'>삭제</button>"
					+"</div>"
					+"</div>");
			/* $(".btn-danger").addClass('buttonName', 'btn-warning'); */
		});
	});
</script>
<div class="modal fade" id="ingredient" tabindex="-1" role="dialog"
	aria-labelledby="ingredient" aria-hidden="true">
	<div class="modal-dialog modal-lg">
		<div class="modal-content">
			<div class="modal-header" style="border-color: white" align="right">
				<button type="button" class="close" data-dismiss="modal"
					aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
				<h3 class="modal-title" id="exampleModalLabel" align="center">음식재료
					검색</h3>
			</div>
			<div class="modal-body">
				<div class="row" style="margin-top: 2%;">
					<div class="col-md-1"></div>
					<div class="col-md-10">
						<form action="#" method="get">
							<span id="imaginary_container"> <span
								class="input-group stylish-input-group"> <input
									type="text" class="form-control" placeholder="Search"
									id="inputsearch"> <span class="input-group-addon">
										<button type="submit">
											<span class="glyphicon glyphicon-search"></span>
										</button>
								</span>
							</span>
							</span>
						</form>
					</div>
					<div class="col-md-1"></div>
				</div>
				<div class="row" style="margin-top: 2%;">
					<div class="col-md-12">
						<hr style="border-color: black" />
						<h4 align="center" style="font: bolder;">음식재료 선택</h4>
						<div id="searchIngredients">
							<hr style="border-color: black" />
							<div class="row" style="margin-top: 2%;">

								<div class="col-md-3"  align="center"
									style="margin-top: 1%">
									<label id="name+number">음식재료</label>
									<button class="btn btn-info addIngredient" value="111"
										id="button+number">추가</button>
								</div>


							</div>
						</div>
					</div>
				</div>
				<hr style="border-color: black" />
				<div align="right">
					<div>
						<button class="btn btn-info createIngredient">재료 새로추가</button>
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

							<div class="col-md-6" id="ingredient+number">
								<div class="form-group" style="margin-top: 1%">
									<h4 align="center" class="control-label col-sm-4" id="ingredientName+number"
										style="font: bolder;">(재료명....)</h4>
									<div class="col-sm-6">
										<input type="text" class="form-control" placeholder="수량입력"
											id="amount+number">
									</div>
									<button
										class="control-label col-sm-2 btn btn-danger deleteIngredient"
										value="number">삭제</button>
								</div>
							</div>

						</div>
					</div>
					<div class="modal-footer" style="border-color: white">
						<button type="submit" class="btn btn-warning" id="loginSubmit"
							style="color: black; margin-top: 1%">완료</button>
						<!-- 					<input type="image" src="login.gif" alt="로그인" /> -->
					</div>
				</div>
			</div>
		</div>
	</div>
</div>