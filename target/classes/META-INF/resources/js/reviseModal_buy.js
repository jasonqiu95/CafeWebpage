/**
 * Add the info of the the product being revised into the modal dialogue
 */
$(document).ready(function() {
	$("#reviseBtn").click(function() {
		var info = [];
		var b_id = $($("input:checkbox:checked")[0]).attr("class");
		$("td." + b_id).each(function() {
			info.push($(this).text());
		});
		$("#revise_pID").prop("selectedIndex", parseInt(info[1]) - 1);
		$("#revise_omID").prop("selectedIndex", parseInt(info[2]) - 1);
		$("#revise_count").val(info[4]);
		$("#revise_price").val(info[5]);
		$("#revise_opID").val(info[6]);
		$("#b_id").val(b_id);
	});
});