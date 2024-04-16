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
	{l s='Your vouchers' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
	<div class="col-xs-12">
		{if $cart_rules}
			<table class="table table-striped table-bordered hidden-sm-down">
				<thead class="thead-default">
					<tr>
						<th class="text-uppercase bold">{l s='Code' d='Shop.Theme.Checkout'}</th>
						<th class="text-uppercase bold">{l s='Description' d='Shop.Theme.Checkout'}</th>
						<th class="text-uppercase bold">{l s='Quantity' d='Shop.Theme.Checkout'}</th>
						<th class="text-uppercase bold">{l s='Value' d='Shop.Theme.Checkout'}</th>
						<th class="text-uppercase bold">{l s='Minimum' d='Shop.Theme.Checkout'}</th>
						<th class="text-uppercase bold">{l s='Cumulative' d='Shop.Theme.Checkout'}</th>
						<th class="text-uppercase bold">{l s='Expiration date' d='Shop.Theme.Checkout'}</th>
					</tr>
				</thead>
				<tbody>
					{foreach from=$cart_rules item=cart_rule}
						<tr>
							<th scope="row">
								<span class="regular-text default-text custom-main-text-color">{$cart_rule.code}</span>
							</th>
							<td>
								<span class="regular-text default-text">{$cart_rule.name}</span>
							</td>
							<td class="text-xs-right">
								<span class="regular-text default-text">{$cart_rule.quantity_for_user}</span>
							</td>
							<td>
								<span class="regular-text default-text">{$cart_rule.value}</span>
							</td>
							<td>
								<span class="regular-text default-text">{$cart_rule.voucher_minimal}</span>
							</td>
							<td>
								<span class="regular-text default-text">{$cart_rule.voucher_cumulable}</span>
							</td>
							<td>
								<span class="regular-text default-text">{$cart_rule.voucher_date}</span>
							</td>
						</tr>
					{/foreach}
				</tbody>
			</table>
			<div class="cart-rules hidden-md-up">
				{foreach from=$cart_rules item=cart_rule}
					<div class="cart-rule">
						<ul>
							<li>
								<p>
									<span class="bold">{l s='Code' d='Shop.Theme.Checkout'}</span>
									{$cart_rule.code}
								</p>
							</li>
							<li>
								<p>
									<span class="bold">{l s='Description' d='Shop.Theme.Checkout'}</span>
									{$cart_rule.name}
								</p>
							</li>
							<li>
								<p>
									<span class="bold">{l s='Quantity' d='Shop.Theme.Checkout'}</span>
									{$cart_rule.quantity_for_user}
								</p>
							</li>
							<li>
								<p>
									<span class="bold">{l s='Value' d='Shop.Theme.Checkout'}</span>
									{$cart_rule.value}
								</p>
							</li>
							<li>
								<p>
									<span class="bold">{l s='Minimum' d='Shop.Theme.Checkout'}</span>
									{$cart_rule.voucher_minimal}
								</p>
							</li>
							<li>
								<p>
									<span class="bold">{l s='Cumulative' d='Shop.Theme.Checkout'}</span>
									{$cart_rule.voucher_cumulable}
								</p>
							</li>
							<li>
								<p>
									<span class="bold">{l s='Expiration date' d='Shop.Theme.Checkout'}</span>
									{$cart_rule.voucher_date}
								</p>
							</li>
						</ul>
					</div>
				{/foreach}
			</div>
		{/if}
	</div>
{/block}
