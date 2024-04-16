<div id="_desktop_cart">
	<div class="blockcart cart-preview {if $cart.products_count > 0}active{else}inactive{/if}" data-refresh-url="{$refresh_url}">
		<div class="header">
			<div class="dropdown-item">
				{if $cart.products_count > 0}
					<a rel="nofollow" href="{$cart_url}" class="custom-link-color">
				{/if}
					<i class="fa fa-shopping-cart custom-link-color"></i>
				{if $cart.products_count > 0}
					<span class="cart-products-count badge custom-main-bg-color">{$cart.products_count}</span>
				{/if}
				{if $cart.products_count > 0}
					</a>
				{/if}
			</div>
			<div class="blockcart-details animated fadeIn hidden-md-down">
				{if $cart.products}
					<ul class="list-unstyled">
						{foreach from=$cart.products item=product}
							<li>{include 'module:ps_shoppingcart/ps_shoppingcart-product-line.tpl' product=$product}</li>
						{/foreach}
					</ul>
					<div class="blockcart-price-view clearfix">
						<div class="col-md-4">
							<span class="cart-total-price bold">{$cart.totals.total.value}</span>
						</div>
						<div class="col-md-8">
							<a rel="nofollow" href="{$cart_url}" class="btn btn-small custom-button">
								{l s='Proceed to checkout' d='Shop.Theme.Lifestyle'}
							</a>
						</div>
					</div>
				{else}
					<span class="regular-text default-text cart-empty">{l s='Your cart is empty' d='Shop.Theme.Lifestyle'}</span>
				{/if}
			</div>
		</div>
	</div>
</div>
