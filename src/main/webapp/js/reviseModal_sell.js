/**
 * Add the info of the the product being revised into the modal dialogue
 */
$(document).ready(function() {
	$("#reviseBtn").click(function() {
		var info = [];
		var s_id = $($("input:checkbox:checked")[0]).attr("class");
		var s_m_id = $($("input:checkbox:checked")[0]).attr("id");
		$("td." + s_id).each(function() {
			info.push($(this).text());
		});
		$("#revise_meal_ID").prop("selectedIndex", parseInt(s_m_id) - 1);
		$("#revise_price").val(info[3]);
		$("#revise_count").val(info[4]);
		$("#revise_opid").val(info[5]);
		$("#s_id").val(s_id);
	});
});