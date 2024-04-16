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
{extends file='customer/page.tpl'}

{block name='page_title'}
{l s='Your account' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
	<div class="col-xs-12">
		<div class="row">
			<div class="links">

				<a class="col-lg-4 col-md-6 col-sm-6 col-xs-12 custom-link-color" id="identity-link" href="{$urls.pages.identity}">
					<span class="link-item">
						<i class="fa fa-user"></i>
						{l s='Information' d='Shop.Theme.Customeraccount'}
					</span>
				</a>

				{if $customer.addresses|count}
					<a class="col-lg-4 col-md-6 col-sm-6 col-xs-12 custom-link-color" id="addresses-link" href="{$urls.pages.addresses}">
						<span class="link-item">
							<i class="fa fa-map-marker"></i>
							{l s='Addresses' d='Shop.Theme.Customeraccount'}
						</span>
					</a>
				{else}
					<a class="col-lg-4 col-md-6 col-sm-6 col-xs-12 custom-link-color" id="address-link" href="{$urls.pages.address}">
						<span class="link-item">
						<i class="fa fa-home"></i>
						{l s='Add first address' d='Shop.Theme.Customeraccount'}
						</span>
					</a>
				{/if}

				{if !$configuration.is_catalog}
					<a class="col-lg-4 col-md-6 col-sm-6 col-xs-12 custom-link-color" id="history-link" href="{$urls.pages.history}">
						<span class="link-item">
							<i class="fa fa-calendar"></i>
							{l s='Order history and details' d='Shop.Theme.Customeraccount'}
						</span>
					</a>
				{/if}

				{if !$configuration.is_catalog}
					<a class="col-lg-4 col-md-6 col-sm-6 col-xs-12 custom-link-color" id="order-slips-link" href="{$urls.pages.order_slip}">
					<span class="link-item">
						<i class="fa fa-ticket"></i>
						{l s='Credit slips' d='Shop.Theme.Customeraccount'}
						</span>
					</a>
				{/if}

				{if $configuration.voucher_enabled && !$configuration.is_catalog}
					<a class="col-lg-4 col-md-6 col-sm-6 col-xs-12 custom-link-color" id="discounts-link" href="{$urls.pages.discount}">
					<span class="link-item">
						<i class="fa fa-tag"></i>
						{l s='Vouchers' d='Shop.Theme.Customeraccount'}
					</span>
					</a>
				{/if}

				{if $configuration.return_enabled && !$configuration.is_catalog}
					<a class="col-lg-4 col-md-6 col-sm-6 col-xs-12 custom-link-color" id="returns-link" href="{$urls.pages.order_follow}">
					<span class="link-item">
						<i class="fa fa-refresh"></i>
						{l s='Merchandise returns' d='Shop.Theme.Customeraccount'}
					</span>
					</a>
				{/if}

				{block name='display_customer_account'}
					{hook h='displayCustomerAccount'}
				{/block}

				<a class="col-lg-4 col-md-6 col-sm-6 col-xs-12 custom-link-color logout"  id="logout-link" href="{$logout_url}" rel="nofollow">
					<span class="link-item">
						<i class="fa fa-user-times"></i>
						{l s='Sign out' d='Shop.Theme.Actions'}
					</span>
				</a>

			</div>
		</div>
	</div>
{/block}
