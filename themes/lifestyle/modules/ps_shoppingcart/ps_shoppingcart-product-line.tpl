<div class="blockcart-product-detail">
	<div class="row">
		<div class="col-md-4">
			<img src="{$product.cover.bySize.cart_default.url}" alt="{$product.name}" class="img-fluid">
		</div>
		<div class="col-md-8">
			<span class="regular-text small-text bold product-name">{$product.name}</span>
			<span class="regular-text highlight-text product-quantity">{l s='Quantity' d='Shop.Theme.Catalog'}: {$product.quantity}</span>
			<span class="custom-main-text-color product-price">{$product.price}</span>
		</div>
	</div>
	<a  class="remove-from-cart"
		rel="nofollow"
		href="{$product.remove_from_cart_url}"
		data-link-action="remove-from-cart"
		title="{l s='remove from cart' d='Shop.Theme.Actions'}"
	>
		<i class="fa fa-remove"></i>
	</a>
</div>
{if $product.customizations|count}
	<div class="customizations">
		<ul>
			{foreach from=$product.customizations item='customization'}
				<li>
					<span class="product-quantity">{$customization.quantity} {l s='Product customization' d='Shop.Theme.Catalog'}</span>
					<a href="{$customization.remove_from_cart_url}" title="{l s='remove from cart' d='Shop.Theme.Actions'}" class="small-text custom-link-color remove-from-cart" rel="nofollow"><i class="fa fa-times"></i></a>
					<ul>
						{foreach from=$customization.fields item='field'}
							<li>
								<span class="regular-text small-text">{$field.label}</span>
								{if $field.type == 'text'}
									<span class="regular-text small-text">{$field.text nofilter}</span>
								{else if $field.type == 'image'}
									<img src="{$field.image.small.url}">
								{/if}
							</li>
						{/foreach}
					</ul>
				</li>
			{/foreach}
		</ul>
	</div>
{/if}
