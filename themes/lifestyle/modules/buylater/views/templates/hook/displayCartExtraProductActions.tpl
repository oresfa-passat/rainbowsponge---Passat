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
{if $ps_version} {* IF USER IS ON PS 1.7 *}
    {if $BUYLATER_IGNORE eq 2}
        {if !$product.id_category_default|in_array:$BUYLATER_EXCLUDE_CATEGORIES}
            <a class="add_to_buylater buylaterLink custom-link-color" data-id-product="{$product['id_product']|escape:'htmlall':'UTF-8'}" data-id-product-attribute="{$product['id_product_attribute']|escape:'htmlall':'UTF-8'}"
            data-ids="{$product['id_product']|escape:'htmlall':'UTF-8'}_{$product['id_product_attribute']|escape:'htmlall':'UTF-8'}_0_{$id_address_delivery|escape:'htmlall':'UTF-8'}" data-id-customer="{$id_customer|escape:'htmlall':'UTF-8'}"><i class="fa fa-clock-o" title="{l s='Save for later' mod='buylater'}"></i></i></a>
        {/if}
    {else}
        <a class="add_to_buylater buylaterLink custom-link-color" data-id-product="{$product['id_product']|escape:'htmlall':'UTF-8'}" data-id-product-attribute="{$product['id_product_attribute']|escape:'htmlall':'UTF-8'}"
        data-ids="{$product['id_product']|escape:'htmlall':'UTF-8'}_{$product['id_product_attribute']|escape:'htmlall':'UTF-8'}_0_{$id_address_delivery|escape:'htmlall':'UTF-8'}" data-id-customer="{$id_customer|escape:'htmlall':'UTF-8'}"><i class="fa fa-clock-o" title="{l s='Save for later' mod='buylater'}"></i></i></a>
    {/if}
{else} {* IF USER IS ON PS 1.6 *}
    {if $BUYLATER_IGNORE eq 2}
        {if !$product.id_category_default|in_array:$BUYLATER_EXCLUDE_CATEGORIES}
            {if $product['id_customization']}
                <a class="add_to_buylater buylaterLink" data-id-product="{$product['id_product']|escape:'htmlall':'UTF-8'}" data-id-product-attribute="{$product['id_product_attribute']|escape:'htmlall':'UTF-8'}"
                data-ids="{$product['id_product']|escape:'htmlall':'UTF-8'}_{$product['id_product_attribute']|escape:'htmlall':'UTF-8'}_{$product['id_customization']|escape:'htmlall':'UTF-8'}_{$id_address_delivery|escape:'htmlall':'UTF-8'}" data-id-customer="{$id_customer|escape:'htmlall':'UTF-8'}">{l s='Save for later' mod='buylater'}</a>
            {else}
                <a class="add_to_buylater buylaterLink" data-id-product="{$product['id_product']|escape:'htmlall':'UTF-8'}" data-id-product-attribute="{$product['id_product_attribute']|escape:'htmlall':'UTF-8'}"
                data-ids="{$product['id_product']|escape:'htmlall':'UTF-8'}_{$product['id_product_attribute']|escape:'htmlall':'UTF-8'}_0_{$id_address_delivery|escape:'htmlall':'UTF-8'}" data-id-customer="{$id_customer|escape:'htmlall':'UTF-8'}">{l s='Save for later' mod='buylater'}</a>
            {/if}
        {/if}
    {else}
        {if $product['id_customization']}
            <a class="add_to_buylater buylaterLink" data-id-product="{$product['id_product']|escape:'htmlall':'UTF-8'}" data-id-product-attribute="{$product['id_product_attribute']|escape:'htmlall':'UTF-8'}"
            data-ids="{$product['id_product']|escape:'htmlall':'UTF-8'}_{$product['id_product_attribute']|escape:'htmlall':'UTF-8'}_{$product['id_customization']|escape:'htmlall':'UTF-8'}_{$id_address_delivery|escape:'htmlall':'UTF-8'}" data-id-customer="{$id_customer|escape:'htmlall':'UTF-8'}">{l s='Save for later' mod='buylater'}</a>
        {else}
            <a class="add_to_buylater buylaterLink" data-id-product="{$product['id_product']|escape:'htmlall':'UTF-8'}" data-id-product-attribute="{$product['id_product_attribute']|escape:'htmlall':'UTF-8'}"
            data-ids="{$product['id_product']|escape:'htmlall':'UTF-8'}_{$product['id_product_attribute']|escape:'htmlall':'UTF-8'}_0_{$id_address_delivery|escape:'htmlall':'UTF-8'}" data-id-customer="{$id_customer|escape:'htmlall':'UTF-8'}">{l s='Save for later' mod='buylater'}</a>
        {/if}
    {/if}
{/if}

{literal}
<script type="text/javascript">
    var buylater_front_controller = "{/literal}{$front_controller}{literal}";
    var token = "{/literal}{$token|escape:'htmlall':'UTF-8'}{literal}";
    var isConnected = "{/literal}{$isConnected|escape:'htmlall':'UTF-8'}{literal}";
</script>
{/literal}
