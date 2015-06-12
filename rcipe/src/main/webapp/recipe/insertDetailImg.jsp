<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<div class="form-login " style="margin-bottom: 2%;">
	<!-- 여기서 CLOSE버튼을 누루면 해당 설명 from 사라짐 -->
	<button type="button" class="close" data-dismiss="modal"
		aria-label="Close">
		<span>&times;</span>
	</button>
	<h3 align="center" style="margin-bottm: 1%">상세 레시피 작성</h3>
	<div style="margin-top: 1%">
		<div class="media">
			<div class="media-left">
				<a href="#"> <img class="media-object img-rounded"
					src="${pageContext.servletContext.contextPath}/img/images3.jpg" alt="...">
				</a>
			</div>
			<div style="margin: 1%">
				<label style="font-size: x-large; margin: 1%">사진에 대한 설명</label>
			</div>
			<div>
				<textarea class="form-control" rows="5" placeholder="사진에 대한 설명을 적어주세요"></textarea>
			</div>
		</div>
	</div>
</div>
