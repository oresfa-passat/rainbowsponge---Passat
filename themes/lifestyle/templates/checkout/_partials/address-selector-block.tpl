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

{block name='address_selector_blocks'}
	{foreach $addresses as $address}
		<article
		class="address-item{if $address.id == $selected} selected{/if}"
		id="{$name|classname}-address-{$address.id}"
		>
			<header>
				<label class="radio-block">
					<span class="custom-radio">
						<input
						type="radio"
						name="{$name}"
						value="{$address.id}"
						{if $address.id == $selected}checked{/if}
						>
							<span></span>
					</span>
					<span class="label label-title address-alias">{$address.alias}</span>
					<div class="regular-text default-text address">{$address.formatted nofilter}</div>
				</label>
			</header>
			<hr>
			<footer class="address-footer">
				{if $interactive}
					<a
					class="regular-text custom-link-color edit-address"
					data-link-action="edit-address"
					href="{url entity='order' params=['id_address' => $address.id, 'editAddress' => $type, 'token' => $token]}"
					>
						<i class="fa fa-pencil edit"></i> <span class="regular-text default-text">{l s='Edit' d='Shop.Theme.Actions'}</span>
					</a>
					<a
					class="regular-text custom-link-color delete-address"
					data-link-action="delete-address"
					href="{url entity='order' params=['id_address' => $address.id, 'deleteAddress' => true, 'token' => $token]}"
					>
						<i class="fa fa-trash delete"></i> <span class="regular-text default-text">{l s='Delete' d='Shop.Theme.Actions'}</span>
					</a>
				{/if}
			</footer>
		</article>
	{/foreach}
	{if $interactive}
		<p>
			<button class="btn btn-small custom-button ps-hidden-by-js form-control-submit center-block" type="submit">{l s='Save' d='Shop.Theme.Actions'}</button>
		</p>
	{/if}
{/block}
