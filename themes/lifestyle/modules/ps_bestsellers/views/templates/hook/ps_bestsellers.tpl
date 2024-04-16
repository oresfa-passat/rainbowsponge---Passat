{*
* 2007-2017 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
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
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2017 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<section class="featured-products clearfix">
	<div class="clearfix">
		<h2 class="headings headings-medium products-section-title">
			{l s='Best Sellers' d='Shop.Theme.Catalog'}
		</h2>
		<a class="headings headings-small all-product-link text-uppercase custom-link-color" href="{$allBestSellers}">
			{l s='All best sellers' d='Shop.Theme.Catalog'}
		</a>
	</div>
	<div class="products {if isset($page) && isset($page.page_name) && $page.page_name == 'index' || $page.page_name == 'product' || $page.page_name == 'order-confirmation' || $page.page_name == 'cart' || $page.page_name == 'pagenotfound'}{if count($products) > 3}products-slider{/if}{/if}">
		{foreach from=$products item="product"}
			{include file="catalog/_partials/miniatures/product.tpl" product=$product}
		{/foreach}
	</div>
</section>
