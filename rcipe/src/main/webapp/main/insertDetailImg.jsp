<%@ page language="java" contentType="text/html; charset=EUC-KR"
	pageEncoding="EUC-KR"%>
<div class="form-login " style="margin-bottom: 2%;" id="detail1">
	<!-- ���⼭ CLOSE��ư�� ����� �ش� ���� from ����� -->
	<button type="button" class="close" data-dismiss="modal" onclick="javascript:removeDetail(1)"
		aria-label="Close">
		<span>&times;</span>
	</button>
	<h3 align="center" style="margin-bottm: 1%">�� ������ �ۼ�</h3>
	<div style="margin-top: 1%">
		<div class="media">
			<div class="media-left">
				<input type="hidden" id="recipedetailPicture" value="">
				<a href="#"> <img class="media-object img-rounded fileUpload"
					src="../img/images3.jpg" alt="..." id="detailPicture1">
				</a>
			</div>
			<div style="color: red; margin-right: 1%;margin-top:1%">*����� ������ ���� ������ �巡�� �ϼ���</div> 
			<div style="margin-top: 1%">
				<input type="file" class="filestyle recipeButtinUpload"
					data-buttonName="btn-warning" data-input="false"
					data-buttonText="���� ���">
			</div>
			<div style="margin: 1%">
				<label style="font-size: x-large; margin: 1%">������ ���� ����</label>
			</div>
			<div>
				<textarea class="form-control" rows="5"
					placeholder="������ ���� ������ �����ּ���"></textarea>
			</div>
		</div>
	</div>
</div>
