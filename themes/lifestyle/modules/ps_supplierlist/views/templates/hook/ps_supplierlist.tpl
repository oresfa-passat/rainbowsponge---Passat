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

<div id="search_filters_suppliers">
	<section class="facet">
		<div class="navbar-toggler collapse-icons" data-toggle="collapse" data-target="#collapse-supplier" aria-expanded="true">
			<i class="fa fa-plus add"></i>
			<i class="fa fa-minus remove"></i>
		</div>
		<h1 class="headings headings-small text-uppercase facet-label">
			{if $display_link_supplier}<a href="{$page_link}" title="{l s='Suppliers' d='Shop.Theme.Catalog'}" class="custom-link-color">{/if}
				{l s='Suppliers' d='Shop.Theme.Catalog'}
			{if $display_link_supplier}</a>{/if}
		</h1>
		<div class="collapse in" id="collapse-supplier">
		{if $suppliers}
			{include file="module:ps_supplierlist/views/templates/_partials/$supplier_display_type.tpl" suppliers=$suppliers}
		{else}
			<p class="regular-text default-text">{l s='No supplier' d='Shop.Theme.Catalog'}</p>
		{/if}
		</div>
	</section>
</div>
