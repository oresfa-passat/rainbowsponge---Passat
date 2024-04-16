/**
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
* @license   http://opensource.org/licenses/osl-3.0.php Open Software License (OSL 3.0)
* International Registered Trademark & Property of PrestaShop SA
*/
import $ from 'jquery';

export default class ProductMinitature {
	init(){
		$('.js-product-miniature').each((index, element) => {
			const FLAG_MARGIN = -20;
			let $discount = $(element).find('.discount-product');
			let $sale = $(element).find('.on-sale');
			if($discount.length){
				$sale.css('top', $discount.height() * 3.5 + FLAG_MARGIN);
				$discount.css('top',-$(element).find('.thumbnail-container').height() + $(element).find('.product-description').height() + FLAG_MARGIN);
			}
			if($(element).find('.color').length > 5){
				let count = 0;
				$(element).find('.color').each((index, element) =>{
					if(index > 4){
						$(element).hide();
						count ++;
					}
				});
				$(element).find('.js-count').append(`+${count}`);
			}
		});
	}
}
