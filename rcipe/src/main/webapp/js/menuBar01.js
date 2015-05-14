function searchContentsResulver(value,value2){
	document.getElementById("search_contents").innerHTML=value;
	document.getElementById("searchBoard").val=value2;
};
	$(document).ready(function() {
		$(":checkbox").change(function() {
			var cnt = 5;
			if (cnt <= $(":checkbox:checked").length) {
				alert("5개까지만 체크 가능");
				$(":checkbox:not(:checked)").attr("disabled", "disabled");
			} else {
				$(":checkbox").removeAttr("disabled");
			}
			function function_click() {
				var str = "";
				$("input:checkbox:checked").each(function(index) {
					if (index == 0) {
						str += $(this).val();
					} else {
						str += "," + $(this).val();
					}
				});
				return str;
			}
			$("#inputsearch").val(function_click());

		});
		
	});