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
		<div class="container">
			{hook h='displayBanner'}
		</div>
	</div>
{/block}

{block name='header_nav'}
	<nav class="header-nav">
		<div class="container">
			<div class="hidden-sm-down">
				<div class="row">
					<div class="col-md-12 hidden-sm-down shop-logo" id="_desktop_logo">
						{hook h='displayTop'}
					</div>
				</div>
			</div>
			<div class="hidden-md-up text-xs-center mobile">
				<div class="pull-xs-left" id="menu-icon">
					<i class="fa fa-reorder d-inline"></i>
				</div>
				<div class="top-logo" id="_mobile_logo"></div>
				<div class="clearfix"></div>
			</div>
		</div>
	</nav>
{/block}
