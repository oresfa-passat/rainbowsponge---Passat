<div class="tab-pane fade{if !$product.description} in active{/if}"
id="product-details"
data-product="{$product.embedded_attributes|json_encode}"
>
	{block name='product_reference'}
		{if isset($product_manufacturer->id)}
			<div class="product-manufacturer">
				{if isset($manufacturer_image_url)}
					<a href="{$product_brand_url}">
						<img src="{$manufacturer_image_url}" class="img img-thumbnail manufacturer-logo" />
					</a>
					{else}
					<span class="regular-text small-text text-uppercase label">{l s='Brand' d='Shop.Theme.Catalog'}</span>
					<span>
						<a href="{$product_brand_url}">{$product_manufacturer->name}</a>
					</span>
				{/if}
			</div>
		{/if}
		{if isset($product.reference_to_display) && $product.reference_to_display neq ''}
			<div class="product-reference">
				<span class="regular-text small-text text-uppercase label">{l s='Reference' d='Shop.Theme.Catalog'} </span>
				<span class="regular-text small-text" itemprop="sku">{$product.reference_to_display}</span>
			</div>
		{/if}
	{/block}

	{block name='product_quantities'}
		{if $product.show_quantities}
			<div class="product-quantities">
				<span class="regular-text small-text text-uppercase label">{l s='In stock' d='Shop.Theme.Catalog'}</span>
				<span class="regular-text small-text" data-stock="{$product.quantity}" data-allow-oosp="{$product.allow_oosp}">{$product.quantity} {$product.quantity_label}</span>
			</div>
		{/if}
	{/block}

	{block name='product_availability_date'}
		{if $product.availability_date}
			<div class="product-availability-date">
				<span class="regular-text small-text text-uppercase label">{l s='Availability date:' d='Shop.Theme.Catalog'} </span>
				<span class="regular-text small-text">{$product.availability_date}</span>
			</div>
		{/if}
	{/block}

	{block name='product_out_of_stock'}
		<div class="product-out-of-stock">
			{hook h='actionProductOutOfStock' product=$product}
		</div>
	{/block}

	{block name='product_features'}
		{if $product.features}
			<section class="product-features">
				<span class="regular-text small-text text-uppercase label">{l s='Data sheet' d='Shop.Theme.Catalog'}</span>
				<dl class="data-sheet">
					{foreach from=$product.features item=feature}
						<dt class="name">{$feature.name}</dt>
						<dd class="value">{$feature.value}</dd>
					{/foreach}
				</dl>
			</section>
		{/if}
	{/block}

	{* if product have specific references, a table will be added to product details section *}
	{block name='product_specific_references'}
		{if isset($product.specific_references)}
			<section class="product-features">
				<span class="regular-text small-text text-uppercase label">{l s='Specific References' d='Shop.Theme.Catalog'}</span>
				<dl class="data-sheet">
				{foreach from=$product.specific_references item=reference key=key}
					<dt class="name">{$key}</dt>
					<dd class="value">{$reference}</dd>
				{/foreach}
				</dl>
			</section>
		{/if}
	{/block}

	{block name='product_condition'}
		{if $product.condition}
			<div class="product-condition">
				<span class="regular-text small-text text-uppercase label">{l s='Condition' d='Shop.Theme.Catalog'} </span>
				<link itemprop="itemCondition" href="{$product.condition.schema_url}"/>
				<span class="regular-text small-text">{$product.condition.label}</span>
			</div>
		{/if}
	{/block}
</div>
