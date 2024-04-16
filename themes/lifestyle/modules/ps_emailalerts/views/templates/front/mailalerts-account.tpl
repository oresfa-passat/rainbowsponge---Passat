{*
* 2007-2016 PrestaShop
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
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2015 PrestaShop SA
* @license   http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
* International Registered Trademark & Property of PrestaShop SA
*}

{extends file='page.tpl'}

{block name='page_content'}

	<div class="col-xs-12">
		<h2 class="headings headings-large">{l s='My alerts' d='Modules.Mailalerts.Shop'}</h2>
		{if $mailAlerts}
			<ul>
				{foreach from=$mailAlerts item=mailAlert}
					<li>{include 'module:ps_emailalerts/views/templates/front/mailalerts-account-line.tpl' mailAlert=$mailAlert}</li>
				{/foreach}
			</ul>
		{else}
			<div class="alert alert-info">
				<div class="content-help-info">
					<p class="warning">{l s='No mail alerts yet.' d='Modules.Mailalerts.Shop'}</p>
				</div>
			</div>
		{/if}

		<div>
			<a href="{$urls.pages.my_account}" class="small-text custom-link-color account-link">
				<i class="fa fa-chevron-left"></i>
				<span>{l s='Back to your account' d='Shop.Theme.Customeraccount'}</span>
			</a>
			<a href="{$urls.pages.index}" class="small-text custom-link-color account-link">
				<i class="fa fa-home"></i>
				<span>{l s='Home' d='Shop.Theme'}</span>
			</a>
		</div>
	</div>

{/block}

