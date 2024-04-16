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
<div id="buylater">
<div rv-if="buylater.totalProducts | gt 0">
<div class="buylater-card buylater-container hide" rv-class-hide="buylater.totalProducts | eq 0">
    <div class="buylater-card-block" style="background-color:{$BUYLATER_BACKGROUND_COLOR}">
        <h1 class="h1 buylater-inline-left" style="color:{$BUYLATER_TITLE_COLOR}">{$BUYLATER_TITLE[$id_lang]}</h1>
        <span class="buylater-inline-right" style="color:{$BUYLATER_TITLE_COLOR}">
            <span id="buylater_products_quantity" rv-value="buylater.totalProducts">{ buylater.totalProducts }</span>
            <span rv-if="buylater.totalProducts | eq 1">{l s='product' mod='buylater'}</span>
            <span rv-if="buylater.totalProducts | gt 1">{l s='products' mod='buylater'}</span>
        </span>
    </div>
    <hr>
    <div class="buylater-overview">
        <ul class="buylater-items">
            <li rv-each-product="buylater.products" class="buylater-item">
                <div>
                    <!--  product left content: image-->
                    <div class="buylater-line-grid-left col-md-3 col-xs-4">
                        <span class="buylater-image media-middle">
                            <img rv-src="product.image_link" alt="Faded Short Sleeves T-shirt">
                        </span>
                    </div>
                    <!--  product left body: description -->
                    <div class="buylater-line-grid-body col-md-4 col-xs-8">
                        <div class="buylater-line-info">
                            <a class="label" rv-href="product.product_link" target="_blank">{ product.product_name }</a>
                        </div>
                        <div rv-if="{$BUYLATER_CHANGE_PRICE} | eq 1" class="buylater-line-info">
                            <span rv-if="product.hasSpecificPrice | eq 1" class="value buylater-old-price">{$currency_sign}{ product.price_without_reduc }</span>
                        </div>
                        <div class="buylater-line-info">
                            <span class="value">{$currency_sign}{ product.unit_price }</span>
                            <span rv-if="product.hasSpecificPrice | eq 1" class="buylater-discount">{l s='Save' mod='buylater'} { product.reduction_amount }{ product.reduction_type }</span>
                        </div>
                        <br>
                        <div rv-each-attribute="product.product_name_attribute_dump" class="buylater-line-info">
                            <span class="label">{ attribute }</span>
                        </div>
                    </div>
                    <!--  product left body: description -->
                    <div class="buylater-line-grid-right buylater-line-actions col-md-5 col-xs-12">
                        <div class="row">
                            {* <div class="col-xs-4 hidden-md-up"></div>
                            <div class="col-md-10 col-xs-6">
                                <div class="row"> *}
                                    {* <div class="col-md-6 col-xs-2 price">
                                        <span class="buylater-price"> *}
                                            {* <div class="buylater-description-content-right"> *}
                                            {* </div> *}

                                            {* <span rv-if="product.availibility" class="label label-success">{l s='In stock' mod='buylater'}</span>
                                            <span rv-unless="product.availibility"class="label label-danger">{l s='Out of stock' mod='buylater'}</span> *}

                                            <div class="buylater-row-right-top">
                                                <a class="add_to_cart_from_buylater btn btn-primary buylater-button" rv-data-id-product="product.id_product" rv-data-id-product-attribute="product.id_product_attribute" style="color:{$BUYLATER_TEXT_BUTTON_COLOR};background-color:{$BUYLATER_BUTTON_BACKGROUND_COLOR}">{$BUYLATER_BUTTON_TITLE[$id_lang]|escape:'htmlall':'UTF-8'}</a>
                                                <a class="custom-link-color"><i class="fa fa-trash delete_from_buylater buylater-icon" rv-data-id-product="product.id_product" rv-data-id-product-attribute="product.id_product_attribute"></i></a>
                                            </div>
                                            <div rv-if="{$BUYLATER_ALERT_STOCK} | eq 1" class="buylater-row-right-bot">
                                                <span rv-if="product.availibility | lt {$BUYLATER_ALERT_STOCK_AT}" class="buylater-quantity-left">
                                                    <i class="fa fa-warning"></i> { product.availibility } <span rv-if="product.availibility | eq 1"> {l s='product' mod='buylater'}</span> <span rv-if="product.availibility | gt 1"> {l s='products' mod='buylater'}</span> {l s='left in stock' mod='buylater'}
                                                </span>
                                            </div>
                                            {* <strong>
                                                <div class="linksBlock">
                                                    <a class="add_to_cart_from_buylater buylaterLinks" rv-data-id-product="product.id_product" rv-data-id-product-attribute="product.id_product_attribute">{l s='Move to basket' mod='buylater'}</a> |
                                                    <a class="delete_from_buylater buylaterLinks" rv-data-id-product="product.id_product" rv-data-id-product-attribute="product.id_product_attribute">{l s='Delete' mod='buylater'}</a>
                                                </div>
                                            </strong> *}
                                        {* </span>
                                    </div> *}
                                {* </div>
                            </div> *}
                        </div>
                    </div>
                    <div class="clearfix"></div>
                </div>
            </li>
        </ul>
    </div>
</div>
</div>
</div>
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
    var token = "{/literal}{$token}{literal}";
    var msg_error = "{/literal}{l s='Error !' mod='buylater'}{literal}";
    var msg_max_product_reached = "{/literal}{l s='You cannot add more than 10 product to your buy later !' mod='buylater'}{literal}";
    var msg_product_alreadt_exist = "{/literal}{l s='This product is already present in your buy later !' mod='buylater'}{literal}";
    var front_controller = "{/literal}{$front_controller}{literal}";
    var isConnected = "{/literal}{$isConnected}{literal}";
    var button_bg_color = "{/literal}{$BUYLATER_BUTTON_BACKGROUND_COLOR}{literal}";
    var button_bg_color_hover = "{/literal}{$BUYLATER_BUTTON_BACKGROUND_COLOR_HOVER}{literal}";
</script>
{/literal}
