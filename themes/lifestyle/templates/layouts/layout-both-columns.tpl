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

<!doctype html>
<html lang="{$language.iso_code}">

	<head>
		{block name='head'}
			{include file='_partials/head.tpl'}
		{/block}
	</head>

	<body id="{$page.page_name}" class="{$page.body_classes|classnames}">
		{block name='hook_after_body_opening_tag'}
			{hook h='displayAfterBodyOpeningTag'}
		{/block}

		<main>
			{block name='product_activation'}
				{include file='catalog/_partials/product-activation.tpl'}
			{/block}

			<header id="header">
				{block name='header'}
					{include file='_partials/header.tpl'}
				{/block}
			</header>

			{block name='notifications'}
				{include file='_partials/notifications.tpl'}
			{/block}

			<section id="wrapper">
				<div class="container">
					{block name='breadcrumb'}
						{include file='_partials/breadcrumb.tpl'}
					{/block}

					{block name="left_column"}
						<div id="left-column" class="col-md-3 col-sm-12">
							{if $page.page_name == 'product'}
								{hook h='displayLeftColumnProduct'}
							{else}
								{hook h="displayLeftColumn"}
							{/if}
						</div>
					{/block}

					{block name="content_wrapper"}
						<div id="content-wrapper" class="left-column right-column col-sm-4 col-md-6">
							{block name="content"}
								<p class="regular-text default-text">Hello world! This is HTML5 Boilerplate.</p>
							{/block}
						</div>
					{/block}

					{block name="right_column"}
						<div id="right-column" class="col-md-3 col-sm-12">
							{if $page.page_name == 'product'}
								{hook h='displayRightColumnProduct'}
							{else}
								{hook h="displayRightColumn"}
							{/if}
						</div>
					{/block}
				</div>
			</section>

			<div class="to-top">
				<a href="#header" class="custom-link-color">
					<i class="fa fa-chevron-up"></i>
				</a>
			</div>

			<footer id="footer">
				{block name="footer"}
					{include file="_partials/footer.tpl"}
				{/block}
			</footer>

		</main>

		{block name='javascript_bottom'}
			{include file="_partials/javascript.tpl" javascript=$javascript.bottom}
		{/block}

		{block name='hook_before_body_closing_tag'}
			{hook h='displayBeforeBodyClosingTag'}
		{/block}
	</body>

</html>
