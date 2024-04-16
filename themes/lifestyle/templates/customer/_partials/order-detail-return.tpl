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

{block name='order_products_table'}
	<form id="order-return-form" action="{$urls.pages.order_follow}" method="post">

		<div class="box hidden-sm-down">
			<table id="order-products" class="table table-bordered return">
				<thead class="thead-default">
					<tr>
						<th class="head-checkbox">
							<div class="checkbox">
								<span class="custom-checkbox">
									<input type="checkbox"/>
									<span class="custom-checkbox-checked"><i class="fa fa-check checkbox-checked"></i></span>
								</span>
							</div>
						</th>
						<th class="text-uppercase bold">{l s='Product' d='Shop.Theme.Catalog'}</th>
						<th class="text-uppercase bold">{l s='Quantity' d='Shop.Theme.Catalog'}</th>
						<th class="text-uppercase bold">{l s='Returned' d='Shop.Theme.Customeraccount'}</th>
						<th class="text-uppercase bold">{l s='Unit price' d='Shop.Theme.Catalog'}</th>
						<th class="text-uppercase bold">{l s='Total price' d='Shop.Theme.Catalog'}</th>
					</tr>
				</thead>
				{foreach from=$order.products item=product name=products}
					<tr>
						<td>
							{if !$product.customizations}
								<div class="checkbox">
									<span id="_desktop_product_line_{$product.id_order_detail}" class="custom-checkbox">
										<input type="checkbox" id="cb_{$product.id_order_detail}" name="ids_order_detail[{$product.id_order_detail}]" value="{$product.id_order_detail}">
										<span class="custom-checkbox-checked"><i class="fa fa-check checkbox-checked"></i></span>
									</span>
								</div>
							{else}
								{foreach $product.customizations  as $customization}
									<div class="checkbox">
										<span id="_desktop_product_customization_line_{$product.id_order_detail}_{$customization.id_customization}" class="custom-checkbox">
											<input type="checkbox" id="cb_{$product.id_order_detail}" name="customization_ids[{$product.id_order_detail}][]" value="{$customization.id_customization}">
											<span class="custom-checkbox-checked"><i class="fa fa-check checkbox-checked"></i></span>
										</span>
									</div>
								{/foreach}
							{/if}
						</td>
						<td>
							<span class="regular-text default-text bold">{$product.name}</span><br/>
							{if $product.reference}
								<span class="regular-text default-text">{l s='Reference' d='Shop.Theme.Catalog'}: {$product.reference}</span><br/>
							{/if}
							{if $product.customizations}
								{foreach from=$product.customizations item="customization"}
									<div class="customization">
										<a class="regular-text custom-link-color" href="#" data-toggle="modal" data-target="#product-customizations-modal-{$customization.id_customization}">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
									</div>
									<div id="_desktop_product_customization_modal_wrapper_{$customization.id_customization}">
										<div class="modal fade customization-modal" id="product-customizations-modal-{$customization.id_customization}" tabindex="-1" role="dialog" aria-hidden="true">
											<div class="modal-dialog" role="document">
												<div class="modal-content">
													<div class="modal-header">
														<button type="button" class="close" data-dismiss="modal" aria-label="Close">
															<span aria-hidden="true">
																<i class="fa fa-times"></i>
															</span>
														</button>
														<h4 class="headings headings-medium">{l s='Product customization' d='Shop.Theme.Catalog'}</h4>
													</div>
													<div class="modal-body">
														{foreach from=$customization.fields item="field"}
															<div class="product-customization-line row">
																<div class="col-sm-3 col-xs-4 label">
																	<span class="regular-text default-text">{$field.label}</span>
																</div>
																<div class="col-sm-9 col-xs-8 value">
																	{if $field.type == 'text'}
																		{if (int)$field.id_module}
																			<span class="regular-text default-text">{$field.text nofilter}</span>
																		{else}
																			<span class="regular-text default-text">{$field.text}</span>
																		{/if}
																	{elseif $field.type == 'image'}
																		<img src="{$field.image.small.url}">
																	{/if}
																</div>
															</div>
														{/foreach}
													</div>
												</div>
											</div>
										</div>
									</div>
								{/foreach}
							{/if}
						</td>
						<td class="qty">
							{if !$product.customizations}
								<div class="current">
									<span class="regular-text default-text">{$product.quantity}</span>
								</div>
								{if $product.quantity > $product.qty_returned}
									<div class="select" id="_desktop_return_qty_{$product.id_order_detail}">
										<select name="order_qte_input[{$product.id_order_detail}]" class="form-control form-control-select">
											{section name=quantity start=1 loop=$product.quantity+1-$product.qty_returned}
												<option value="{$smarty.section.quantity.index}">{$smarty.section.quantity.index}</option>
											{/section}
										</select>
									</div>
								{/if}
							{else}
								{foreach $product.customizations as $customization}
									<div class="current">
										<span class="regular-text default-text">{$customization.quantity}</span>
									</div>
									<div class="select" id="_desktop_return_qty_{$product.id_order_detail}_{$customization.id_customization}">
										<select
										name="customization_qty_input[{$customization.id_customization}]"
										class="form-control form-control-select"
										>
											{section name=quantity start=1 loop=$customization.quantity+1}
												<option value="{$smarty.section.quantity.index}">{$smarty.section.quantity.index}</option>
											{/section}
										</select>
									</div>
								{/foreach}
								<div class="clearfix"></div>
							{/if}
						</td>
						<td class="text-xs-right">
							<span class="regular-text default-text">{$product.qty_returned}</span>
						</td>
						<td class="text-xs-right">
							<span class="regular-text default-text">{$product.price}</span>
						</td>
						<td class="text-xs-right">
							<span class="regular-text default-text">{$product.total}</span>
						</td>
					</tr>
				{/foreach}
				<tfoot>
					{foreach $order.subtotals as $line}
						{if $line.value}
							<tr class="text-xs-right line-{$line.type}">
								<td colspan="5">
									<span class="regular-text default-text">{$line.label}</span>
								</td>
								<td colspan="2">
									<span class="regular-text default-text">{$line.value}</span>
								</td>
							</tr>
						{/if}
					{/foreach}
					<tr class="text-xs-right line-{$order.totals.total.type}">
						<td colspan="5">
							<span class="regular-text default-text">{$order.totals.total.label}</span>
						</td>
						<td colspan="2">
							<span class="regular-text default-text">{$order.totals.total.value}</span>
						</td>
					</tr>
				</tfoot>
			</table>
		</div>

		<div class="order-items hidden-md-up box">
			{foreach from=$order.products item=product}
				<div class="order-item">
					<div class="row">
						<div class="checkbox">
							{if !$product.customizations}
								<span id="_mobile_product_line_{$product.id_order_detail}"></span>
							{else}
								{foreach $product.customizations  as $customization}
									<span id="_mobile_product_customization_line_{$product.id_order_detail}_{$customization.id_customization}"></span>
								{/foreach}
							{/if}
						</div>
						<div class="content">
							<div class="row">
								<div class="col-sm-5 desc">
									<div class="name">
										<span class="regular-text default-text">{$product.name}</span>
									</div>
									{if $product.reference}
										<div class="ref">
											<span class="regular-text default-text">
												{l s='Reference' d='Shop.Theme.Catalog'}: {$product.reference}
											</span>
										</div>
									{/if}
									{if $product.customizations}
										{foreach $product.customizations as $customization}
											<div class="customization">
												<a href="#" data-toggle="modal" data-target="#product-customizations-modal-{$customization.id_customization}" class="regular-text custom-link-color">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
											</div>
											<div id="_mobile_product_customization_modal_wrapper_{$customization.id_customization}">
											</div>
										{/foreach}
									{/if}
								</div>
								<div class="col-sm-7 qty">
									<div class="row">
										<div class="col-xs-4 text-sm-left text-xs-left">
											<span class="regular-text default-text">{$product.price}</span>
										</div>
										<div class="col-xs-4">
											{if $product.customizations}
												{foreach $product.customizations as $customization}
													<div class="q">
														<span class="regular-text default-text">{l s='Quantity' d='Shop.Theme.Catalog'}: {$customization.quantity}</span>
													</div>
													<div class="s" id="_mobile_return_qty_{$product.id_order_detail}_{$customization.id_customization}"></div>
												{/foreach}
											{else}
												<div class="q">
													<span class="regular-text default-text">{l s='Quantity' d='Shop.Theme.Catalog'}: {$product.quantity}</span>
												</div>
												{if $product.quantity > $product.qty_returned}
													<div class="s" id="_mobile_return_qty_{$product.id_order_detail}"></div>
												{/if}
											{/if}
											{if $product.qty_returned > 0}
												<div>
													<span class="regular-text default-text">{l s='Returned' d='Shop.Theme.Customeraccount'}: {$product.qty_returned}
													</span>
												</div>
											{/if}
										</div>
										<div class="col-xs-4 text-xs-right">
											<span class="regular-text default-text">{$product.total}</span>
										</div>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>
			{/foreach}
		</div>
		<div class="order-totals hidden-md-up box">
			{foreach $order.subtotals as $line}
				{if $line.value}
					<div class="order-total row">
						<div class="col-xs-8">
							<span class="regular-text default-text bold">{$line.label}</span>
						</div>
						<div class="col-xs-4 text-xs-right">
							<span class="regular-text default-text">{$line.value}</span>
						</div>
					</div>
				{/if}
			{/foreach}
			<div class="order-total row">
				<div class="col-xs-8">
					<span class="regular-text default-text bold">{$order.totals.total.label}</span>
				</div>
				<div class="col-xs-4 text-xs-right">
					<span class="regular-text default-text">{$order.totals.total.value}</span>
				</div>
			</div>
		</div>

		<div class="box">
			<header>
				<h3 class="headings headings-small">{l s='Merchandise return' d='Shop.Theme.Customeraccount'}</h3>
				<p class="regular-text default-text">{l s='If you wish to return one or more products, please mark the corresponding boxes and provide an explanation for the return. When complete, click the button below.' d='Shop.Theme.Customeraccount'}</p>
			</header>
			<section class="form-fields">
				<div class="form-group">
					<textarea cols="67" rows="3" name="returnText" class="form-control"></textarea>
				</div>
			</section>
			<footer class="form-footer">
				<input type="hidden" name="id_order" value="{$order.details.id}">
					<button class="form-control-submit btn btn-small custom-button" type="submit" name="submitReturnMerchandise">
						{l s='Request a return' d='Shop.Theme.Customeraccount'}
					</button>
			</footer>
		</div>

	</form>
{/block}
