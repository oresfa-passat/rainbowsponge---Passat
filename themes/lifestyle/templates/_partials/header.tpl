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
{block name='header_banner'}
	<div class="header-banner">
		{hook h='displayBanner'}
	</div>
{/block}

{block name='header_nav'}
	<nav class="header-nav">
		<div class="container">
			<div class="hidden-sm-down">
				<div class="hooksHeader displayNav clearfix">
					<div class="col-md-12 col-xs-12 right-nav">
						{hook h='displayNav'}
					</div>
				</div>
				<div class="hooksHeader displayNav1 clearfix">
					<div class="col-md-12 col-xs-12 right-nav">
						{hook h='displayNav1'}
					</div>
				</div>
				<div class="hooksHeader displayTop displayNav2 clearfix">
					<div class="col-md-2">
						{hook h='displayTop'}
					</div>
					<div class="col-md-10 right-nav">
						{hook h='displayNav2'}
					</div>
				</div>
			</div>
			<div class="hidden-md-up text-xs-center mobile">
				<div class="pull-xs-left" id="menu-icon">
					<i class="fa fa-reorder d-inline"></i>
				</div>
				<div class="pull-xs-right" id="_mobile_cart"></div>
				<div class="pull-xs-right" id="_mobile_user_info"></div>
				<div class="top-logo" id="_mobile_logo"></div>
				<div id="_mobile_search_widget"></div>
				<div class="clearfix"></div>
			</div>
		</div>
	</nav>
{/block}

{block name='header_top'}
	<div class="header-top">
		<div class="container">
			<div id="mobile_top_menu_wrapper" class="row hidden-md-up" style="display:none;">
				<div class="js-top-menu mobile" id="_mobile_top_menu"></div>
				<div class="js-top-menu-bottom">
					<div id="_mobile_currency_selector"></div>
					<div id="_mobile_language_selector"></div>
					<div id="_mobile_contact_link"></div>
				</div>
			</div>
		</div>
	</div>

	{* HOOK FOR MAIN MENU *}
	<div class="header-full-width">
		{hook h='displayNavFullWidth'}
	</div>

{/block}
