/**
 * Add the info of the the product being revised into the modal dialogue
 */
$(document).ready(function() {
	$("#reviseBtn").click(function() {
		var info = [];
		var t_id = $($("input:checkbox:checked")[0]).attr("class");
		$("td." + t_id).each(function() {
			info.push($(this).text());
		});
		$("#revise_omID").prop("selectedIndex", parseInt(info[1]) - 1);
		$("#revise_count").val(info[3]);
		$("#revise_opID").val(info[4]);
		$("#t_id").val(t_id);
	});
});