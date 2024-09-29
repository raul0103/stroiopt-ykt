{set $product_data = '@FILE modules/cart/backend/snippets/getProductData.php' | snippet : [
    'product_id' => $id
]}
<tr>
    <td><a href="{$uri}">{$pagetitle}</a></td>
    <td>{$_pls["dlina-mm"][0]}</td>
    <td>{$_pls["shirina-mm"][0]}</td>
    <td>{$_pls["vysota-mm"][0]}</td>
    <td>{$price}</td>
    <td>{include "file:modules/cart/frontend/chunks/cart-product-controls.tpl" product_count=$product_data['count']}</td>
</tr>