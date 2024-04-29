{**
* 2007-2017 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Open Software License (OSL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/osl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2017 PrestaShop SA
* @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
* International Registered Trademark & Property of PrestaShop SA
*}

<!doctype html>
<html lang="{$language.iso_code}">

	<head>
		{block name='head'}
			{include file='_partials/head.tpl'}
		{/block}
	</head>

	<body id="{$page.page_name}" class="{$page.body_classes|classnames}">

		{block name='hook_after_body_opening_tag'}
			{hook h='displayAfterBodyOpeningTag'}
		{/block}

		<header id="header">
			{block name='header'}
				{include file='checkout/_partials/header.tpl'}
			{/block}
		</header>

		{block name='notifications'}
			{include file='_partials/notifications.tpl'}
		{/block}

		<section id="wrapper">
			<div class="container">

				{block name='content'}
					<section id="content">
						<div class="row">
							<div class="col-md-8">
								{block name='cart_summary'}
									{render file='checkout/checkout-process.tpl' ui=$checkout_process}
								{/block}
								{if $logged}
									<div class="section-step">
										{block name='cart_summary connected'}
											{render file='checkout/checkout-process.tpl' ui=$checkout_process}
										{/block}
									</div>
								{else}
									<div class="section-step no-connected">
										{block name='cart_summary'}
											{render file='checkout/checkout-process.tpl' ui=$checkout_process}
										{/block}
									</div>
								{/if}
							</div>
							<div class="col-md-4">
								{block name='cart_summary'}
									{include file='checkout/_partials/cart-summary.tpl' cart = $cart}
								{/block}
							</div>
						</div>
					</section>
				{/block}
			</div>
		</section>

		<footer id="footer">
			{include file='checkout/_partials/footer.tpl'}
		</footer>

		{block name='javascript_bottom'}
			{include file="_partials/javascript.tpl" javascript=$javascript.bottom}
		{/block}

		{block name='hook_before_body_closing_tag'}
			{hook h='displayBeforeBodyClosingTag'}
		{/block}

	</body>

</html>

<style>

#checkout-personal-information-step a:hover {
	color: #fff !important;
} 

#checkout-addresses-step,
#checkout-payment-step,
#checkout-delivery-step {
	display: none;
}

#checkout-addresses-step.active,
#checkout-payment-step.active,
#checkout-delivery-step.active {
	display: block;
}

#checkout-personal-information-step.-complete {
	display: none;
}

body#checkout section.checkout-step {
	padding: 30px 0;
	border: 1px solid #eee;
}

body#checkout section.checkout-step > .content {
	display: block !important;
}

#checkout #content > div.row {
    display: flex;
}

#checkout-personal-information-step #checkout-login-form > div.col-md-8 {
	float: none;
}

#checkout-personal-information-step .title-step-1 {
	text-align: center;
	font-size: 22px;
	font-weight: 701;
	color: #000;
}

#checkout-personal-information-step #login-form {
	margin-top: 35px;
}

#checkout-personal-information-step #login-form .forgot-password > a {
	color: #000;
	text-align: left;
	display: block;
	width: fit-content;
}

#checkout-personal-information-step #login-form .forgot-password > a:hover {
	color: #F39325 !important;
}

#checkout-personal-information-step #login-form .form-footer {
	display: flex;
	justify-content: space-between;
	align-items: center;
}

#checkout-personal-information-step #login-form .form-footer .forgot-password {
	width: 50%;
}

#checkout-personal-information-step #login-form .form-footer button {
	width: 50%;
	background-color: #000 !important;
	padding: 13px 0;
	text-transform: initial;
	font-weight: 401;
	margin: 0;
	border: none !important;
	font-size: 14px;
}

#checkout-personal-information-step #login-form .form-footer button:hover {
	background-color: #F39325 !important;
}

#checkout-personal-information-step .go-create-account {
	background-color: #eee;
	padding: 20px;
	margin-top: 40px;
}

#checkout-personal-information-step .go-create-account h3 {
	font-size: 22px;
	text-transform: initial;
	color: #000;
	font-weight: 701;
}

#checkout-personal-information-step .go-create-account > div {
	display: flex;
	flex-direction: column;
	justify-content: center;
	align-items: center;
}

#checkout-personal-information-step .go-create-account > div > a {
	background-color: #f39325;
	color: #fff;
	border-radius: 50px;
	padding: 8px 50px;
	margin: 15px 0;
}

#checkout-personal-information-step .go-create-account > div > a:hover {
	background-color: #346d6f;
	color: #fff !important;
}

#checkout-personal-information-step .go-create-account > div > p {
	font-size: 11px;
	text-align: center;
	font-style: italic;
	color: #000;
}

#checkout-personal-information-step .go-guest-account {
	display: flex;
	flex-direction: column;
}

#checkout-personal-information-step .go-guest-account a {
	text-align: center;
	background-color: #000;
	color: #fff !important;
	width: fit-content;
	margin: 0 auto;
	padding: 10px 50px;
	border-radius: 50px;
}

#checkout-personal-information-step .go-guest-account a:hover {
	background-color: #f39325;
	color: #fff !important;
}

#checkout-personal-information-step .go-guest-account .bloc-line {
	margin: 15px 70px 30px 70px;
}

#checkout-personal-information-step #checkout-login-form {
	display: none;
}

#checkout-personal-information-step #checkout-login-form.active {
	display: block;
}

.bloc-links-connexion {
	display: flex;
	flex-direction: column;
	align-items: center;
	justify-content: center;
	margin: 30px 0 15px 0;
}

.bloc-links-connexion a.go-form-connexion {
	border: 1px solid #000;
	border-radius: 50px;
	padding: 5px 25px;
	display: flex;
	align-items: center;
	justify-content: center;
	color: #000; 
	height: 40px;
}

.bloc-links-connexion a.go-form-connexion:hover {
	background-color: #f39325;
	border: none;
	color: #fff !important;
}

.bloc-links-connexion a.go-form-connexion svg {
	margin-left: 10px;
	fill: #000;
}

.bloc-links-connexion a.go-form-connexion:hover svg {
	fill: #ffff;
}

#checkout-personal-information-step #checkout-create-account-form .form-footer button.continue {
	border: none !important;
	text-align: center;
	background-color: #000 !important;
	color: #fff !important;
	width: fit-content;
	margin: 20px auto 0 auto;
	padding: 12px 70px;
	float: none !important;
}

#checkout-personal-information-step #checkout-create-account-form .form-footer button.continue:hover {
	background-color: #f39325 !important;
}

#checkout-personal-information-step #checkout-guest-form .form-footer button.continue {
	border: none !important;
	text-align: center;
	background-color: #000 !important;
	color: #fff !important;
	width: fit-content;
	margin: 20px auto 0 auto;
	padding: 12px 70px;
	float: none !important;
}

#checkout-personal-information-step #checkout-guest-form .form-footer button.continue:hover {
	background-color: #f39325 !important;
}

</style>