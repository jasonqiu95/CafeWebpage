/**
 * Add the info of the the product being revised into the modal dialogue
 */
$(document).ready(function() {
	$("#reviseBtn").click(function() {
		var info = [];
		var om_id = $($("input:checkbox:checked")[0]).attr("class");
		var om_providerID = $($("input:checkbox:checked")[0]).attr("id");
		$("td." + om_id).each(function() {
			info.push($(this).text());
		});
		$("#revise_name").val(info[1]);
		$("#revise_storage").val(info[2]);
		$("#revise_providerID").val(info[3]);
		$("#OM_id").val(om_id);
		$("#revise_providerID").prop("selectedIndex", parseInt(om_providerID) - 1);
	});
});