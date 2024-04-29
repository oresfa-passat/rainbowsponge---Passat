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
		<div id="checkout-login-form" class="tab-pane {if !$show_login_form}active{/if}" role="tabpanel">
			{render file='checkout/_partials/login-form.tpl' ui=$login_form}
		</div>

		<div class="tab-content">
			<div id="checkout-create-account-form" class="tab-pane {if $show_login_form}active{/if}" role="tabpanel">
				{render file='checkout/_partials/customer-create-form.tpl' ui=$register_form guest_allowed=$guest_allowed}
			</div>
		</div>

		<div class="tab-content">
			<div id="checkout-guest-form" class="tab-pane {if $show_login_form}active{/if}" role="tabpanel">
				{render file='checkout/_partials/customer-form.tpl' ui=$register_form guest_allowed=$guest_allowed}
			</div>
		</div>


	{/if}
{/block}
