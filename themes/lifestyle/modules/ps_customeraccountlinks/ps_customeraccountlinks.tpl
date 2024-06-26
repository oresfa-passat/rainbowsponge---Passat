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

<div id="block_myaccount_infos" class="col-md-2 links wrapper myaccount-info">
	<p class="headings headings-small hidden-sm-down">
		<a class="custom-link-color" href="{$urls.pages.my_account}" rel="nofollow">
			{l s='Your account' d='Shop.Theme.Customeraccount'}
		</a>
	</p>
	<div class="title clearfix hidden-md-up" data-target="#footer_account_list" data-toggle="collapse">
		<p class="headings headings-small">{l s='Your account' d='Shop.Theme.Customeraccount'}</p>
		<span class="pull-xs-left">
			<span class="navbar-toggler collapse-icons">
				<i class="fa fa-plus add"></i>
				<i class="fa fa-minus remove"></i>
			</span>
		</span>
	</div>
	<ul class="account-list collapse" id="footer_account_list">
		{foreach from=$my_account_urls item=my_account_url}
			<li>
				<a href="{$my_account_url.url}" title="{$my_account_url.title}" rel="nofollow" class="regular-text custom-link-color">
					{$my_account_url.title}
				</a>
			</li>
		{/foreach}
		{hook h='displayMyAccountBlock'}
	</ul>
</div>
