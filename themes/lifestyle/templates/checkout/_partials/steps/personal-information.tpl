{extends file='checkout/_partials/steps/checkout-step.tpl'}

{block name='step_content'}
	{if $customer.is_logged && !$customer.is_guest}

		<p class="regular-text default-text identity">
			{* [1][/1] is for a HTML tag. *}
			{l s='Connected as [1]%firstname% %lastname%[/1].'
			d='Shop.Theme.Customeraccount'
			sprintf=[
			'[1]' => "<a href='{$urls.pages.identity}'>",
			'[/1]' => "</a>",
			'%firstname%' => $customer.firstname,
			'%lastname%' => $customer.lastname
			]
			}
		</p>
		<p class="regular-text default-text">
			{* [1][/1] is for a HTML tag. *}
			{l
			s='Not you? [1]Log out[/1]'
			d='Shop.Theme.Customeraccount'
			sprintf=[
			'[1]' => "<a href='{$urls.actions.logout}'>",
			'[/1]' => "</a>"
			]
			}
		</p>
		{if !isset($empty_cart_on_logout) || $empty_cart_on_logout}
			<p class="small-text highlight-text">
				{l s='If you sign out now, your cart will be emptied.' d='Shop.Theme.Checkout'}
			</p>
		{/if}

	{else}

		<ul class="nav nav-inline m-y-2" role="tablist">
			<li class="nav-item">
				<a class="regular-text custom-link-color nav-link {if !$show_login_form}active{/if}" data-toggle="tab" href="#checkout-guest-form" role="tab" aria-controls="checkout-guest-form" {if !$show_login_form} aria-selected="true"{/if}>
				{if $guest_allowed}
					{l s='Order as a guest' d='Shop.Theme.Checkout'}
				{else}
					{l s='Create an account' d='Shop.Theme.Customeraccount'}
				{/if}
				</a>
			</li>

			<li class="nav-item">
				<span clas="regular-text default-text" href="nav-separator"> | </span>
			</li>

			<li class="nav-item">
				<a
				class="regular-text custom-link-color nav-link {if $show_login_form}active{/if}"
				data-link-action="show-login-form"
				data-toggle="tab"
				href="#checkout-login-form"
				role="tab"
				>
					{l s='Sign in' d='Shop.Theme.Actions'}
				</a>
			</li>
		</ul>

		<div class="tab-content">
			<div class="tab-pane {if !$show_login_form}active{/if}" id="checkout-guest-form" role="tabpanel">
				{render file='checkout/_partials/customer-form.tpl' ui=$register_form guest_allowed=$guest_allowed}
			</div>
			<div class="tab-pane {if $show_login_form}active{/if}" id="checkout-login-form" role="tabpanel">
				{render file='checkout/_partials/login-form.tpl' ui=$login_form}
			</div>
		</div>


	{/if}
{/block}
