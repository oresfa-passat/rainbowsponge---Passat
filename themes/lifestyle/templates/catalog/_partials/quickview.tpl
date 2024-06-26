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

<div id="quickview-modal-{$product.id}-{$product.id_product_attribute}" class="modal fade quickview" tabindex="-1" role="dialog" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true">&times;</span>
				</button>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-6 col-sm-6">
						{block name='product_cover_tumbnails'}
							{include file='catalog/_partials/product-cover-thumbnails.tpl'}
						{/block}
						<div class="arrows js-arrows">
							<i class="fa fa-chevron-up arrow-up js-arrow-up"></i>
							<i class="fa fa-chevron-down arrow-down js-arrow-down"></i>
						</div>
					</div>
					<div class="col-md-6 col-sm-6">
						<h1 class="headings headings-large">{$product.name}</h1>
						{block name='product_prices'}
							{include file='catalog/_partials/product-prices.tpl'}
						{/block}
						{block name='product_description_short'}
							<div id="product-description-short" itemprop="description">{$product.description_short nofilter}</div>
						{/block}
						{block name='product_buy'}
							<div class="product-actions">
								<form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
									<input type="hidden" name="token" value="{$static_token}">
									<input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
									<input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">
									{block name='product_variants'}
										{include file='catalog/_partials/product-variants.tpl'}
									{/block}

									{block name='product_add_to_cart'}
										{include file='catalog/_partials/product-add-to-cart.tpl'}
									{/block}

									{* Input to refresh product HTML removed, block kept for compatibility with themes *}
									{block name='product_refresh'}{/block}
								</form>
							</div>
						{/block}
						<div class="product-additional-info">
							{hook h='displayProductAdditionalInfo' product=$product}
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
