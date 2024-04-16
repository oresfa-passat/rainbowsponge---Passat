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

<div id="search_filters">

	{block name='facets_clearall_button'}
		<div id="_desktop_search_filters_clear_all" class="hidden-sm-down clear-all-wrapper">
			<button data-search-url="{$clear_all_link}" class="btn btn-small btn-ghost js-search-filters-clear-all">
				<i class="fa fa-remove"></i>
				{l s='Clear all' d='Shop.Theme.Actions'}
			</button>
		</div>
	{/block}

	{foreach from=$facets item="facet"}
		{if $facet.displayed}
			<section class="facet clearfix">
				{assign var=_expand_id value=10|mt_rand:100000}
				{assign var=_collapse value=true}
				<p class="headings headings-small text-uppercase facet-title hidden-sm-down">{$facet.label}</p>
				<div class="navbar-toggler collapse-icons hidden-sm-down" data-toggle="collapse" data-target="#facet_{$_expand_id}" aria-expanded="true">
					<i class="fa fa-plus add"></i>
					<i class="fa fa-minus remove"></i>
				</div>
				{foreach from=$facet.filters item="filter"}
					{if $filter.active}{assign var=_collapse value=false}{/if}
				{/foreach}
				<div class="title hidden-md-up" data-target="#facet_{$_expand_id}" data-toggle="collapse"{if !$_collapse} aria-expanded="true"{/if}>
					<p class="headings headings-small text-uppercase facet-title">{$facet.label}</p>
					<span class="pull-xs-right">
						<span class="navbar-toggler collapse-icons">
							<i class="fa fa-plus add"></i>
							<i class="fa fa-minus remove"></i>
						</span>
					</span>
				</div>

				{if $facet.widgetType !== 'dropdown'}

					{block name='facet_item_other'}
						<ul id="facet_{$_expand_id}" class="collapse in" aria-expanded="true">
							{foreach from=$facet.filters item="filter"}
								{if $filter.displayed}
									<li {if isset($filter.properties.color) && isset($filter.properties.color)}class="facet-colors {if $facet.multipleSelectionAllowed}facet-colors-checkbox{else}facet-colors-radio{/if}"{/if}>
										<label class="facet-label{if $filter.active} active {/if}">
											{if $facet.multipleSelectionAllowed}
												<span class="custom-checkbox">
													<input data-search-url="{$filter.nextEncodedFacetsURL}" type="checkbox" {if $filter.active } checked {/if}>
													{if isset($filter.properties.color)}
														<span class="color" style="background-color:{$filter.properties.color}"></span>
													{elseif isset($filter.properties.texture)}
														<span class="color texture" style="background-image:url({$filter.properties.texture})"></span>
													{else}
														<span class="custom-checkbox-checked{if !$js_enabled} ps-shown-by-js{/if}"><i class="fa fa-check checkbox-checked"></i></span>
													{/if}
												</span>
											{else}
												<span class="custom-radio">
													<input
													data-search-url="{$filter.nextEncodedFacetsURL}"
													type="radio"
													name="filter {$facet.label}"
													{if $filter.active } checked {/if}
													>
													<span {if !$js_enabled} class="ps-shown-by-js" {/if}></span>
												</span>
											{/if}
											<a
											href="{$filter.nextEncodedFacetsURL}"
											class="_gray-darker search-link js-search-link custom-link-color {if $facet.multipleSelectionAllowed}checkbox-link{else}radio-link{/if}"
											rel="nofollow"
											>
												{$filter.label}
												{if $filter.magnitude}
													<span class="magnitude">({$filter.magnitude})</span>
												{/if}
											</a>
										</label>
									</li>
								{/if}
							{/foreach}
						</ul>
					{/block}

				{else}

					{block name='facet_item_dropdown'}
						<ul id="facet_{$_expand_id}" class="collapse in" aria-expanded="true">
							<li>
								<div class="col-sm-12 col-xs-12 col-md-12 facet-dropdown dropdown">
									<a class="select-title" rel="nofollow" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
										{$active_found = false}
										<span class="regular-text default-text">
											{foreach from=$facet.filters item="filter"}
												{if $filter.active}
													{$filter.label}
													{if $filter.magnitude}
														({$filter.magnitude})
													{/if}
													{$active_found = true}
												{/if}
											{/foreach}
											{if !$active_found}
												{l s='(no filter)' d='Shop.Theme.Global'}
											{/if}
										</span>
										<i class="fa fa-caret-down pull-xs-right"></i>
									</a>
									<div class="dropdown-menu">
										{foreach from=$facet.filters item="filter"}
											{if !$filter.active}
												<a
												rel="nofollow"
												href="{$filter.nextEncodedFacetsURL}"
												class="regular-text select-list"
												>
													{$filter.label}
													{if $filter.magnitude}
														({$filter.magnitude})
													{/if}
												</a>
											{/if}
										{/foreach}
									</div>
								</div>
							</li>
						</ul>
					{/block}

				{/if}
			</section>
		{/if}
	{/foreach}
</div>
