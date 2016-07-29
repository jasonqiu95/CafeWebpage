/**
 * Add the info of the the product being revised into the modal dialogue
 */
$(document).ready(function() {
	$("#reviseBtn").click(function() {
		var info = [];
		info.push($("input:checkbox:checked")[0].id); // meal_type id
		var meal_id = $($("input:checkbox:checked")[0]).attr("class");
		$("td." + meal_id).each(function() {
			info.push($(this).text());
		});
		$("#revise_name").val(info[2]);
		$("#revise_intro").val(info[5]);
		$("#revise_price").val(info[4]);
		$("#revise_type").prop("selectedIndex", parseInt(info[0]) - 1);
		$("#meal_ID").val(meal_id);
	});
});