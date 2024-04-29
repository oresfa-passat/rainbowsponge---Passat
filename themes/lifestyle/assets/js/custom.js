/*
 * Custom code goes here.
 * A template should always ship with an empty custom.js
 */

$( document ).ready(function() {
    // Verify Step 1 - Information personal exist
    if ($('#checkout-personal-information-step').length) {
        // Add placeholder on input in form customer
        $(".form-control[type=password]").attr("placeholder", "Mot de passe");

        // Change icon svg when toggle password
        if ($('.btn-icon-password').length) {
            $('.btn-icon-password').append('<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24.127" height="14.324" viewBox="0 0 24.127 14.324"><g id="Groupe_440" data-name="Groupe 440" clip-path="url(#clip-path)"><path id="Tracé_146" data-name="Tracé 146" d="M12.063,5.008A2.153,2.153,0,1,1,9.909,7.162" transform="translate(0 0)" fill="none" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="1"/><path id="Tracé_147" data-name="Tracé 147" d="M16,7.162a3.933,3.933,0,1,1-3.933-3.933A3.933,3.933,0,0,1,16,7.162Z" transform="translate(0 0)" fill="none" stroke="#fff" stroke-miterlimit="10" stroke-width="1"/><path id="Tracé_148" data-name="Tracé 148" d="M23.5,7.162s-5.119,6.662-11.433,6.662S.63,7.162.63,7.162,5.749.5,12.063.5,23.5,7.162,23.5,7.162Z" transform="translate(0 0)" fill="none" stroke="#fff" stroke-miterlimit="10" stroke-width="1"/></g></svg>');
            $('.btn-icon-password').click(function(){
                if ($('.js-visible-password').attr('type') === 'text') {
                    $('.btn-icon-password svg').remove();
                    $('.btn-icon-password').append('<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24.765" height="15.848" viewBox="0 0 24.765 15.848"><g id="No-eye" transform="translate(0 0.424)"><g id="Groupe_1491" data-name="Groupe 1491" transform="translate(0 0.364)" clip-path="url(#clip-path)"><path id="Tracé_467" data-name="Tracé 467" d="M12.063,5.008A2.153,2.153,0,1,1,9.909,7.162" transform="translate(0 0)" fill="none" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="1"/><path id="Tracé_468" data-name="Tracé 468" d="M16,7.162a3.933,3.933,0,1,1-3.933-3.933A3.933,3.933,0,0,1,16,7.162Z" transform="translate(0 0)" fill="none" stroke="#fff" stroke-miterlimit="10" stroke-width="1"/><path id="Tracé_469" data-name="Tracé 469" d="M23.5,7.162s-5.119,6.662-11.433,6.662S.63,7.162.63,7.162,5.749.5,12.063.5,23.5,7.162,23.5,7.162Z" transform="translate(0 0)" fill="none" stroke="#fff" stroke-miterlimit="10" stroke-width="1"/></g><line id="Ligne_43" data-name="Ligne 43" y1="15" x2="24" transform="translate(0.5)" fill="none" stroke="#fff" stroke-width="1"/></g></svg>');
                } else if ($('.js-visible-password').attr('type') === 'password') {
                    $('.btn-icon-password svg').remove();
                    $('.btn-icon-password').append('<svg xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="24.127" height="14.324" viewBox="0 0 24.127 14.324"><g id="Groupe_440" data-name="Groupe 440" clip-path="url(#clip-path)"><path id="Tracé_146" data-name="Tracé 146" d="M12.063,5.008A2.153,2.153,0,1,1,9.909,7.162" transform="translate(0 0)" fill="none" stroke="#fff" stroke-linecap="round" stroke-linejoin="round" stroke-width="1"/><path id="Tracé_147" data-name="Tracé 147" d="M16,7.162a3.933,3.933,0,1,1-3.933-3.933A3.933,3.933,0,0,1,16,7.162Z" transform="translate(0 0)" fill="none" stroke="#fff" stroke-miterlimit="10" stroke-width="1"/><path id="Tracé_148" data-name="Tracé 148" d="M23.5,7.162s-5.119,6.662-11.433,6.662S.63,7.162.63,7.162,5.749.5,12.063.5,23.5,7.162,23.5,7.162Z" transform="translate(0 0)" fill="none" stroke="#fff" stroke-miterlimit="10" stroke-width="1"/></g></svg>');
                }
            });
        }

        // Display form for creation account in checkout step 1
        $('.go-create-account a.nav-link').click(function(){
            $('#checkout-login-form').toggleClass('active');
            $('#checkout-create-account-form').toggleClass('active');
        });

        $('#checkout-create-account-form a.nav-link').click(function(){
            $('#checkout-login-form').toggleClass('active');
            if ($('#checkout-create-account-form').hasClass('active')) {
                $('#checkout-create-account-form').toggleClass('active');
            }
        });

        $('#checkout-create-account-form button.continue').click(function(){
            localStorage.setItem("creation-form", "active"); // Set creation form active in key LocalStorage
            localStorage.setItem("guest-form", "inactive"); // Set guest form inactive in key LocalStorage
        });

        if ($('#checkout-create-account-form .form-group.has-error').length) {
            if (localStorage.getItem("creation-form") === 'active') {
                $('.go-create-account a.nav-link').trigger('click');
            }
        }

        // Set required or not for the password input in customer form
        $('#checkout-create-account-form #customer-form .form-group-password .form-control-label').text("Mot de passe *");
        $('#checkout-create-account-form #customer-form .form-group-password .form-control-comment').remove();
        $('#checkout-create-account-form #customer-form .form-group-password input').prop("required", true);

        // Delete the field password in form guest account 
        $('#checkout-guest-form .form-group-password').remove();

        // Display form for guest account in checkout step 1
        $('.go-guest-account a.nav-link').click(function(){
            $('#checkout-login-form').toggleClass('active');
            $('#checkout-guest-form').toggleClass('active');
        });

        $('#checkout-guest-form a.nav-link').click(function(){
            $('#checkout-login-form').toggleClass('active');
            if ($('#checkout-guest-form').hasClass('active')) {
                $('#checkout-guest-form').toggleClass('active');
            }
        });

        $('#checkout-guest-form button.continue').click(function(){
            localStorage.setItem("guest-form", "active"); // Set guest form active in key LocalStorage
            localStorage.setItem("creation-form", "inactive"); // Set creation form inactive in key LocalStorage
        });

        if ($('#checkout-guest-form .form-group.has-error').length) {
            if (localStorage.getItem("guest-form") === 'active') {
                $('.go-guest-account a.nav-link').trigger('click');
            }
        }
    }
});