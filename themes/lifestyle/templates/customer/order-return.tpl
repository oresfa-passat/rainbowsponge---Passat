{extends file='customer/page.tpl'}

{block name='page_title'}
	<h1 class="headings headings-medium">{l s='Return details' d='Shop.Theme.Customeraccount'}</h1>
{/block}

{block name='page_content'}
	<div class="col-xs-12">
		{block name='order_return_infos'}
			<div id="order-return-infos">
				<div>
					<p class="regular-text default-text bold">
						{l
						s='%number% on %date%'
						d='Shop.Theme.Customeraccount'
						sprintf=['%number%' => $return.return_number, '%date%' => $return.return_date]}
					</p>
					<p class="regular-text default-text">
						{l s='We have logged your return request.' d='Shop.Theme.Customeraccount'}
					</p>
					<p class="regular-text default-text">
						{l
						s='Your package must be returned to us within %number% days of receiving your order.'
						d='Shop.Theme.Customeraccount'
						sprintf=['%number%' => $configuration.number_of_days_for_return]}
					</p>
					<p class="regular-text default-text">
						{* [1][/1] is for a HTML tag. *}
						{l
						s='The current status of your merchandise return is: [1] %status% [/1]'
						d='Shop.Theme.Customeraccount'
						sprintf=[
						'[1]' => '<span class="regular-text default-text bold">',
						'[/1]' => '</span>',
						'%status%' => $return.state_name
						]
						}
					</p>
					<p class="regular-text default-text">
						{l s='List of items to be returned:' d='Shop.Theme.Customeraccount'}
					</p>
					<table class="table table-striped table-bordered">
						<thead class="thead-default">
							<tr>
								<th class="text-uppercase bold">{l s='Product' d='Shop.Theme.Catalog'}</th>
								<th class="text-uppercase bold">{l s='Quantity' d='Shop.Theme.Checkout'}</th>
							</tr>
						</thead>
						<tbody>
							{foreach from=$products item=product}
								<tr>
									<td>
										<span class="regular-text default-text bold">{$product.product_name}</span>
										{if $product.product_reference}
											<br />
											<span class="regular-text default-text">{l s='Reference' d='Shop.Theme.Catalog'}: {$product.product_reference}</span>
										{/if}
										{if $product.customizations}
											{foreach from=$product.customizations item="customization"}
												<div class="customization">
													<a href="#" data-toggle="modal" data-target="#product-customizations-modal-{$customization.id_customization}" class="regular-text custom-link-color">{l s='Product customization' d='Shop.Theme.Catalog'}</a>
												</div>
												<div class="modal fade customization-modal" id="product-customizations-modal-{$customization.id_customization}" tabindex="-1" role="dialog" aria-hidden="true">
													<div class="modal-dialog" role="document">
														<div class="modal-content">
															<div class="modal-header">
																<button type="button" class="close" data-dismiss="modal" aria-label="Close">
																	<span aria-hidden="true">
																		<i class="fa fa-times"></i>
																	</span>
																</button>
																<h4 class="headings headings-medium">
																	{l s='Product customization' d='Shop.Theme.Catalog'}
																</h4>
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
																					<span class="regular-text default-text">{$field.textnofilter} </span>
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
											{/foreach}
										{/if}
									</td>
									<td>
										{if $product.customizations}
											<span class="regular-text default-text">{$product.product_quantity}</span>
										{else}
											{foreach $product.customizations as $customization}
												<span class="regular-text default-text">{$customization.quantity}</span>
											{/foreach}
										{/if}
									</td>
								</tr>
							{/foreach}
						</tbody>
					</table>
				</div>
			</div>
		{/block}

		{if $return.state == 2}
			<section>
				<div>
					<h3 class="headings headings-small">{l s='Reminder' d='Shop.Theme.Customeraccount'}</h3>
					<p class="regular-text default-text">
						{l
						s='All merchandise must be returned in its original packaging and in its original state.'
						d='Shop.Theme.Customeraccount'
						}<br>
						{* [1][/1] is for a HTML tag. *}
						{l
						s='Please print out the [1]returns form[/1] and include it with your package.'
						d='Shop.Theme.Customeraccount'
						sprintf=[
						'[1]' => '<a class="regular-text custom-link-color" href="'|cat:$return.print_url|cat:'">',
						'[/1]' => '</a>'
						]
						}
						<br>
						{* [1][/1] is for a HTML tag. *}
						{l
						s='Please check the [1]returns form[/1] for the correct address.'
						d='Shop.Theme.Customeraccount'
						sprintf=[
						'[1]' => '<a class="regular-text custom-link-color" href="'|cat:$return.print_url|cat:'">',
						'[/1]' => '</a>'
						]
						}
					</p>
					<p class="regular-text default-text">
						{l
						s='When we receive your package, we will notify you by email. We will then begin processing order reimbursement.'
						d='Shop.Theme.Customeraccount'
						}<br>
						<a class="regular-text custom-link-color" href="{$urls.pages.contact}">
							{l
							s='Please let us know if you have any questions.'
							d='Shop.Theme.Customeraccount'
							}
						</a><br>
						{l
						s='If the conditions of return listed above are not respected, we reserve the right to refuse your package and/or reimbursement.'
						d='Shop.Theme.Customeraccount'
						}
					</p>
				</div>
			</section>
		{/if}
	</div>
{/block}
