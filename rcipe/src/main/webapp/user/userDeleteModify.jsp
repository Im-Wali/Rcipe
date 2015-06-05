<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<script>
	$("document")
			.ready(
					function() {						
						$("#deleteUserPW")
	                      .bind(
	                          'keyup',
	                          function() {
	                            var p = $(this).val();
	                           
	                            $.get('../app/user/checkedPassword', function(data) {
	                            	var s = data;
	                            });
	                            
	                            if(p===s){
	                            	$('#deleteUserPWCheck')
	                                .html(
	                                    function(index,
	                                        html) {
	                                      return "<span style='color:blue;'>비밀번호가 일치합니다.</span>";
	                                    });
	                            }else{
	                            	$('#deleteUserPWCheck')
	                                  .html(
	                                      function(index,
	                                          html) {
	                                        return "<span style='color:red;'>비밀번호가 일치하지 않습니다.</span>";
	                                      });
	                            }
	           });
	            
	          $("#deleteUserOK").click(function() {
	              $.get('../app/deleteUser?nickname=user01', function(data) {
	                  });
	                  alert('회원탈퇴했습니다.');
	           });
						
	});
</script>

<form method="POST" action="#">
  <div class="modal fade" id="deleteUserPWModal" tabindex="-1"
    role="dialog" aria-labelledby="deleteUserPWModal" aria-hidden="true">
    <div class="modal-dialog">
      <div class="modal-content">
        <div class="modal-header">
          <button type="button" class="close" data-dismiss="modal"
            aria-label="Close">
            <span aria-hidden="true">&times;</span>
          </button>
          <h4 class="modal-title" id="exampleModalLabel">회원 탈퇴</h4>
        </div>
        <div class="modal-body">
          <div class="form-group">
            <label for="recipient-name" class="control-label">비밀번호입력</label> <input
              type="password" class="form-control" id="deleteUserPW">
            <div id="deleteUserPWCheck"></div>
          </div>
        </div>
        <div class="modal-footer">
          <button id="deleteUserOK" type="submit" class="btn btn-primary">확인</button>
        </div>
      </div>
    </div>
  </div>
</form>
