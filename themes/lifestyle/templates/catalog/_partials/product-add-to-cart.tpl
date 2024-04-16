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
<div class="product-add-to-cart">
	{if !$configuration.is_catalog}
		<span class="regular-text small-text text-uppercase bold control-label">{l s='Quantity' d='Shop.Theme.Catalog'}</span>

		{block name='product_quantity'}
			<div class="product-quantity clearfix">
				<div class="qty">
					<input
					type="text"
					name="qty"
					id="quantity_wanted"
					value="{$product.quantity_wanted}"
					class="input-group"
					min="{$product.minimal_quantity}"
					>
				</div>

				<div class="add">
					<button
					class="btn btn-medium custom-button add-to-cart"
					data-button-action="add-to-cart"
					type="submit"
					{if !$product.add_to_cart_url}
					disabled
					{/if}
					>
						<i class="fa fa-shopping-cart"></i>
						{l s='Add to cart' d='Shop.Theme.Actions'}
					</button>

					{block name='product_availability'}
						<p id="product-availability">
							{if $product.show_availability && $product.availability_message}
								{if $product.availability == 'available'}
									<i class="fa fa-check product-available"></i>
								{elseif $product.availability == 'last_remaining_items'}
									<i class="fa fa-warning product-last-items"></i>
								{else}
									<i class="fa fa-times-circle product-unavailable"></i>
								{/if}
								<span class="regular-text default-text bold {if $product.availability == 'available'}product-available{elseif $product.availability == 'last_remaining_items'}product-last-items{else}product-unavailable{/if}">{$product.availability_message}</span>
							{/if}
						</p>
					{/block}

				</div>
			</div>
			<div class="clearfix"></div>
		{/block}

		{block name='product_minimal_quantity'}
			<p class="regular-text default-text product-minimal-quantity">
				{if $product.minimal_quantity > 1}
					{l
					s='The minimum purchase order quantity for the product is %quantity%.'
					d='Shop.Theme.Checkout'
					sprintf=['%quantity%' => $product.minimal_quantity]
					}
				{/if}
			</p>
		{/block}
	{/if}
</div>
