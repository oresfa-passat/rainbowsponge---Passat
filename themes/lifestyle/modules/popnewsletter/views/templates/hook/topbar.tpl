{if $popup->logo}
<div id="popnewsletter_topbar" style="width:100%;padding:16px 0px 10px 0px">
{if $ps_version <= '1.6'}
	<img src="{$logo_url}" />
{else}
	<img src="{$shop.logo}" />
{/if}
</div>

{/if}
{if $popup->title}
<div id="popnewsletter_topbar" style="width:100%;padding:16px 0px 8px 0px">
	<div style="text-align:center">
		<div style="font-family:{$popup->title_font|escape:'htmlall':'UTF-8'};color:{$popup->title_fontcolor|escape:'quotes'};font-size:{$popup->title_fontsize|intval}px;padding:0px 4px 0px 4px;line-height:85%;">
			{$popup->getLangAttribute($context->cookie->id_lang, 'title_textlang', $context->shop->id)}
		</div>
	</div>
</div>
{/if}