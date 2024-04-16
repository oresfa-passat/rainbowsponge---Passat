<div class="webcallback block">
	<h4 class="headings headings-small title_block">
		<span>{l s='We call you back' mod='webcallback'}</span>
	</h4>
	<div class="block_content">
		{if isset($wcb_sent)}
			<center><br />{l s='Request sent !' mod='webcallback'}<br /><br /></center>
		{else}
			<p>{l s='Please enter your phone number' mod='webcallback'}, {l s='we remind you' mod='webcallback'} <strong>{l s='less than 3 hours' mod='webcallback'}</strong></p>
			<form method="post" action="" id="wcb_form">
				<table>
					<tr>
						<td class="text-table">{l s='Number' mod='webcallback'}</td>
						<td class="field-table"><input class="form-control" type="text" name="number" size="14" value="{if isset($customer_phone)}{$customer_phone}{/if}" /></td>
					</tr>
				{if $wcb_config.WCB_DELAY == '1'}
					<tr>
						<td class="text-table">{l s='Delay' mod='webcallback'}</td>
						<td class="field-table"><select class="form-control form-control-select" name="delay" style="width:107px;">
								<option value="12">12 {l s='hours' mod='webcallback'}</option>
								<option value="24">24 {l s='hours' mod='webcallback'}</option>
								<option value="48">2 {l s='days' mod='webcallback'}</option>
								<option value="168">1 {l s='week' mod='webcallback'}</option></td>
								</select>
					</tr>
				{/if}
				</table>
				<br /><center><input type="submit" id="SubmitNumber" name="SubmitNumber" value="{l s='Callback Me' mod='webcallback'}" class="btn btn-small custom-button"/></center>
			</form>

		{/if}
	</div>
</div>
