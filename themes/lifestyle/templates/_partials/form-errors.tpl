{**
* 2007-2017 PrestaShop
*
* NOTICE OF LICENSE
*
* This source file is subject to the Open Software License (OSL 3.0)
* that is bundled with this package in the file LICENSE.txt.
* It is also available through the world-wide-web at this URL:
* http://opensource.org/licenses/osl-3.0.php
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
* @author    PrestaShop SA <contact@prestashop.com>
* @copyright 2007-2017 PrestaShop SA
* @license   https://opensource.org/licenses/AFL-3.0 Academic Free License 3.0 (AFL-3.0)
* International Registered Trademark & Property of PrestaShop SA
*}

{if $errors|count}
	<div class="col-xs-12 alert alert-danger">
		<div class="content-help-info">
			{block name='form_errors'}
				<ul class="bloc-content-alert">
					{foreach $errors as $error}
						<li class="text-alert-danger">
							<svg class="icon-alert-danger" xmlns="http://www.w3.org/2000/svg" width="104.859" height="95.201" viewBox="0 0 104.859 95.201">
  								<g id="Warning_Plan_de_travail_1" data-name="Warning_Plan de travail 1" transform="translate(0 0.001)">
    								<path id="Tracé_798" data-name="Tracé 798" d="M49.16,2,.5,89.41A3.892,3.892,0,0,0,3.9,95.2h97.06a3.9,3.9,0,0,0,3.41-5.78L55.97,2.01A3.893,3.893,0,0,0,49.16,2Z" fill="#aa0c1e" fill-rule="evenodd"/>
									<g id="Groupe_2576" data-name="Groupe 2576">
										<path id="Tracé_799" data-name="Tracé 799" d="M46.97,78.89a5.6,5.6,0,0,1,5.73-5.96c3.51,0,5.73,2.44,5.8,5.96a5.768,5.768,0,1,1-11.53,0Zm2.14-10.77L47.73,32.53h9.93L56.29,68.12Z" fill="#fff"/>
									</g>
								</g>
							</svg>
							{$error}
						</li>
					{/foreach}
				</ul>
			{/block}
		</div>
	</div>
{/if}
