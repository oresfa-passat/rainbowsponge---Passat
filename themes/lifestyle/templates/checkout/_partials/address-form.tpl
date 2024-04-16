{extends file='customer/_partials/address-form.tpl'}

{block name='form_field'}
	{if $field.name eq "alias"}
		{* we don't ask for alias here *}
	{else}
		{$smarty.block.parent}
	{/if}
{/block}

{block name='form_fields' append}
	<input type="hidden" name="saveAddress" value="{$type}">
	{if $type === "delivery"}
		<div class="form-group row">
			<div class="col-md-12">
				<div class="checkbox">
					<span class="custom-checkbox">
						<input name = "use_same_address" type = "checkbox" value = "1" {if $use_same_address} checked {/if}>
						<span class="custom-checkbox-checked"><i class="fa fa-check checkbox-checked"></i></span>
						<label>{l s='Use this address for invoice too' d='Shop.Theme.Checkout'}</label >
					</span>
				</div>
			</div>
		</div>
	{/if}
{/block}

{block name='form_buttons'}
	{if !$form_has_continue_button}
		<button type="submit" class="btn btn-small custom-button pull-xs-right">{l s='Save' d='Shop.Theme.Actions'}</button>
		<a class="regular-text custom-link-color underline js-cancel-address cancel-address pull-xs-right" href="?cancelAddress={$type}">{l s='Cancel' d='Shop.Theme.Actions'}</a>
	{else}
		<form>
			<button type="submit" class="continue btn btn-small custom-button pull-xs-right" name="confirm-addresses" value="1">
				{l s='Continue' d='Shop.Theme.Actions'}
			</button>
			{if $customer.addresses|count > 0}
				<a class="regular-text custom-link-color underline js-cancel-address cancel-address pull-xs-right" href="?cancelAddress={$type}">
					{l s='Cancel' d='Shop.Theme.Actions'}
				</a>
			{/if}
		</form>
	{/if}
{/block}
