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

{extends file=$layout}

{block name='head_seo' prepend}
	<link rel="canonical" href="{$product.canonical_url}">
{/block}

{block name='head' append}
	<meta property="og:type" content="product">
	<meta property="og:url" content="{$urls.current_url}">
	<meta property="og:title" content="{$page.meta.title}">
	<meta property="og:site_name" content="{$shop.name}">
	<meta property="og:description" content="{$page.meta.description}">
	<meta property="og:image" content="{$product.cover.large.url}">
	<meta property="product:pretax_price:amount" content="{$product.price_tax_exc}">
	<meta property="product:pretax_price:currency" content="{$currency.iso_code}">
	<meta property="product:price:amount" content="{$product.price_amount}">
	<meta property="product:price:currency" content="{$currency.iso_code}">
	{if isset($product.weight) && ($product.weight != 0)}
		<meta property="product:weight:value" content="{$product.weight}">
		<meta property="product:weight:units" content="{$product.weight_unit}">
	{/if}
{/block}

{block name='content'}

	<section id="main" itemscope itemtype="https://schema.org/Product">
		<meta itemprop="url" content="{$product.url}">

		<div class="col-xs-12">
			<div class="row">
				<div class="col-md-6">
					{block name='page_content_container'}
						<section class="page-content" id="content">
							{block name='page_content'}
								{block name='product_flags'}
									<ul class="product-flags hidden-sm-down">
										{foreach from=$product.flags item=flag}
											<li class="product-flag {$flag.type}">{$flag.label}</li>
										{/foreach}
									</ul>
								{/block}

							{block name='product_cover_tumbnails'}
								{include file='catalog/_partials/product-cover-thumbnails.tpl'}
							{/block}
							<div class="scroll-box-arrows">
								<i class="fa fa-chevron-left left"></i>
								<i class="fa fa-chevron-right right"></i>
							</div>

							{/block}
						</section>
					{/block}
				</div>

				<div class="col-md-6">
					{block name='page_header_container'}
						{block name='page_header'}
							<p class="headings headings-large" itemprop="name">{block name='page_title'}{$product.name}{/block}</p>
						{/block}
					{/block}
					{block name='product_prices'}
						{include file='catalog/_partials/product-prices.tpl'}
					{/block}

					<div class="product-information">
						{block name='product_description_short'}
							<div id="product-description-short-{$product.id}" class="product-description-short" itemprop="description">
								{$product.description_short nofilter}
							</div>
						{/block}

						<a href="#description" class="read-more-description underline custom-link-color">{l s='Read more' d='Shop.Theme.Lifestyle'}</a>

						{if $product.is_customizable && count($product.customizations.fields)}
							{block name='product_customization'}
								{include file="catalog/_partials/product-customization.tpl" customizations=$product.customizations}
							{/block}
						{/if}

						<div class="product-actions">
							{block name='product_buy'}
								<form action="{$urls.pages.cart}" method="post" id="add-to-cart-or-refresh">
									<input type="hidden" name="token" value="{$static_token}">
									<input type="hidden" name="id_product" value="{$product.id}" id="product_page_product_id">
									<input type="hidden" name="id_customization" value="{$product.id_customization}" id="product_customization_id">

									{block name='product_variants'}
										{include file='catalog/_partials/product-variants.tpl'}
									{/block}

									{block name='product_pack'}
										{if $packItems}
											<section class="product-pack">
												<span class="regular-text small-text text-uppercase bold control-label">{l s='This pack contains' d='Shop.Theme.Catalog'}</span>
												{foreach from=$packItems item="product_pack"}
													{block name='product_miniature'}
														{include file='catalog/_partials/miniatures/pack-product.tpl' product=$product_pack}
													{/block}
												{/foreach}
											</section>
										{/if}
									{/block}

									{block name='product_discounts'}
										{include file='catalog/_partials/product-discounts.tpl'}
									{/block}

									{block name='product_add_to_cart'}
										{include file='catalog/_partials/product-add-to-cart.tpl'}
									{/block}

									{block name='product_additional_info'}
										{include file='catalog/_partials/product-additional-info.tpl'}
									{/block}

									{* Input to refresh product HTML removed, block kept for compatibility with themes *}
									{block name='product_refresh'}{/block}
								</form>
							{/block}

						</div>
					</div>
				</div>
			</div>
			<div class="row">
				{block name='product_tabs'}
					<div class="col-md-6">
						<div class="tabs">
							<ul class="nav nav-tabs">
								{if $product.description}
									<li class="nav-item">
										<a class="nav-link{if $product.description} active{/if}" data-toggle="tab" href="#description">
											{l s='Description' d='Shop.Theme.Catalog'}
										</a>
									</li>
								{/if}
								<li class="nav-item">
									<a class="nav-link{if !$product.description} active{/if}" data-toggle="tab" href="#product-details">
										{l s='Product Details' d='Shop.Theme.Catalog'}
									</a>
								</li>
								{if $product.attachments}
									<li class="nav-item">
										<a class="nav-link" data-toggle="tab" href="#attachments">
											{l s='Attachments' d='Shop.Theme.Catalog'}
										</a>
									</li>
								{/if}
								{foreach from=$product.extraContent item=extra key=extraKey}
									<li class="nav-item">
										<a class="nav-link" data-toggle="tab" href="#extra-{$extraKey}">{$extra.title}</a>
									</li>
								{/foreach}
								{hook h="displayProductTab"}
							</ul>

							<div class="tab-content" id="tab-content">
								<div class="tab-pane fade in{if $product.description} active{/if}" id="description">
									{block name='product_description'}
										<div class="regular-text highlight-text product-description">{$product.description nofilter}</div>
									{/block}
								</div>

								{block name='product_details'}
									{include file='catalog/_partials/product-details.tpl'}
								{/block}

								{block name='product_attachments'}
									{if $product.attachments}
										<div class="tab-pane fade in" id="attachments">
											<section class="product-attachments">
												<span class="regular-text small-text text-uppercase label">{l s='Download' d='Shop.Theme.Actions'}</span>
												{foreach from=$product.attachments item=attachment}
													<div class="attachment">
														<p class="regular-text default-text">
															<a class="regular-text custom-link-color" href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">{$attachment.name}</a>
														</p>
														<p class="regular-text default-text">{$attachment.description}</p>
														<a class="regular-text custom-link-color" href="{url entity='attachment' params=['id_attachment' => $attachment.id_attachment]}">
															{l s='Download' d='Shop.Theme.Actions'} ({$attachment.file_size_formatted})
														</a>
													</div>
												{/foreach}
											</section>
										</div>
									{/if}
								{/block}

								{foreach from=$product.extraContent item=extra key=extraKey}
									<div class="tab-pane fade in {$extra.attr.class}" id="extra-{$extraKey}" {foreach $extra.attr as $key => $val} {$key}="{$val}"{/foreach}>
										<div class="regular-text highlight-text">{$extra.content nofilter}</div>
									</div>
								{/foreach}
								{hook h="displayProductTabContent"}
							</div>
						</div>
					</div>
				{/block}
			</div>

			{block name='product_accessories'}
				{if $accessories}
					<section class="product-accessories clearfix">
						<div class="clearfix">
							<p class="headings headings-medium products-section-title">{l s='You might also like' d='Shop.Theme.Catalog'}</p>
						</div>
						<div class="products {if count($accessories) >= 3}products-slider{/if}">
							{foreach from=$accessories item="product_accessory"}
								{block name='product_miniature'}
									{include file='catalog/_partials/miniatures/product.tpl' product=$product_accessory}
								{/block}
							{/foreach}
						</div>
					</section>
				{/if}
			{/block}

			{block name='product_footer'}
				<div class="row">
					<div class="col-md-12 footerProduct clearfix">
						{hook h='displayFooterProduct' product=$product category=$category}
					</div>
				</div>
			{/block}

			{block name='product_images_modal'}
				{include file='catalog/_partials/product-images-modal.tpl'}
			{/block}

			{block name='page_footer_container'}
				<footer class="page-footer">
					{block name='page_footer'}
					<!-- Footer content -->
					{/block}
				</footer>
			{/block}
		</div>
	</section>

{/block}
