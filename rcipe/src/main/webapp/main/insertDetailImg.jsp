<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div class="form-login " style="margin-bottom: 2%;" id="detail1">
	<!-- 여기서 CLOSE버튼을 누루면 해당 설명 from 사라짐 -->
	<button type="button" class="close" data-dismiss="modal" onclick="javascript:removeDetail(1)"
		aria-label="Close">
		<span>&times;</span>
	</button>
	<h3 align="center" style="margin-bottm: 1%">상세 레시피 작성</h3>
	<div style="margin-top: 1%">
		<div class="media">
			<div class="media-left">
				<input type="hidden" id="recipedetailPicture" value="">
				<a href="#"> <img class="media-object img-rounded fileUpload"
					src="../img/images3.jpg" alt="..." id="detailPicture1">
				</a>
			</div>
			<div style="color: red; margin-right: 1%;margin-top:1%">*등록할 사진을 위의 공간에 드래그 하세요</div> 
			<div style="margin-top: 1%">
				<input type="file" class="filestyle recipeButtinUpload"
					data-buttonName="btn-warning" data-input="false"
					data-buttonText="사진 등록">
			</div>
			<div style="margin: 1%">
				<label style="font-size: x-large; margin: 1%">사진에 대한 설명</label>
			</div>
			<div>
				<textarea class="form-control" rows="5"
					placeholder="사진에 대한 설명을 적어주세요"></textarea>
			</div>
		</div>
	</div>
</div>
