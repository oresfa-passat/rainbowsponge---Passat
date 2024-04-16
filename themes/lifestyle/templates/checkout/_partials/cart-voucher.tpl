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

{if $cart.vouchers.allowed}
	{block name='cart_voucher'}
		<div class="block-promo">
			<div class="cart-voucher">
				{if $cart.vouchers.added}
					{block name='cart_voucher_list'}
						<ul class="promo-name">
							{foreach from=$cart.vouchers.added item=voucher}
								<li class="cart-summary-line">
									<span class="regular-text default-text">{$voucher.name}</span>
									<a class="regular-text custom-link-color" href="{$voucher.delete_url}" data-link-action="remove-voucher">
										<i class="fa fa-trash"></i>
									</a>
									<div class="pull-xs-right">
										<span class="regular-text default-text bold value">{$voucher.reduction_formatted}</span>
									</div>
								</li>
							{/foreach}
						</ul>
					{/block}
				{/if}

				<a class="regular-text custom-link-color collapse-button promo-code-button" data-toggle="collapse" href="#promo-code" aria-expanded="false" aria-controls="promo-code">
					{l s='Have a promo code?' d='Shop.Theme.Checkout'}
				</a>

				<div class="promo-code collapse{if $cart.discounts|count > 0} in{/if} clearfix" id="promo-code">
					{block name='cart_voucher_form'}
						<form class="clearfix" action="{$urls.pages.cart}" data-link-action="add-voucher" method="post">
							<input type="hidden" name="token" value="{$static_token}">
							<input type="hidden" name="addDiscount" value="1">
							<input class="form-control promo-input" type="text" name="discount_name" placeholder="{l s='Promo code' d='Shop.Theme.Checkout'}">
							<button type="submit" class="btn btn-small custom-button">
								{l s='Add' d='Shop.Theme.Actions'}
							</button>
						</form>
					{/block}

					{block name='cart_voucher_notifications'}
						<div class="alert alert-danger js-error" role="alert">
							<div class="content-help-info">
								<span class="m-l-1 js-error-text"></span>
							</div>
						</div>
					{/block}
				</div>

				{if $cart.discounts|count > 0}
					<p class="regular-text default-text bold block-promo promo-highlighted">
						{l s='Take advantage of our exclusive offers:' d='Shop.Theme.Actions'}
					</p>
					<ul class="js-discount promo-discounts">
						{foreach from=$cart.discounts item=discount}
							<li class="cart-summary-line">
								<span class="regular-text default-text">
									<span class="custom-main-text-color code">{$discount.code}</span> - {$discount.name}
								</span>
							</li>
						{/foreach}
					</ul>
				{/if}
			</div>
		</div>
	{/block}
{/if}
