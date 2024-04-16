<div id="blockcart-modal" class="modal fade" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
	<div class="modal-dialog" role="document">
		<div class="modal-content">
			<div class="modal-header">
				<button type="button" class="close" data-dismiss="modal" aria-label="Close">
					<span aria-hidden="true"><i class="fa fa-times"></i></span>
				</button>
				<span class="regular-text modal-title text-xs-center" id="myModalLabel"><i class="fa fa-check"></i>
					{l s='Product successfully added to your shopping cart' d='Shop.Theme.Checkout'}
				</span>
			</div>
			<div class="modal-body">
				<div class="row">
					<div class="col-md-5 divide-right">
						<div class="row">
							<div class="col-md-6">
								<img class="product-image" src="{$product.cover.medium.url}" alt="{$product.cover.legend}" title="{$product.cover.legend}" itemprop="image">
							</div>
							<div class="col-md-6">
								<h6 class="custom-main-text-color product-name">{$product.name}</h6>
								<p class="regular-text default-text">{$product.price}</p>
								{hook h='displayProductPriceBlock' product=$product type="unit_price"}
								{foreach from=$product.attributes item="property_value" key="property"}
									<span><strong>{$property}</strong>: {$property_value}</span><br>
								{/foreach}
								<p class="regular-text default-text"><span class="bold">{l s='Quantity:' d='Shop.Theme.Checkout'}</span>&nbsp;{$product.cart_quantity}</p>
							</div>
						</div>
					</div>
					<div class="col-md-7">
						<div class="cart-content">
							{if $cart.products_count > 1}
								<p class="regular-text default-text cart-products-count">{l s='There are %products_count% items in your cart.' sprintf=['%products_count%' => $cart.products_count] d='Shop.Theme.Checkout'}</p>
							{else}
								<p class="regular-text default-text cart-products-count">{l s='There is %product_count% item in your cart.' sprintf=['%product_count%' =>$cart.products_count] d='Shop.Theme.Checkout'}</p>
							{/if}
							<p class="regular-text default-text">
								<span class="bold">{l s='Total products:' d='Shop.Theme.Checkout'}</span>&nbsp;{$cart.subtotals.products.value}
							</p>
							<p class="regular-text default-text">
								<span class="bold">{l s='Total shipping:' d='Shop.Theme.Checkout'}</span>&nbsp;{$cart.subtotals.shipping.value} {hook h='displayCheckoutSubtotalDetails' subtotal=$cart.subtotals.shipping}
							</p>
							{if $cart.subtotals.tax}
								<p class="regular-text default-text"><span class="bold">{$cart.subtotals.tax.label}</span>&nbsp;{$cart.subtotals.tax.value}</p>
							{/if}
							<p class="regular-text default-text">
								<span class="bold">{l s='Total:' d='Shop.Theme.Checkout'}</span>&nbsp;{$cart.totals.total.value} {$cart.labels.tax_short}
							</p>
							<div class="cart-content-btn">
								<button type="button" class="custom-link-color underline" data-dismiss="modal">{l s='Continue shopping' d='Shop.Theme.Actions'}</button>
								<a href="{$cart_url}" class="btn btn-small custom-button"><i class="fa fa-check"></i>{l s='Proceed to checkout' d='Shop.Theme.Actions'}</a>
							</div>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
