<div class="col-md-4 links">
	<div class="row">
		{foreach $linkBlocks as $linkBlock}
			<div class="col-md-6 wrapper">
				<p class="headings headings-small hidden-sm-down">{$linkBlock.title}</p>
				{assign var=_expand_id value=10|mt_rand:100000}
				<div class="title clearfix hidden-md-up" data-target="#footer_sub_menu_{$_expand_id}" data-toggle="collapse">
					<p class="headings headings-small">{$linkBlock.title}</p>
					<span class="pull-xs-right">
						<span class="navbar-toggler collapse-icons">
							<i class="fa fa-plus add"></i>
							<i class="fa fa-minus remove"></i>
						</span>
					</span>
				</div>
				<ul id="footer_sub_menu_{$_expand_id}" class="collapse">
				{foreach $linkBlock.links as $link}
					<li>
						<a
						id="{$link.id}-{$linkBlock.id}"
						class="{$link.class} custom-link-color"
						href="{$link.url}"
						title="{$link.description}">
							{$link.title}
						</a>
					</li>
				{/foreach}
				</ul>
			</div>
		{/foreach}
	</div>
</div>
