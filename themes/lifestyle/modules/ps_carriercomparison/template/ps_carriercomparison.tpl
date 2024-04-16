{*
* 2007-2015 PrestaShop
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
*  @copyright  2007-2015 PrestaShop SA
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}
<div class="js-carrier-compare"
data-url="{url entity='module' name='ps_carriercomparison' controller='carrier_comparison'}"
data-item="{$carrierComparisonInfo|@json_encode}"
data-method="{$refreshMethod}">
	<form method="post" action="#">
		<fieldset>
			<h3 class="headings headings-medium">
				{l s='Estimate the cost of shipping & taxes.' d='Modules.Carriercomparison.Shop'}
			</h3>
			<div class="form-group row">
				<div class="col-md-12">
					<label class="form-control-label">{l s='Country' d='Modules.Carriercomparison.Shop'}</label>
					<select name="id_country" class="form-control form-control-select">
						{foreach from=$countries item=country}
							<option value="{$country.id_country}" {if $carrierComparisonInfo['idCountry'] == $country.id_country}selected="selected"{/if}>{$country.name}</option>
						{/foreach}
					</select>
				</div>
			</div>

			<div class="js-states">
				<div class="form-group row">
					<div class="col-md-12">
						<label class="form-control-label">{l s='State' d='Modules.Carriercomparison.Shop'}</label>
						<select name="id_state" class="form-control form-control-select">
							<option></option>
						</select>
					</div>
				</div>
			</div>

			<div class="form-group row">
				<div class="col-md-12">
					<label class="form-control-label">{l s='Zip Code' d='Modules.Carriercomparison.Shop'}</label>
					<span class="form-control-comment">
						({l s='Needed for certain carriers.' d='Modules.Carriercomparison.Shop'})
					</span>
					<input class="form-control" type="text" name="zipcode" value="{$carrierComparisonInfo['zipCode']}"/> 
					<div class="js-carriers" style="display: none;"></div>
				</div>
			</div>

			<table class="table">
				<thead>
					<tr>
						<th></th>
						<th class="text-uppercase bold">{l s='Carrier' d='Modules.Carriercomparison.Shop'}</th>
						<th class="text-uppercase bold">{l s='Information' d='Modules.Carriercomparison.Shop'}</th>
						<th class="text-uppercase bold">{l s='Price' d='Modules.Carriercomparison.Shop'}</th>
					</tr>
				</thead>
				<tbody id="carriers_list">

				</tbody>
			</table>
			<input class="btn btn-small custom-button js-carrier-compare-submit" type="button" value="{l s='Update cart' d='Modules.Carriercomparison.Shop'}"/>
			<input class="btn btn-small custom-button js-carrier-compare-estimate" type="button" value="{l s='Estimate Shipping Cost' d='Modules.Carriercomparison.Shop'}" />
		</fieldset>
	</form>
</div>
