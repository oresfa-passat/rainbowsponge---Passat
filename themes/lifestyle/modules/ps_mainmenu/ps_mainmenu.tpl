{assign var=_counter value=0}
{function name="menu" nodes=[] depth=0 parent=null}
{if $nodes|count}
	<ul class="top-menu clearfix" {if $depth == 0}id="top-menu"{/if} data-depth="{$depth}">
		{foreach from=$nodes item=node}
			<li class="{$node.type}{if $node.current} current {/if}" id="{$node.page_identifier}">
			{assign var=_counter value=$_counter+1}
				<a
				class="{if $depth >= 0}dropdown-item{/if}{if $depth === 1} dropdown-submenu{/if} {if $node.open_in_new_window}external-link{else}internal-link{/if} custom-link-color"
				href="{$node.url}" data-depth="{$depth}"
				{if $node.open_in_new_window} target="_blank" {/if}
				>
					{if $node.children|count}
					{* Cannot use page identifier as we can have the same page several times *}
					{assign var=_expand_id value=10|mt_rand:100000}
					<span class="pull-xs-right hidden-md-up">
						<span data-target="#top_sub_menu_{$_expand_id}" data-toggle="collapse" class="navbar-toggler collapse-icons">
							<i class="fa fa-chevron-down add"></i>
							<i class="fa fa-chevron-up remove"></i>
						</span>
					</span>
					{/if}
					<span class="regular-text">{$node.label}</span>
				</a>
				{if $node.children|count}
					<div {if $depth === 0} class="sub-menu js-sub-menu collapse animated fadeIn clearfix"{else} class="collapse"{/if} id="top_sub_menu_{$_expand_id}">
						{menu nodes=$node.children depth=$node.depth parent=$node}
					</div>
				{/if}
			</li>
		{/foreach}
	</ul>
{/if}
{/function}

<div class="main-menu">
	<div class="menu js-top-menu hidden-sm-down" id="_desktop_top_menu">
		{menu nodes=$menu.children}
		<div class="clearfix"></div>
	</div>
</div>
