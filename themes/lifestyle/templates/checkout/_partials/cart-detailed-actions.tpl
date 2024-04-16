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

{block name='cart_detailed_actions'}
	<div class="checkout cart-detailed-actions">
		{if $cart.minimalPurchaseRequired}
			<div class="alert alert-warning" role="alert">
				<div class="content-help-info">
					{$cart.minimalPurchaseRequired}
				</div>
			</div>
			<div class="text-xs-center">
				<button type="button" class="btn btn-small btn-disabled custom-button" disabled>{l s='Checkout' d='Shop.Theme.Actions'}</button>
			</div>
		{elseif empty($cart.products)}
			<div class="text-xs-center">
				<button type="button" class="btn btn-small btn-disabled custom-button" disabled>{l s='Checkout' d='Shop.Theme.Actions'}</button>
			</div>
		{else}
			<div class="text-xs-center">
				<a href="{$urls.pages.order}" class="btn btn-small custom-button">{l s='Checkout' d='Shop.Theme.Actions'}</a>
				{hook h='displayExpressCheckout'}
			</div>
		{/if}
	</div>
{/block}