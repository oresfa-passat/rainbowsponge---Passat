{*
* 2007-2017 PrestaShop
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2017 PrestaShop SA
* @license   http://addons.prestashop.com/en/content/12-terms-and-conditions-of-use
* International Registered Trademark & Property of PrestaShop SA
*}
{if $isConnected != false}
{if $buylater_products != false}
<div id="buylater" {if $nb_product_cart eq 0}class="buylater-no-cart-product"{/if}>
    <table cellspacing="0" cellpadding="0" id="buylater_list" class="table table-buylater" style="border: 2px solid {$BUYLATER_BACKGROUND_COLOR|escape:'htmlall':'UTF-8'};">
        <thead>
            <tr>
                <th colspan="5" style="background-color:{$BUYLATER_BACKGROUND_COLOR|escape:'htmlall':'UTF-8'};"><b class="buylater-title" style="color:{$BUYLATER_TITLE_COLOR|escape:'htmlall':'UTF-8'};">{$BUYLATER_TITLE[$id_lang]|escape:'htmlall':'UTF-8'} </b>
                    <span class="heading-counter" style="color:{$BUYLATER_TITLE_COLOR|escape:'htmlall':'UTF-8'};">{l s='Number of item saved for later :' mod='buylater'}
                        <span id="buylater_products_quantity" value="{$buylater_nb_products|escape:'htmlall':'UTF-8'}">{$buylater_nb_products|escape:'htmlall':'UTF-8'}
                        </span> {l s='product(s)' mod='buylater'}
                    </span>
                </th>
            </tr>
            <tr>
                <th class="text-center buylater-img">{l s='Product' mod='buylater'}</th>
                <th class="buylater-description">{l s='Description' mod='buylater'}</th>
                <th class="text-center buylater-availibility">{l s='Availibility' mod='buylater'}</th>
                <th class="text-right buylater-unit-price">{l s='Unit price' mod='buylater'}</th>
                <th class="text-center" width="20%">{l s='Action' mod='buylater'}</th>
            </tr>
        </thead>
        <tbody>
            {foreach from=$buylater_products item=buylater_product}
            <tr class="test">
                <td class="buylater-img-center">
                        <img class="buylater-img-border" src="{$buylater_product.image_link|escape:'htmlall':'UTF-8'}" width="98" height="98"/>
                </td>
                <td>
                    <a class="buylater-product-name" target="_blank" href="{$buylater_product.product_link|escape:'htmlall':'UTF-8'}">
                        {$buylater_product.product_name|escape:'htmlall':'UTF-8'}
                    </a>
                    <div class="buylater-description-content">
                        <div class="buylater-description-content-left">
                            <small>{l s='Ref :' mod='buylater'} {$buylater_product.product_ref|escape:'htmlall':'UTF-8'}</small><br>
                            <small>{$buylater_product.product_name_attribute|escape:'htmlall':'UTF-8'}</small>
                        </div>
                        <div class="buylater-description-content-right">
                            {if $BUYLATER_ALERT_STOCK eq 1 && $buylater_product.availibility <= $BUYLATER_ALERT_STOCK_AT}
                                <span class="buylater-badge-warning"><i class="fa fa-warning"></i> {$buylater_product.availibility|escape:'htmlall':'UTF-8'} {if $buylater_product.availibility eq 1} {l s='product' mod='buylater'}{else} {l s='products' mod='buylater'}{/if} {l s='left in stock' mod='buylater'}</span>
                            {/if}
                        </div>
                    </div>
                    {* <div class="linksBlock">
                        <a class="add_to_cart_from_buylater buylaterLinks" data-id-product="{$buylater_product.id_product|escape:'htmlall':'UTF-8'}" data-id-product-attribute="{$buylater_product.id_product_attribute|escape:'htmlall':'UTF-8'}">{l s='Move to basket' mod='buylater'}</a> |
                        <a class="delete_from_buylater buylaterLinks" data-id-product="{$buylater_product.id_product|escape:'htmlall':'UTF-8'}" data-id-product-attribute="{$buylater_product.id_product_attribute|escape:'htmlall':'UTF-8'}">{l s='Delete' mod='buylater'}</a>
                    </div> *}
                </td>
                <td>
                    <div class="text-center">
                        {if $buylater_product.availibility > 0}
                            <span class="label label-success">{l s='In stock' mod='buylater'}
                                {* {if $BUYLATER_ALERT_STOCK eq 1 && $buylater_product.availibility <= $BUYLATER_ALERT_STOCK_AT}
                                <span class="buylater-badge-warning">
                                    {$buylater_product.availibility|escape:'htmlall':'UTF-8'}
                                </span>
                                {/if} *}
                            </span>
                        {else}
                            <span class="label label-danger">{l s='Out of stock' mod='buylater'}</span>
                        {/if}
                    </div>
                </td>
                <td class="text-right">
                    {if $buylater_product.hasSpecificPrice eq 0}
                        {$currency_sign|escape:'htmlall':'UTF-8'} {$buylater_product.unit_price|escape:'htmlall':'UTF-8'}
                    {else}
                        {if $BUYLATER_CHANGE_PRICE eq 1}
                        <ul class="price text-right">
                            <li class="price special-price">{$currency_sign|escape:'htmlall':'UTF-8'} {$buylater_product.price_with_reduc|escape:'htmlall':'UTF-8'}</li>
                            <li class="price-percent-reduction small">&nbsp;-{$buylater_product.reduction_amount|escape:'htmlall':'UTF-8'}{$buylater_product.reduction_type|escape:'htmlall':'UTF-8'}&nbsp;</li>
                            <li class="old-price">{$currency_sign|escape:'htmlall':'UTF-8'} {$buylater_product.price_without_reduc|escape:'htmlall':'UTF-8'}</li>
                        </ul>
                        {else}
                        {$currency_sign|escape:'htmlall':'UTF-8'} {$buylater_product.unit_price|escape:'htmlall':'UTF-8'}
                        {/if}
                    {/if}
                </td>
                <td>
                    <a class="btn btn-primary add_to_cart_from_buylater buylater-add-button" data-id-product="{$buylater_product.id_product|escape:'htmlall':'UTF-8'}" data-id-product-attribute="{$buylater_product.id_product_attribute|escape:'htmlall':'UTF-8'}" style="background-color:{$BUYLATER_BUTTON_BACKGROUND_COLOR|escape:'htmlall':'UTF-8'};border-color:{$BUYLATER_BUTTON_BACKGROUND_COLOR|escape:'htmlall':'UTF-8'};color:{$BUYLATER_TEXT_BUTTON_COLOR|escape:'htmlall':'UTF-8'}">
                        {$BUYLATER_BUTTON_TITLE[$id_lang]|escape:'htmlall':'UTF-8'}
                    </a>
                    <a class="delete_from_buylater buylaterLinks" data-id-product="{$buylater_product.id_product|escape:'htmlall':'UTF-8'}" data-id-product-attribute="{$buylater_product.id_product_attribute|escape:'htmlall':'UTF-8'}">{l s='Delete' mod='buylater'}</a>
                </td>
            </tr>
            {/foreach}
        </tbody>
    </table>
</div>
{/if}
{else}
<div id="buylater-alert" class="buylater-alert">
    <br>
    <div class="alert alert-info" role="alert">
      <p class="buylater-alert-text">{l s='If you want to save products for later you need to login first :' mod='buylater'} <a class="" href="index.php?controller=authentication">{l s='Sign in' mod='buylater'}</a></p>
    </div>
</div>
{/if}

{literal}
<script type="text/javascript">
    var msg_error = "{/literal}{l s='Error !' mod='buylater'}{literal}";
    var msg_max_product_reached = "{/literal}{l s='You cannot add more than 10 product to your buy later !' mod='buylater'}{literal}";
    var msg_product_alreadt_exist = "{/literal}{l s='This product is already present in your buy later !' mod='buylater'}{literal}";
    var isConnected = "{/literal}{$isConnected|escape:'htmlall':'UTF-8'}{literal}";
    var button_bg_color = "{/literal}{$BUYLATER_BUTTON_BACKGROUND_COLOR}{literal}";
    var button_bg_color_hover = "{/literal}{$BUYLATER_BUTTON_BACKGROUND_COLOR_HOVER}{literal}";
</script>
{/literal}
