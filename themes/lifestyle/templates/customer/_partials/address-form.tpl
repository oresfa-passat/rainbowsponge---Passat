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
{block name="address_form"}
	<div class="{if isset($page) && isset($page.page_name) && $page.page_name == 'addresses' || $page.page_name == 'address'}col-md-6 col-xs-12 push-md-3 push-xs-0{else}col-xs-12{/if}">
		<div class="js-address-form">
		{include file='_partials/form-errors.tpl' errors=$errors['']}

			<form
			method="POST"
			action="{url entity='address' params=['id_address' => $id_address]}"
			data-id-address="{$id_address}"
			data-refresh-url="{url entity='address' params=['ajax' => 1, 'action' => 'addressForm']}"
			>

				{block name="address_form_fields"}
					<section class="form-fields">
						{block name='form_fields'}
							{foreach from=$formFields item="field"}
								{block name='form_field'}
									{form_field field=$field}
								{/block}
							{/foreach}
						{/block}
					</section>
				{/block}

				{block name="address_form_footer"}
					<footer class="form-footer text-xs-center clearfix">
						<input type="hidden" name="submitAddress" value="1">
						{block name='form_buttons'}
							<button class="btn btn-small custom-button" type="submit" class="form-control-submit">
								{l s='Save' d='Shop.Theme.Actions'}
							</button>
						{/block}
					</footer>
				{/block}

			</form>
		</div>
	</div>
{/block}
