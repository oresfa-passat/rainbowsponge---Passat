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

{block name='product_miniature_item'}
	<article class="product-miniature js-product-miniature" data-id-product="{$product.id_product}" data-id-product-attribute="{$product.id_product_attribute}" itemscope itemtype="http://schema.org/Product">
		<div class="thumbnail-container">
			{block name='product_thumbnail'}
				{if $product.cover}
					<a href="{$product.url}" class="thumbnail product-thumbnail">
						<img
							src = "{$product.cover.bySize.home_default.url}"
							alt = "{if !empty($product.cover.legend)}{$product.cover.legend}{else}{$product.name|truncate:30:'...'}{/if}"
							data-full-size-image-url = "{$product.cover.large.url}"
						>
					</a>
				{else}
					<a href="{$product.url}" class="thumbnail product-thumbnail">
						<img
							src = "{$urls.no_picture_image.bySize.home_default.url}"
						>
					</a>
				{/if}
			{/block}

			<div class="product-description">
				{block name='product_name'}
					<div class="product-miniature-info">
						{if $page.page_name == 'index'}
							<h3 class="headings headings-small text-uppercase product-title" itemprop="name">
								<a href="{$product.url}" class="custom-link-color">{$product.name}</a>
							</h3>
						{else}
							<h2 class="headings headings-small text-uppercase product-title" itemprop="name">
								<a href="{$product.url}" class="custom-link-color">{$product.name}</a>
							</h2>
						{/if}
					</div>
				{/block}

				{block name='product_price_and_shipping'}
					{if $product.show_price}
						<div class="product-price-and-shipping {if $product.discount_type === 'percentage' || $product.discount_type === 'amount'}price-with-discount{/if} pull-md-right pull-xs-left" itemprop="offers" itemscope itemtype="https://schema.org/Offer">

							{hook h='displayProductPriceBlock' product=$product type="before_price"}

							<meta itemprop="priceCurrency" content="{$currency.iso_code}">
							<span class="sr-only" class="regular-text default-text bold price">{l s='Price' d='Shop.Theme.Catalog'}</span>
							<span itemprop="price" class="regular-text default-text bold price {if $product.discount_type === 'percentage'}price-with-discount{/if}" content="{$product.price_amount}">{$product.price}</span>

							{hook h='displayProductPriceBlock' product=$product type='unit_price'}

							{hook h='displayProductPriceBlock' product=$product type='weight'}
							
							{if $product.has_discount}
								{hook h='displayProductPriceBlock' product=$product type="old_price"}

									<span class="sr-only" class="regular-text regular-price">{l s='Regular price' d='Shop.Theme.Catalog'}</span>
									<span class="regular-text regular-price text-uppercase">{$product.regular_price}</span>
									{if $product.discount_type === 'percentage'}
										<span class="regular-text discount-percentage discount-product text-uppercase">{$product.discount_percentage}</span>
									{elseif $product.discount_type === 'amount'}
										<span class="regular-text discount-amount discount-product text-uppercase">{$product.discount_amount_to_display}</span>
									{/if}
							{/if}
						</div>
					{/if}
				{/block}

				{block name='product_reviews'}
					{hook h='displayProductListReviews' product=$product}
				{/block}
			</div>

			{block name='product_flags'}
				<ul class="product-flags">
					{foreach from=$product.flags item=flag}
						<li class="{$flag.type}">{$flag.label}</li>
					{/foreach}
				</ul>
			{/block}

			<div class="highlighted-informations{if !$product.main_variants} no-variants{/if} hidden-sm-down">
				{block name='quick_view'}
					<a class="small-text quick-view text-uppercase" href="#" data-link-action="quickview">
						{l s='Quick view' d='Shop.Theme.Actions'}
					</a>
				{/block}
			</div>

	</article>
{/block}

