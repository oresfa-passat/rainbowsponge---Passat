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

<div class="product-line-grid">
	<!--  product left content: image-->
	<div class="product-line-grid-left col-md-3 col-xs-4">
		<span class="product-image media-middle">
			<img src="{$product.cover.bySize.cart_default.url}" alt="{$product.name|escape:'quotes'}">
		</span>
	</div>

	<!--  product left body: description -->
	<div class="product-line-grid-body col-md-4 col-xs-8">
		<div class="product-line-info">
			<a class="regular-text custom-link-color label" href="{$product.url}" data-id_customization="{$product.id_customization|intval}">{$product.name}</a>
		</div>

		<div class="product-line-info product-price {if $product.has_discount}has-discount{/if}">
			{if $product.has_discount}
				<div class="product-discount">
					<span class="regular-text regular-price highlight-text linethrough">
						{$product.regular_price}
					</span>
					{if $product.discount_type === 'percentage'}
						<span class="discount custom-main-text-color bold">
							-{$product.discount_percentage_absolute}
						</span>
					{else}
						<span class="discount custom-main-text-color bold">
							-{$product.discount_to_display}
						</span>
					{/if}
				</div>
			{/if}
			<div class="current-price">
				<span class="regular-text">{$product.price}</span>
				{if $product.unit_price_full}
					<div class="unit-price-cart">
						<span class="small-text italic"> - {$product.unit_price_full}</span>
					</div>
				{/if}
			</div>
		</div>

		{foreach from=$product.attributes key="attribute" item="value"}
			<div class="product-line-info">
				<span class="regular-text default-text bold">{$attribute}:</span>
				<span class="regular-text default-text">{$value}</span>
			</div>
		{/foreach}

		{if $product.customizations|count}
			{block name='cart_detailed_product_line_customization'}
				{foreach from=$product.customizations item="customization"}
					<a class="regular-text custom-link-color" href="#" data-toggle="modal" data-target="#product-customizations-modal-{$customization.id_customization}">
						{l s='Product customization' d='Shop.Theme.Catalog'}
					</a>
					<div class="modal fade customization-modal" id="product-customizations-modal-{$customization.id_customization}" tabindex="-1" role="dialog" aria-hidden="true">
						<div class="modal-dialog" role="document">
							<div class="modal-content">
								<div class="modal-header">
									<button type="button" class="close" data-dismiss="modal" aria-label="Close">
										<span aria-hidden="true">
											<i class="fa fa-times"></i>
										</span>
									</button>
									<h4 class="headings headings-medium">{l s='Product customization' d='Shop.Theme.Catalog'}</h4>
								</div>
								<div class="modal-body clearfix">
									<div class="col-xs-12">
										{foreach from=$customization.fields item="field"}
											<div class="product-customization-line row">
												<div class="col-sm-3 col-xs-4 label">
													<span class="regular-text default-text">{$field.label}</span>
												</div>
												<div class="col-sm-9 col-xs-8 value">
													{if $field.type == 'text'}
														{if (int)$field.id_module}
															<span class="regular-text default-text">{$field.text nofilter}</span>
														{else}
															<span class="regular-text default-text">{$field.text}</span>
														{/if}
													{elseif $field.type == 'image'}
														<img src="{$field.image.small.url}">
													{/if}
												</div>
											</div>
										{/foreach}
									</div>
								</div>
							</div>
						</div>
					</div>
				{/foreach}
			{/block}
		{/if}
	</div>

	<!--  product left body: description -->
	<div class="product-line-grid-right product-line-actions col-md-5 col-xs-12">
		<div class="row">
			<div class="col-xs-4 hidden-md-up"></div>
			<div class="col-md-10 col-xs-10">
				<div class="row">
					<div class="col-md-6 col-xs-6 qty">
						{if isset($product.is_gift) && $product.is_gift}
							<span class="gift-quantity">{$product.quantity}</span>
						{else}
							<input
							class="js-cart-line-product-quantity"
							data-down-url="{$product.down_quantity_url}"
							data-up-url="{$product.up_quantity_url}"
							data-update-url="{$product.update_quantity_url}"
							data-product-id="{$product.id_product}"
							type="text"
							value="{$product.quantity}"
							name="product-quantity-spin"
							min="{$product.minimal_quantity}"
							/>
						{/if}
					</div>
					<div class="col-md-6 col-xs-6 price">
						<span class="product-price">
							<strong>
								{if isset($product.is_gift) && $product.is_gift}
									<span class="regular-text default-text gift">{l s='Gift' d='Shop.Theme.Checkout'}</span>
								{else}
									<span class="regular-text default-text">{$product.total}</span>
								{/if}
							</strong>
						</span>
					</div>
				</div>
			</div>
			<div class="col-md-2 col-xs-2">
				<div class="cart-line-product-actions">
					<a
					class = "regular-text custom-link-color remove-from-cart"
					rel = "nofollow"
					href = "{$product.remove_from_cart_url}"
					data-link-action = "delete-from-cart"
					data-id-product = "{$product.id_product|escape:'javascript'}"
					data-id-product-attribute = "{$product.id_product_attribute|escape:'javascript'}"
					data-id-customization = "{$product.id_customization|escape:'javascript'}"
					>
						{if !isset($product.is_gift) || !$product.is_gift}
							<i class="fa fa-trash pull-xs-left"></i>
						{/if}
					</a>

					{block name='hook_cart_extra_product_actions'}
						{hook h='displayCartExtraProductActions' product=$product}
					{/block}

				</div>
			</div>
		</div>
	</div>

	<div class="clearfix"></div>
</div>
