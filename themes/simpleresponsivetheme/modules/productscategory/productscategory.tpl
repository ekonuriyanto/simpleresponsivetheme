{*
* 2007-2012 PrestaShop 
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
*  @copyright  2007-2012 PrestaShop SA
*  @version  Release: $Revision: 8337 $
*  @license    http://opensource.org/licenses/afl-3.0.php  Academic Free License (AFL 3.0)
*  International Registered Trademark & Property of PrestaShop SA
*}

{if count($categoryProducts) > 0 && $categoryProducts !== false}
<div class="clearfix blockproductscategory">
	<h2 class="productscategory_h2">{$categoryProducts|@count} {l s='other products in the same category:' mod='productscategory'}</h2>
	<div id="{if count($categoryProducts) > 5}productscategory{else}productscategory_noscroll{/if}">
	{if count($categoryProducts) > 5}<a id="productscategory_scroll_left" title="{l s='Previous' mod='productscategory'}" href="javascript:{ldelim}{rdelim}">{l s='Previous' mod='productscategory'}</a>{/if}
	<div id="productscategory_list">
		<ul class="block-grid ten-up mobile-two-up">
			{foreach from=$categoryProducts item='categoryProduct' name=categoryProduct}
			<li>
				<a href="{$link->getProductLink($categoryProduct.id_product, $categoryProduct.link_rewrite, $categoryProduct.category, $categoryProduct.ean13)}" class="lnk_img align_center" title="{$categoryProduct.name|htmlspecialchars}">
					<img src="{$link->getImageLink($categoryProduct.link_rewrite, $categoryProduct.id_image, 'home_default')}" alt="{$categoryProduct.name|htmlspecialchars}" />
				</a>
				<p class="product_name">
					<a href="{$link->getProductLink($categoryProduct.id_product, $categoryProduct.link_rewrite, $categoryProduct.category, $categoryProduct.ean13)}" title="{$categoryProduct.name|htmlspecialchars}">{$categoryProduct.name|truncate:14:'...'|escape:'htmlall':'UTF-8'}</a>
				</p>
				{if $ProdDisplayPrice AND $categoryProduct.show_price == 1 AND !isset($restricted_country_mode) AND !$PS_CATALOG_MODE}
				<p class="price_display align_center">
					<span class="price">{convertPrice price=$categoryProduct.displayed_price}</span>
				</p>
				{else}
				<br />
				{/if}
			</li>
			{/foreach}
		</ul>
	</div>
	{if count($categoryProducts) > 5}<a id="productscategory_scroll_right" title="{l s='Next' mod='productscategory'}" href="javascript:{ldelim}{rdelim}">{l s='Next' mod='productscategory'}</a>{/if}
	</div>
	<script type="text/javascript">
		$('#productscategory_list').trigger('goto', [{$middlePosition}-3]);
	</script>
</div>
{/if}
