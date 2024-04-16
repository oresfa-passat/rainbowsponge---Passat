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
*  @version  Release: $Revision$
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{nocache}
{if isset($page) && isset($page.page_name) && $page.page_name == 'index'}
{/nocache}
	{if $homeslider.slides}
		<div id="carousel" data-ride="carousel" class="carousel slide custom-slider-bg-color hidden-xs-down" data-interval="{$homeslider.speed}" data-wrap="{(string)$homeslider.wrap}" data-pause="{$homeslider.pause}">
			<ol class="carousel-indicators">
				{foreach from=$homeslider.slides item=slide name='homeslider'}
					<li data-target="#carousel" data-slide-to="{$smarty.foreach.homeslider.index}" class="custom-slider-text-color {if $smarty.foreach.homeslider.first}active{/if}"></li>
				{/foreach}
			</ol>
			<div class="carousel-details">
				<ul class="carousel-inner" role="listbox">
					{foreach from=$homeslider.slides item=slide name='homeslider'}
						<li class="carousel-item {if $smarty.foreach.homeslider.first}active{/if}">
							<a href="{$slide.url}">
								<figure>
									<img src="{$slide.image_url}" alt="{$slide.legend|escape}">
									{if $slide.title || $slide.description}
										<figcaption class="caption">
											<span class="headings headings-alternative headings-large headings-with-bg custom-slider-title-color">{$slide.title}</span>
											<div class="leads lead-with-bg custom-slider-text-color">{$slide.description nofilter}</div>
										</figcaption>
									{/if}
								</figure>
							</a>
						</li>
					{/foreach}
				</ul>
			</div>
		</div>
	{/if}
{/if}
