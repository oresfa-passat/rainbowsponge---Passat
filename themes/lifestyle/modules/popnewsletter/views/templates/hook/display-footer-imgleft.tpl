<div style="display:none">
	<div id="popnewsletter">
		<div class="close show-for-small-only" style="display:none">
		<i class="fa fa-times">x</i>
		</div>
		<div class="text-center" style="width: 100%;">
			<div id="popnewsletter_sideimg" style="width:50%;float:left;padding:10px;">
				<img width="100%" src="{$module_img_dir}{$context->cookie->id_lang|intval}/{$image_name|escape:'htmlall':'UTF-8'}" />
			</div>
			<div id="popnewsletter_block" style="width:50%;float:left;height:38%;text-align:center">
			{include file="./topbar.tpl"}
				<div id="popnewsletter_content">
					<div style="font-family:{$popup->maintext_font|escape:'htmlall':'UTF-8'};color:{$popup->maintext_fontcolor|escape:'quotes'};">
						<div id="popnewsletter_maintext" style="line-height: 1.4em;padding-bottom: 4px;font-size:{$popup->maintext_fontsize|intval}px;padding: 0px 4px 0px 4px">
							{$popup->getLangAttribute($context->cookie->id_lang, 'maintext_textlang', $context->shop->id)}
						</div>
						{if $popup->asknames}
							<div style="line-height:3em;margin-top:{$margintop|escape:'htmlall':'UTF-8'}%">
							<input data-required="{$popup->asknames_required|escape:'htmlall':'UTF-8'}" style="width:45%; display: inline;margin-right: 10px;" class="form-control input-sm" type="text" name="popnewsletter_firstname" value="" id="popnewsletter_firstname" size="10" placeholder="{l s='Firstname' mod='popnewsletter'}"/>
							<input data-required="{$popup->asknames_required|escape:'htmlall':'UTF-8'}" style="width:45%; display: inline;" class="form-control input-sm" type="text" name="popnewsletter_lastname" value="" id="popnewsletter_lastname" size="10" placeholder="{l s='Lastname' mod='popnewsletter'}" />
							</div>
						{/if}
						{if $popup->askgender}
							<div style="padding:25px 0px 0px 0px; display: inline-block;">
								<div class="radio" style="display: inline;">
									<label class="radio-inline">
										<span class="custom-radio">
											<input class="form-control" type="radio" name="popnewsletter_askgender" value="1">
											<span></span>
										</span>
										<span class="label label-title">{l s='Man' mod='popnewsletter'}</span>
									</label>
								</div>
								<div class="radio" style="display: inline;">
									<label class="radio-inline">
										<span class="custom-radio">
											<input class="form-control" type="radio" name="popnewsletter_askgender" value="2">
											<span></span>
										</span>
										<span class="label label-title">{l s='Woman' mod='popnewsletter'}</span>
									</label>
								</div>
							</div>
						{/if}
						{if $popup->askbirth}
							<div style="display: inline-block;">
								<div class="btn-group bootstrap-select" style="line-height:3em;margin-top:{$margintop|escape:'htmlall':'UTF-8'}%;">
									<select class="form-control form-control-select input-sm btn-default" class="year" name="popnewsletter_askbirth">
										{for $foo=1940 to 2015}
											<option value="{$foo|escape:'htmlall':'UTF-8'}">{$foo|escape:'htmlall':'UTF-8'}</option>
										{/for}
									</select>
								</div>
							</div>
						{/if}
					</div>
					<div style="line-height: 3.5em;">
						<input class="form-control input-sm" style="margin: 15px auto 5px;width:70%;font-family:{$popup->input_font|escape:'htmlall':'UTF-8'};color:{$popup->input_fontcolor|escape:'quotes'};font-size:{$popup->input_fontsize|intval}px"
						type="text" name="popnewsletter_email" id="popnewsletter_email" placeholder="{$popup->getLangAttribute($context->cookie->id_lang, 'input_textlang', $context->shop->id)|escape:'htmlall':'UTF-8'}" value="" />
						<input style="width:70%;background-color:{$popup->submit_backgroundcolor|escape:'quotes'};font-family:{$popup->submit_font|escape:'htmlall':'UTF-8'};color:{$popup->submit_fontcolor|escape:'quotes'};font-size:{$popup->submit_fontsize|intval}px;"
						 class="btn btn-default" id="popnewsletter_submit" type="submit" name="popnewsletter_submit" value="{$popup->getLangAttribute($context->cookie->id_lang, 'submit_textlang', $context->shop->id)|escape:'htmlall':'UTF-8'}" />
					</div>
					<div style="line-height: 2em;font-family:{$popup->reinsurance_font|escape:'htmlall':'UTF-8'};color:{$popup->reinsurance_fontcolor|escape:'quotes'};font-size:{$popup->reinsurance_fontsize|intval}px;padding:0px 4px 0px 4px;margin-top:{$margintop|escape:'htmlall':'UTF-8'}%">
						{$popup->getLangAttribute($context->cookie->id_lang, 'reinsurance_textlang', $context->shop->id)}
					</div>
				</div>
			</div>
		</div>
	</div>
</div>
{include file='./style.tpl'}
{if $ps_version <= '1.6'}
	{include file='./js_1-6.tpl'}
{else}
	{include file='./js_1-7.tpl'}
{/if}
