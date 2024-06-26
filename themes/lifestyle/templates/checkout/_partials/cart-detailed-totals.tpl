
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

{block name='cart_detailed_totals'}
	<div class="cart-detailed-totals">

		<div class="card-block cart-subtotal-block">
			{foreach from=$cart.subtotals item="subtotal"}
				{if $subtotal.value && $subtotal.type !== 'tax'}
					<div class="cart-summary-line" id="cart-subtotal-{$subtotal.type}">
						<span class="regular-text default-text{if 'products' === $subtotal.type} js-subtotal{/if}">
							{if 'products' == $subtotal.type}
								{$cart.summary_string}
							{else}
								{$subtotal.label}
							{/if}
						</span>
						<span class="regular-text default-text bold value">{$subtotal.value}</span>
						{if $subtotal.type === 'shipping'}
							<div>
								<span class="small-text default-text value">
									{hook h='displayCheckoutSubtotalDetails' subtotal=$subtotal}
								</span>
							</div>
						{/if}
					</div>
				{/if}
			{/foreach}
		</div>

		{block name='cart_voucher'}
			{include file='checkout/_partials/cart-voucher.tpl'}
		{/block}

		<hr>

		<div class="card-block cart-total-block">
			<div class="cart-summary-line cart-total">
				<span class="regular-text default-text">{$cart.totals.total.label} {$cart.labels.tax_short}</span>
				<span class="regular-text default-text bold value">{$cart.totals.total.value}</span>
			</div>

			<div class="cart-summary-line">
				<span class="regular-text default-text">{$cart.subtotals.tax.label}</span>
				<span class="regular-text default-text bold value">{$cart.subtotals.tax.value}</span>
			</div>
		</div>

		<hr>
	</div>
{/block}
