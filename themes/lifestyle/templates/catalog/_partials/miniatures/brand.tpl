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

{block name='brand_miniature_item'}
	<li class="brand">
		<div class="brand-img">
			<a href="{$brand.url}"><img src="{$brand.image}" alt="{$brand.name}"></a>
		</div>
		<div class="regular-text default-text brand-infos">
			<p>
				<a class="regular-text bold custom-link-color" href="{$brand.url}">
					{$brand.name}
				</a>
			</p>
			{$brand.text nofilter}
		</div>
		<div class="brand-products">
			<a class="regular-text custom-link-color" href="{$brand.url}">
				{$brand.nb_products}
			</a>
			<a class="regular-text custom-link-color pull-right" href="{$brand.url}">
				{l s='View products' d='Shop.Theme.Actions'} <i class="fa fa-chevron-right"></i>
			</a>
		</div>
	</li>
{/block}
