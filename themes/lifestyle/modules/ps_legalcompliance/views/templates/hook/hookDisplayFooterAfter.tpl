{**
 * 2007-2016 PrestaShop
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
 *  @author 	PrestaShop SA <contact@prestashop.com>
 *  @copyright  2007-2016 PrestaShop SA
 *  @license    http://opensource.org/licenses/osl-3.0.php  Open Software License (OSL 3.0)
 *  International Registered Trademark & Property of PrestaShop SA
 *}

<div class="aeuc_footer_info links">
	{if isset($delivery_additional_information)}
		* {$delivery_additional_information}
		<a href="{$link_shipping}" class="custom-link-color">{l s='Shipping and payment' d='Modules.Legalcompliance.Shop'}</a>
	{else}
		{if $tax_included}
			<p class="regular-text small-text">{l s='All prices are mentioned tax included' d='Modules.Legalcompliance.Shop'}</p>
		{else}
			<p class="regular-text small-text">{l s='All prices are mentioned tax excluded' d='Modules.Legalcompliance.Shop'}</p>
		{/if}
		{if $show_shipping}
			<p class="regular-text small-text">{l s='and' d='Modules.Legalcompliance.Shop'}</p>
			{if $link_shipping}
				<a href="{$link_shipping}" class="custom-link-color">
			{/if}
			<p class="regular-text small-text">{l s='shipping excluded' d='Modules.Legalcompliance.Shop'}
			{if $link_shipping}
				</a>
			{/if}
		{/if}
	{/if}
</div>
