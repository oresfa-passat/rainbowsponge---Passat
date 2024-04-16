{*
* 2007-2017 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Academic Free License (AFL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/afl-3.0.php
* If you did not receive a copy of the license and are unable to
* obtain it through the world-wide-web, please send an email
* to license@prestashop.com so we can send you a copy immediately.
*
* DISCLAIMER
*
* Do not edit or add to this file if you wish to upgrade PrestaShop to newer
* versions in the future. If you wish to customize PrestaShop for your
* needs please refer to http://www.prestashop.com for more information.
*
*  @author PrestaShop SA <contact@prestashop.com>
*  @copyright  2007-2017 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

<div id="_desktop_currency_selector" class="pull-lg-right clearfix">
  <div class="currency-selector dropdown js-dropdown custom-link-color">
    <span class="regular-text expand-more _gray-darker hidden-sm-down" data-toggle="dropdown">{$current_currency.iso_code} {$current_currency.sign}</span>
    <a data-target="#" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false" class="hidden-sm-down">
      <i class="fa fa-caret-down expand-more"></i>
    </a>
    <ul class="dropdown-menu hidden-sm-down" aria-labelledby="dLabel">
      {foreach from=$currencies item=currency}
        <li {if $currency.current} class="current" {/if}>
          <a title="{$currency.name}" rel="nofollow" href="{$currency.url}" class="dropdown-item regular-text custom-link-color">
            {$currency.iso_code} {$currency.sign}
          </a>
        </li>
      {/foreach}
    </ul>
    <div class="list-mobile hidden-md-up">
      <select class="link">
        {foreach from=$currencies item=currency}
          <option value="{$currency.url}"{if $currency.current} selected="selected"{/if}>{$currency.iso_code} {$currency.sign}</option>
        {/foreach}
      </select>
    </div>
  </div>
</div>
