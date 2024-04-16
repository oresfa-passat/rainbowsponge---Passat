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
	{l s='Order details' d='Shop.Theme.Customeraccount'}
{/block}

{block name='page_content'}
	<div class="col-xs-12">
		{block name='order_infos'}
			<div id="order-infos">
				<div class="box">
					<div class="row">
						<div class="col-xs-{if $order.details.reorder_url}9{else}12{/if}">
							<p class="leads lead-2">
								{l
								s='Order Reference %reference% - placed on %date%'
								d='Shop.Theme.Customeraccount'
								sprintf=['%reference%' => $order.details.reference, '%date%' => $order.details.order_date]
								}
							</p>
						</div>
						{if $order.details.reorder_url}
							<div class="col-xs-3 text-xs-right">
								<a href="{$order.details.reorder_url}" class="regular-text custom-link-color"><i class="fa fa-refresh"></i> {l s='Reorder' d='Shop.Theme.Actions'}</a>
							</div>
						{/if}
						<div class="clearfix"></div>
					</div>
				</div>

				<div class="box">
					<ul>
						<li>
							<p class="regular-text default-text">
								<span class="bold">{l s='Carrier' d='Shop.Theme.Checkout'}</span> {$order.carrier.name}
							</p>
						</li>
						<li>
							<p class="regular-text default-text">
								<span class="bold">{l s='Payment method' d='Shop.Theme.Checkout'}</span> {$order.details.payment}
							</p>
						</li>

						{if $order.details.invoice_url}
							<li>
								<a class="regular-text custom-link-color" href="{$order.details.invoice_url}">
									{l s='Download your invoice as a PDF file.' d='Shop.Theme.Customeraccount'}
								</a>
							</li>
						{/if}

						{if $order.details.recyclable}
							<li>
								<p class="regular-text default-text">
									{l s='You have given permission to receive your order in recycled packaging.' d='Shop.Theme.Customeraccount'}
								</p>
							</li>
						{/if}

						{if $order.details.gift_message}
							<li>
								<p class="regular-text default-text">
									{l s='You have requested gift wrapping for this order.' d='Shop.Theme.Customeraccount'}
								</p>
							</li>
							<li>
								<p class="regular-text default-text">
									{l s='Message' d='Shop.Theme.Customeraccount'} {$order.details.gift_message nofilter}
								</p>
							</li>
						{/if}
					</ul>
				</div>
			</div>
		{/block}

		{block name='order_history'}
			<section id="order-history" class="box">
				<h3 class="headings headings-small">{l s='Follow your order\'s status step-by-step' d='Shop.Theme.Customeraccount'}</h3>
				<table class="table table-striped table-bordered table-labeled hidden-xs-down">
					<thead class="thead-default">
						<tr>
							<th>{l s='Date' d='Shop.Theme.Global'}</th>
							<th>{l s='Status' d='Shop.Theme.Global'}</th>
						</tr>
					</thead>
					<tbody>
						{foreach from=$order.history item=state}
							<tr>
								<td>{$state.history_date}</td>
								<td>
									<span class="label label-pill {$state.contrast}" style="background-color:{$state.color}">
										{$state.ostate_name}
									</span>
								</td>
							</tr>
						{/foreach}
					</tbody>
				</table>
				<div class="hidden-sm-up history-lines">
					{foreach from=$order.history item=state}
						<div class="history-line">
							<div class="date">{$state.history_date}</div>
							<div class="state">
								<span class="label label-pill {$state.contrast}" style="background-color:{$state.color}">
									{$state.ostate_name}
								</span>
							</div>
						</div>
					{/foreach}
				</div>
			</section>
		{/block}

		{if $order.follow_up}
			<div class="box">
				<h3 class="headings headings-small">{l s='Click the following link to track the delivery of your order' d='Shop.Theme.Customeraccount'}</h3>
				<a class="regular-text custom-link-color" href="{$order.follow_up}">{$order.follow_up}</a>
			</div>
		{/if}

		{block name='addresses'}
			<div class="addresses{if isset($page) && isset($page.page_name) && $page.page_name == 'guest-tracking'} row{/if}">
				{if $order.addresses.delivery}
					<div class="col-lg-6 col-md-6 col-sm-6">
						<article id="delivery-address" class="box">
							<p class="leads lead-2 bold">{l s='Delivery address %alias%' d='Shop.Theme.Checkout' sprintf=['%alias%' => $order.addresses.delivery.alias]}</p>
							<address>{$order.addresses.delivery.formatted nofilter}</address>
						</article>
					</div>
				{/if}

				<div class="col-lg-6 col-md-6 col-sm-6">
					<article id="invoice-address" class="box">
						<p class="leads lead-2 bold">{l s='Invoice address %alias%' d='Shop.Theme.Checkout' sprintf=['%alias%' => $order.addresses.invoice.alias]}</p>
						<address>{$order.addresses.invoice.formatted nofilter}</address>
					</article>
				</div>
				<div class="clearfix"></div>
			</div>
		{/block}

		{$HOOK_DISPLAYORDERDETAIL nofilter}

		{block name='order_detail'}
			{if $order.details.is_returnable}
				{include file='customer/_partials/order-detail-return.tpl'}
			{else}
				{include file='customer/_partials/order-detail-no-return.tpl'}
			{/if}
		{/block}

		{block name='order_carriers'}
			{if $order.shipping}
				<div class="box">
					<table class="table table-striped table-bordered hidden-sm-down">
						<thead class="thead-default">
							<tr>
								<th class="text-uppercase bold">{l s='Date' d='Shop.Theme.Global'}</th>
								<th class="text-uppercase bold">{l s='Carrier' d='Shop.Theme.Checkout'}</th>
								<th class="text-uppercase bold">{l s='Weight' d='Shop.Theme.Checkout'}</th>
								<th class="text-uppercase bold">{l s='Shipping cost' d='Shop.Theme.Checkout'}</th>
								<th class="text-uppercase bold">{l s='Tracking number' d='Shop.Theme.Checkout'}</th>
							</tr>
						</thead>
						<tbody>
							{foreach from=$order.shipping item=line}
								<tr>
									<td>
										<span class="regular-text default-text">{$line.shipping_date}</span>
									</td>
									<td>
										<span class="regular-text default-text">{$line.carrier_name}</span>
									</td>
									<td>
										<span class="regular-text default-text">{$line.shipping_weight}</span>
									</td>
									<td>
										<span class="regular-text default-text">{$line.shipping_cost}</span>
									</td>
									<td>
										<span class="regular-text default-text">{$line.tracking nofilter}</span>
									</td>
								</tr>
							{/foreach}
						</tbody>
					</table>
					<div class="hidden-md-up shipping-lines">
						{foreach from=$order.shipping item=line}
							<div class="shipping-line">
								<ul>
									<li>
										<p class="regular-text default-text">
											<span class="bold">{l s='Date' d='Shop.Theme.Global'}</span> {$line.shipping_date}
										</p>
									</li>
									<li>
										<p class="regular-text default-text">
											<span class="bold">{l s='Carrier' d='Shop.Theme.Checkout'}</span> {$line.carrier_name}
										</p>
									</li>
									<li>
										<p class="regular-text default-text">
											<span class="bold">{l s='Weight' d='Shop.Theme.Checkout'}</span> {$line.shipping_weight}
										</p>
									</li>
									<li>
										<p class="regular-text default-text">
											<span class="bold">{l s='Shipping cost' d='Shop.Theme.Checkout'}</span> {$line.shipping_cost}
										</p>
									</li>
									<li>
										<p class="regular-text default-text">
											<span class="bold">{l s='Tracking number' d='Shop.Theme.Checkout'}</span> {$line.tracking nofilter}
										</p>
									</li>
								</ul>
							</div>
						{/foreach}
					</div>
				</div>
			{/if}
		{/block}

		{block name='order_messages'}
			{include file='customer/_partials/order-messages.tpl'}
		{/block}
	</div>
{/block}
