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
{block name='cart_summary_product_line'}
	<div class="media-left">
		<a href="{$product.url}" title="{$product.name}">
			<img class="media-object" src="{$product.cover.small.url}" alt="{$product.name}">
		</a>
	</div>
	<div class="media-body">
		<span class="regular-text default-text product-name">{$product.name}</span>
		<span class="regular-text default-text product-quantity">x{$product.quantity}</span>
		<span class="regular-text default-text bold product-price pull-xs-right">{$product.price}</span>
		{hook h='displayProductPriceBlock' product=$product type="unit_price"}
		{foreach from=$product.attributes key="attribute" item="value"}
			<div class="product-line-info product-line-info-secondary text-muted">
				<span class="regular-text default-text label">{$attribute}:</span>
				<span class="regular-text default-text value">{$value}</span>
			</div>
		{/foreach}
	</div>
{/block}
