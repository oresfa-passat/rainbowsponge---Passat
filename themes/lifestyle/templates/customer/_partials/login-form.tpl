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

{block name='login_form'}

{block name='login_form_errors'}
	{include file='_partials/form-errors.tpl' errors=$errors['']}
{/block}

<div class="{if isset($page) && isset($page.page_name) && $page.page_name == 'checkout'}col-md-8 push-md-2{else}col-md-6 push-md-3{/if} col-xs-12 push-xs-0">
	<form id="login-form" action="{block name='login_form_actionurl'}{$action}{/block}" method="post">
		<section>
			{block name='login_form_fields'}
				{foreach from=$formFields item="field"}
					{block name='form_field'}
						{form_field field=$field}
					{/block}
				{/foreach}
			{/block}
			<div class="forgot-password">
				<a class="small-text custom-link-color" href="{$urls.pages.password}" rel="nofollow">
					{l s='Forgot your password?' d='Shop.Theme.Customeraccount'}
				</a>
			</div>
		</section>

		{block name='login_form_footer'}
			<footer class="form-footer text-xs-center clearfix">
				<input type="hidden" name="submitLogin" value="1">
				{block name='form_buttons'}
					<button class="btn btn-small custom-button" data-link-action="sign-in" type="submit" class="form-control-submit">
						{l s='Sign in' d='Shop.Theme.Actions'}
					</button>
				{/block}
			</footer>
		{/block}
	</form>
</div>
{/block}
