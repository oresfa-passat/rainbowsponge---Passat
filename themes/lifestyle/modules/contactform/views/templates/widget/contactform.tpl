<section class="contact-form">
	<form action="{$urls.pages.contact}" method="post" {if $contact.allow_file_upload}enctype="multipart/form-data"{/if}>

		{if $notifications}
			<div class="col-xs-12 alert {if $notifications.nw_error}alert-danger{else}alert-success{/if}">
				<div class="content-help-info">
					<ul>
						{foreach $notifications.messages as $notif}
							<li>{$notif}</li>
						{/foreach}
					</ul>
				</div>
			</div>
		{/if}

		<section class="form-fields">

			<div class="form-group row">
				<div class="col-md-9 col-md-offset-3">
					<h3 class="headings headings-medium text-uppercase">{l s='Contact us' d='Shop.Theme.Global'}</h3>
				</div>
			</div>

			<div class="form-group row">
				<div class="col-md-9">
					<label class="form-control-label">{l s='Subject' d='Shop.Forms.Labels'}</label>
					<select name="id_contact" class="form-control form-control-select">
						{foreach from=$contact.contacts item=contact_elt}
							<option value="{$contact_elt.id_contact}">{$contact_elt.name}</option>
						{/foreach}
					</select>
				</div>
			</div>

			<div class="form-group row">
				<div class="col-md-9">
					<label class="form-control-label">{l s='Email address' d='Shop.Forms.Labels'}</label>
					<input
					class="form-control"
					name="from"
					type="email"
					value="{$contact.email}"
					placeholder="{l s='your@email.com' d='Shop.Forms.Help'}"
					>
				</div>
			</div>

			{if $contact.orders}
				<div class="form-group row">
					<div class="col-md-9">
						<label class="form-control-label">{l s='Order reference' d='Shop.Forms.Labels'}</label>
						<span class="form-control-comment">
							{l s='optional' d='Shop.Forms.Help'}
						</span>
						<select name="id_order" class="form-control form-control-select">
							<option value="">{l s='Select reference' d='Shop.Forms.Help'}</option>
							{foreach from=$contact.orders item=order}
								<option value="{$order.id_order}">{$order.reference}</option>
							{/foreach}
						</select>
					</div>
				</div>
			{/if}

			{if $contact.allow_file_upload}
				<div class="form-group row">
					<div class="col-md-9">
						<label class="form-control-label">{l s='Attachment' d='Shop.Forms.Labels'}</label>
						<span class="form-control-comment">
							{l s='optional' d='Shop.Forms.Help'}
						</span>
						<input type="file" name="fileUpload" class="filestyle">
					</div>
				</div>
			{/if}

			<div class="form-group row">
				<div class="col-md-9">
					<label class="form-control-label">{l s='Message' d='Shop.Forms.Labels'}</label>
					<textarea
					class="form-control"
					name="message"
					placeholder="{l s='How can we help?' d='Shop.Forms.Help'}"
					rows="3"
					>{if $contact.message}{$contact.message}{/if}</textarea>
				</div>
			</div>
			{if isset($id_module)}
				{hook h='displayGDPRConsent' id_module=$id_module}
			{/if}
		</section>

		<footer class="form-footer text-xs-right">
			<style>
			input[name=url] {
				display: none !important;
			}
			</style>
			<input type="text" name="url" value=""/>
			<input type="hidden" name="token" value="{$token}" />
			<input class="btn btn-small custom-button" type="submit" name="submitMessage" value="{l s='Send' d='Shop.Theme.Actions'}">
		</footer>

	</form>
</section>
