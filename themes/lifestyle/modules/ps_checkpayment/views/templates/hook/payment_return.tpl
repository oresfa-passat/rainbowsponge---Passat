{*
* 2007-2015 PrestaShop
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
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{if $status == 'ok'}
	<p class="default-text regular-text">
		{l s='Your order on %s is complete.' sprintf=[$shop_name] d='Modules.Checkpayment.Shop'}
		<br /><br />
		{l s='Your check must include:' d='Modules.Checkpayment.Shop'}
		<br /><br />- {l s='Payment amount.' d='Modules.Checkpayment.Shop'} 
		<span class="price"><strong>{$total_to_pay}</strong></span>
		<br /><br />- {l s='Payable to the order of' d='Modules.Checkpayment.Shop'} <strong>{if $checkName}{$checkName}{else}___________{/if}</strong>
		<br /><br />- {l s='Mail to' d='Modules.Checkpayment.Shop'} <strong>{if $checkAddress}{$checkAddress}{else}___________{/if}</strong>
		{if !isset($reference)}
			<br /><br />- {l s='Do not forget to insert your order number #%d.' sprintf=[$id_order] d='Modules.Checkpayment.Shop'}
		{else}
			<br /><br />- {l s='Do not forget to insert your order reference %s.' sprintf=[$reference] d='Modules.Checkpayment.Shop'}
		{/if}
		<br /><br />{l s='An email has been sent to you with this information.' d='Modules.Checkpayment.Shop'}
		<br /><br /><strong>{l s='Your order will be sent as soon as we receive your payment.' d='Modules.Checkpayment.Shop'}</strong>
		<br /><br />{l s='For any questions or for further information, please contact our' d='Modules.Checkpayment.Shop'} <a class="regular-text custom-link-color" href="{$link->getPageLink('contact', true)|escape:'html'}">{l s='customer service department.' d='Modules.Checkpayment.Shop'}</a>.
	</p>
{else}
	<div class="alert alert-warning">
		<div class="content-help-info">
			<p>
				{l s='We have noticed that there is a problem with your order. If you think this is an error, you can contact our' d='Modules.Checkpayment.Shop'}
				<a href="{$link->getPageLink('contact', true)|escape:'html'}">{l s='customer service department.' d='Modules.Checkpayment.Shop'}</a>.
			</p>
		</div>
	</div>
{/if}
