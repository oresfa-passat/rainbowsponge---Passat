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

{extends "customer/_partials/customer-form.tpl"}

{block name='customer_form'}
	{block name='customer_form_errors'}
		{include file='_partials/form-errors.tpl' errors=$errors['']}
	{/block}
	
	<div class="bloc-line">
		<p>J'ai un compte</p>
	</div>

	<div class="bloc-links-connexion">
		<a class="regular-text nav-link go-form-connexion {if $show_login_form}active{/if}" data-link-action="show-login-form" data-toggle="tab" href="#checkout-login-form" role="tab">
			Me connecter 
			<svg id="Mon_compte" xmlns="http://www.w3.org/2000/svg" xmlns:xlink="http://www.w3.org/1999/xlink" width="18.84" height="18" viewBox="0 0 18.84 18">
				<g id="Groupe_7" data-name="Groupe 7" clip-path="url(#clip-path)">
					<path id="Tracé_7" data-name="Tracé 7" d="M13.872,41.21a6.612,6.612,0,0,1-8.9,0A9.418,9.418,0,0,0,0,49.514H18.84a9.418,9.418,0,0,0-4.968-8.3" transform="translate(0 -31.513)"/>
					<path id="Tracé_8" data-name="Tracé 8" d="M29.217,4.808A4.808,4.808,0,1,1,24.41,0a4.808,4.808,0,0,1,4.808,4.808" transform="translate(-14.99 0)"/>
				</g>
			</svg>
		</a>	
	</div>

	<div class="bloc-line">
		<p>Poursuivre en invité</p>
	</div>

	<div class="{if isset($page) && isset($page.page_name) && $page.page_name == 'authentication' || $page.page_name == 'identity'}col-md-6 col-xs-12 push-md-3 push-xs-0{else}col-xs-12{/if}">
	<form action="{block name='customer_form_actionurl'}{$action}{/block}" id="customer-form" class="js-customer-form" method="post">
		<section>
			{block "form_fields"}
				{foreach from=$formFields item="field"}
					{block "form_field"}
						{form_field field=$field}
					{/block}
				{/foreach}
			{/block}
		</section>

		{block name='customer_form_footer'}
			<footer class="form-footer {if isset($page) && isset($page.page_name) && $page.page_name == 'authentication' || $page.page_name == 'identity'}text-xs-center{/if} clearfix">
				<input type="hidden" name="submitCreate" value="1">
				{block "form_buttons"}
						<button
							class="continue btn btn-small custom-button pull-xs-right"
							name="continue"
							data-link-action="register-new-customer"
							type="submit"
							value="1"
							>
								Suivant
						</button>
				{/block}
			</footer>
		{/block}

	</form>
	</div>
{/block}


{block "form_field"}
	{if $field.name === 'password' and $guest_allowed}
		{$smarty.block.parent}
	{else}
		{$smarty.block.parent}
	{/if}
{/block}

