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

{block name='customer_form'}

	{block name='customer_form_errors'}
		{include file='_partials/form-errors.tpl' errors=$errors['']}
	{/block}
	<div class="{if isset($page) && isset($page.page_name) && $page.page_name == 'authentication' || $page.page_name == 'identity'}col-md-6 col-xs-12 push-md-3 push-xs-0{else}col-xs-12{/if}">
		<form action="{block name='customer_form_actionurl'}{$action}{/block}" id="customer-form" class="js-customer-form" method="post">
			<section>
				{block "form_fields"}
					{foreach from=$formFields item="field"}
						{block "form_field"}
							{form_field field=$field}
						{/block}
					{/foreach}
					{$hook_create_account_form nofilter}
				{/block}
			</section>

			{block name='customer_form_footer'}
				<footer class="form-footer {if isset($page) && isset($page.page_name) && $page.page_name == 'authentication' || $page.page_name == 'identity'}text-xs-center{/if} clearfix">
					<input type="hidden" name="submitCreate" value="1">
					{block "form_buttons"}
						<button class="btn btn-small custom-button form-control-submit" data-link-action="save-customer" type="submit">
							{l s='Save' d='Shop.Theme.Actions'}
						</button>
					{/block}
				</footer>
			{/block}

		</form>
	</div>
{/block}
