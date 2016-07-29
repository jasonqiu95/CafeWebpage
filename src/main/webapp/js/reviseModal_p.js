/**
 * Add the info of the the product being revised into the modal dialogue
 */
$(document).ready(function() {
	$("#reviseBtn").click(function() {
		var info = [];
		var p_id = $($("input:checkbox:checked")[0]).attr("class");
		$("td." + p_id).each(function() {
			info.push($(this).text());
		});
		$("#revise_name").val(info[1]);
		$("#revise_intro").val(info[4]);
		$("#revise_addr").val(info[3]);
		$("#revise_contact").val(info[2]);
		$("#p_id").val(p_id);
	});
});