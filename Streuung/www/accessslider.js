		$(document).ready(function(){
			var rail = $("#n").parent();
			$(rail).attr("role","slider");
			$(rail).attr("aria-valuenow", $("#n").attr("value"));
			$(rail).attr("aria-valuemin", $("#n").attr("data-from"));
			$(rail).attr("aria-valuemax", $("#n").attr("data-to"));
			$(rail).attr("aria-label","Stichprobengröße");
						$(rail).attr("tabindex", "1");

		})
