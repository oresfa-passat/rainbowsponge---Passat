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
<nav data-depth="{$breadcrumb.count}" class="breadcrumb hidden-sm-down">
	<ol itemscope itemtype="http://schema.org/BreadcrumbList">
		{block name='breadcrumb'}
			{foreach from=$breadcrumb.links item=path name=breadcrumb}
				{block name='breadcrumb_item'}
					<li itemprop="itemListElement" itemscope itemtype="http://schema.org/ListItem">
						<a itemprop="item" href="{$path.url}" class="small-text custom-link-color text-uppercase bold">
							<span itemprop="name" class="small-text">{$path.title}</span>
						</a>
						<meta itemprop="position" content="{$smarty.foreach.breadcrumb.iteration}">
					</li>
				{/block}
			{/foreach}
		{/block}
	</ol>
</nav>
