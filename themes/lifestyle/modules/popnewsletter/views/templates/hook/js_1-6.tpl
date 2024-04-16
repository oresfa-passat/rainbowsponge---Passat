<script type="text/javascript">

//function getCookie
function getCookie(cname) {
	var name = cname + "=";
	var ca = document.cookie.split(';');
	for (var i = 0; i < ca.length; i++) {
		var c = ca[i];
		while (c.charAt(0) == ' ') c = c.substring(1);
		if (c.indexOf(name) != -1) return c.substring(name.length, c.length);
	}
	return "";
}

function setCookie(cname, cvalue, exdays) {
	document.cookie = cname + "=" + cvalue +"; path=/";
}

{literal}

	swal_error_already_exist = "{/literal}{l s='Your email is already in our database.' mod='popnewsletter'}{literal}";
	swal_error_bad_email = "{/literal}{l s='You did not enter a proper email.' mod='popnewsletter'}{literal}";
	swal_valid = "{/literal}{l s='You will now receive our newsletters!' mod='popnewsletter'}{literal}";
	swal_unknown_error = "{/literal}{l s='Unknown error. Please try again.' mod='popnewsletter'}{literal}";
	swal_title_failed = "{/literal}{l s='Registration Failed' mod='popnewsletter'}{literal}";
	swal_title_valid = "{/literal}{l s='Thank you!' mod='popnewsletter'}{literal}";
	popup_id = "{/literal}{$popup_id|escape:'htmlall':'UTF-8'}{literal}";
	main_bg_color = "{/literal}{$main_bg_color|escape:'htmlall':'UTF-8'}{literal}";

	$(window).load(function() {

		var ajax_url = '{/literal}{$ajax_url}{literal}';

		Shadowbox.init({
			enableKeys: false
		});

		var sb_content = $('#popnewsletter').html();
		var c = getCookie('popnewsletter');

		if (c.length == 0)
		{
			setTimeout(function(){

				$('body').addClass('noscroll');
				$("#sb-body-inner").css("background-color", "{/literal}{$main_bg_color|escape:'htmlall':'UTF-8'}{literal}");
				setCookie("popnewsletter", popup_id);
				// open a welcome message as soon as the window loads
				Shadowbox.open({
					content: sb_content,
					player: 'html',
					height: "{/literal}{$shadow_box_height|intval}{literal}",
					width: "{/literal}{$shadow_box_width|intval}{literal}",
				})}, "{/literal}{$shadow_box_delay_time|intval}{literal}" /* The number of milliseconds to wait before executing the code */
			);
			$('#popnewsletter').html('');
		}


		$('body').on('click', '#popnewsletter_submit' ,function(e){
			e.preventDefault();
			var error = '';

			var popnewsletter_askgender = $("#sb-container").find('input[name=popnewsletter_askgender]:checked');
			var popnewsletter_askgender_val = $("#sb-container").find('input[name=popnewsletter_askgender]:checked').val();

			var popnewsletter_askbirth = $("#sb-container").find('select[name=popnewsletter_askbirth]');
			var popnewsletter_askbirth_val = $("#sb-container").find('select[name=popnewsletter_askbirth]').val();

			var popnewsletter_firstname = $("#sb-container").find('input[name=popnewsletter_firstname]');
			var popnewsletter_firstname_val = $("#sb-container").find('input[name=popnewsletter_firstname]').val()
			var popnewsletter_lastname = $("#sb-container").find('input[name=popnewsletter_lastname]');
			var popnewsletter_lastname_val = $("#sb-container").find('input[name=popnewsletter_lastname]').val();

			var popnewsletter_email = $("#sb-container").find('input[name=popnewsletter_email]');
			var popnewsletter_email_val = $("#sb-container").find('input[name=popnewsletter_email]').val()

			var id_lang = "{/literal}{$context->cookie->id_lang|escape:'htmlall':'UTF-8'}{literal}";

			if ($(popnewsletter_lastname).attr('data-required') == "1" && popnewsletter_lastname_val == '')
			{
				error = 'error';
				// We remove and add to restart the error animation everytime customer tries to submit
				$(popnewsletter_lastname).removeClass('popnews_error');
				$(popnewsletter_lastname).addClass('popnews_error');
			}
			if ($(popnewsletter_firstname).attr('data-required') == "1" && popnewsletter_firstname_val == '')
			{
				error = 'error';
				$(popnewsletter_firstname).removeClass('popnews_error');
				$(popnewsletter_firstname).addClass('popnews_error');
			}
			if (popnewsletter_email_val == '')
			{
				error = 'error';
				$(popnewsletter_email).removeClass('popnews_error');
				$(popnewsletter_email).addClass('popnews_error');
			}

			if (error != 'error')
			{
				$.ajax({
					method: 'POST',
					url: ajax_url,
					dataType : 'html',
					data: {
						action : 'addEmail',
						ajax : true,
						popnewsletter_firstname : popnewsletter_firstname_val,
						popnewsletter_lastname : popnewsletter_lastname_val,
						popnewsletter_askgender : popnewsletter_askgender_val,
						popnewsletter_askbirth : popnewsletter_askbirth_val,
						popnewsletter_email : popnewsletter_email_val,
						id_lang : id_lang,
					},
					success: function(data){
						if (data == '1' || data == '2' || data == '3')
							swal(swal_title_failed, swal_error_already_exist, "error");
						else if (data == '4')
							swal(swal_title_failed, swal_error_bad_email, "error");
						else if (data == 'true')
						{
							swal(swal_title_valid, swal_valid, "success");
							$("#sb-container").fadeOut();
						}
						else
							swal(swal_title_failed, swal_unknown_error, "error");
					}
				})
			}
		});

		PopNews_fadeout = function(){
			$("#sb-container").fadeOut();
			$('body').removeClass('noscroll');
		};

		var isMobile = {
			Android: function() {
				return navigator.userAgent.match(/Android/i);
			},
			BlackBerry: function() {
				return navigator.userAgent.match(/BlackBerry/i);
			},
			iOS: function() {
				return navigator.userAgent.match(/iPhone|iPad|iPod/i);
			},
			iOSmall: function() {
				return navigator.userAgent.match(/iPhone|iPod/i);
			},
			Opera: function() {
				return navigator.userAgent.match(/Opera Mini/i);
			},
			Windows: function() {
				return navigator.userAgent.match(/IEMobile/i);
			},
			any: function() {
				return (isMobile.Android() || isMobile.BlackBerry() || isMobile.iOS() || isMobile.Opera() || isMobile.Windows());
			}
		}

		if (isMobile.any() !== null) {
			clicTouch = 'touchstart touchend click';
		} else {
			clicTouch = 'mousedown';
		}
		if (isMobile.any() === null) {
			modClicTouch = 'mouseenter';
		} else {
			modClicTouch = clicTouch;
		}

		$('body').on(modClicTouch, '.close', function() {
			$("#sb-container").fadeOut();
			$('body').removeClass('noscroll');
		});
	});

{/literal}
</script>
