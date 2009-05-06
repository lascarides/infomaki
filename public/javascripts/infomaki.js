var start_time;
var time_animation = [];

function change_click_colors(bgcolor, clickimage) {

	var spots 	= $$('.clickspot');
	var pcts 	= $$('.clickpercent');

	for(var i=0; i < spots.length; i++){
		spots[i].setStyle("background-image:url(/images/" + clickimage + ".png);");
	}
	for(var i=0; i < pcts.length; i++){
		pcts[i].setStyle("background-color:" + bgcolor + ";");
	}

}

function change_view_type(view_type) {

	var spots 	= $$('.clickspot');
	var pcts 	= $$('.clickpercent');

	p_vis = (view_type == "grid") ? "visible" : "hidden";
	s_vis = (view_type == "click") ? "visible" : "hidden";

	for(var i=0; i < spots.length; i++){
		spots[i].setStyle("visibility:" + s_vis + ";");
	}
	for(var i=0; i < pcts.length; i++){
		pcts[i].setStyle("visibility:" + p_vis + ";");
	}

}

// Returns seconds between start_time and now.
function get_elapsed_time(start_time) {
	now = new Date();
	return (now.getTime() - start_time) / 1000;
}

