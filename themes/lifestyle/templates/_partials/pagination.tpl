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

<nav class="pagination">
	<div class="col-md-4">
		{block name='pagination_summary'}
		<p class="regular-text default-text">
			{l s='Showing %from%-%to% of %total% item(s)' d='Shop.Theme.Catalog' sprintf=['%from%' => $pagination.items_shown_from ,'%to%' => $pagination.items_shown_to, '%total%' => $pagination.total_items]}
		</p>
		{/block}
	</div>

	<div class="col-md-6">
		{block name='pagination_page_list'}
			{if $pagination.should_be_displayed}
				<ul class="page-list clearfix text-xs-center">
					{foreach from=$pagination.pages item="page"}
						<li {if $page.current} class="current" {/if}>
							{if $page.type === 'spacer'}
								<span class="spacer">&hellip;</span>
							{else}
								<a
								rel="{if $page.type === 'previous'}prev{elseif $page.type === 'next'}next{else}nofollow{/if}"
								href="{$page.url}"
								class="{if $page.type === 'previous'}previous {elseif $page.type === 'next'}next {/if}{['disabled' => !$page.clickable, 'js-search-link' => true]|classnames} regular-text custom-link-color"
								>
									{if $page.type === 'previous'}
										<i class="fa fa-chevron-left"></i>{l s='Previous' d='Shop.Theme.Actions'}
									{elseif $page.type === 'next'}
										{l s='Next' d='Shop.Theme.Actions'}<i class="fa fa-chevron-right"></i>
									{else}
										{$page.page}
									{/if}
								</a>
							{/if}
						</li>
					{/foreach}
				</ul>
			{/if}
		{/block}
	</div>

</nav>
