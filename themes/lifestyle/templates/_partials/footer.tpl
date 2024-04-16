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


<div class="footer-reassurance">
	<div class="container">
		{block name='hook_reassurance'}
			{hook h='displayReassurance'}
		{/block}
	</div>
</div>
<div class="footer-container">
	<div class="container">
		<div class="footer-before clearfix">
			{block name='hook_footer_before'}
				{hook h='displayFooterBefore'}
			{/block}
		</div>
	</div>
	<div class="container">
		<div class="footer-center clearfix">
			{block name='hook_footer'}
				{hook h='displayFooter'}
			{/block}
		</div>
		<div class="footer-after clearfix">
			{block name='hook_footer_after'}
				{hook h='displayFooterAfter'}
			{/block}
		</div>
		<div class="copyright clearfix">
			<div class="pull-xs-right">
				<p class="default-text small-text text-right">
					{block name='copyright_link'}
						<a class="nounderline custom-link-color" href="http://www.prestashop.com" target="_blank">
							{l s='%copyright% %year% - %prestashop%' sprintf=['%prestashop%' => "{$shop.name}", '%year%' => 'Y'|date, '%copyright%' => '©'] d='Shop.Theme.Global'}
						</a>
					{/block}
				</p>
			</div>
		</div>
		<p class="hide">
			{l s='Your cart is empty' d='Shop.Theme.Lifestyle'} {l s='Proceed to checkout' d='Shop.Theme.Lifestyle'}
		</p>
	</div>
</div>
