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
	{l s='Order history' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
	<div class="col-xs-12">
		<p class="leads lead-2">{l s='Here are the orders you\'ve placed since your account was created.' d='Shop.Theme.Customeraccount'}</p>
		{if $orders}
			<table class="table table-striped table-bordered table-labeled hidden-sm-down">
				<thead class="thead-default">
					<tr>
						<th class="text-uppercase bold">{l s='Order reference' d='Shop.Theme.Checkout'}</th>
						<th class="text-uppercase bold">{l s='Date' d='Shop.Theme.Checkout'}</th>
						<th class="text-uppercase bold">{l s='Total price' d='Shop.Theme.Checkout'}</th>
						<th class="text-uppercase bold hidden-md-down">{l s='Payment' d='Shop.Theme.Checkout'}</th>
						<th class="text-uppercase bold hidden-md-down">{l s='Status' d='Shop.Theme.Checkout'}</th>
						<th class="text-uppercase bold">{l s='Invoice' d='Shop.Theme.Checkout'}</th>
						<th class="text-uppercase bold">&nbsp;</th>
					</tr>
				</thead>
				<tbody>
					{foreach from=$orders item=order}
						<tr>
							<th scope="row">
								<span class="regular-text default-text custom-main-text-color">{$order.details.reference}</span>
							</th>
							<td>
								<span class="regular-text default-text">{$order.details.order_date}</span>
							</td>
							<td class="text-xs-right">
								<span class="regular-text default-text">{$order.totals.total.value}</span>
							</td>
							<td class="hidden-md-down">
								<span class="regular-text default-text">{$order.details.payment}</span>
							</td>
							<td>
								<span
								class="label label-pill {$order.history.current.contrast}"
								style="background-color:{$order.history.current.color}"
								>
									{$order.history.current.ostate_name}
								</span>
							</td>
							<td class="text-xs-center hidden-md-down">
								{if $order.details.invoice_url}
									<a class="regular-text custom-link-color" href="{$order.details.invoice_url}"><i class="fa fa-file-pdf-o"></i></a>
								{else}
									-
								{/if}
							</td>
							<td class="text-xs-center order-actions">
								<a class="regular-text custom-link-color" href="{$order.details.details_url}" data-link-action="view-order-details">
									{l s='Details' d='Shop.Theme.Customeraccount'}
								</a>
								<span>-</span>
								{if $order.details.reorder_url}
									<a class="regular-text custom-link-color" href="{$order.details.reorder_url}">{l s='Reorder' d='Shop.Theme.Actions'}</a>
								{/if}
							</td>
						</tr>
					{/foreach}
				</tbody>
			</table>

			<div class="orders hidden-md-up">
				{foreach from=$orders item=order}
					<div class="order">
						<div class="row">
							<div class="col-xs-10">
								<a class="custom-link-color" href="{$order.details.details_url}"><h3 class="headings headings-small">{$order.details.reference}</h3></a>
								<div class="date regular-text default-text">{$order.details.order_date}</div>
								<div class="total regular-text default-text">{$order.totals.total.value}</div>
								<div class="status regular-text default-text">
									<span
									class="label label-pill {$order.history.current.contrast}"
									style="background-color:{$order.history.current.color}"
									>
									{$order.history.current.ostate_name}
									</span>
								</div>
							</div>
							<div class="col-xs-2 text-xs-right">
								<div>
									<a class="regular-text custom-link-color" href="{$order.details.details_url}" data-link-action="view-order-details" title="{l s='Details' d='Shop.Theme.Customeraccount'}">
										<i class="fa fa-search"></i>
									</a>
								</div>
								{if $order.details.reorder_url}
									<div>
										<a class="regular-text custom-link-color" href="{$order.details.reorder_url}" title="{l s='Reorder' d='Shop.Theme.Actions'}">
											<i class="fa fa-refresh"></i>
										</a>
									</div>
								{/if}
							</div>
						</div>
					</div>
				{/foreach}
			</div>

		{/if}
	</div>
{/block}
