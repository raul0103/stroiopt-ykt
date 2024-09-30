{* Выборка похожих товаров по длине*}

{set $pricelist_products = 'msProducts' | snippet : [
  'parents' => $_modx->resource.parent
  'tpl' => '@FILE sections/product/tabs/pricelist/tab-pricelist-item.tpl'
  'innerJoin' => '{"Options":{"class":"msProductOption"}}',
  'where' => '{"id:!=":'~$_modx->resource.id~',"Options.key":"dlina-mm", "Options.value:=":"'~$_modx->resource['dlina-mm'][0]~'"}',
  'limit' => $_modx->getPlaceholder('custom-placeholders')['limits']['product-pricelist']
]}

{if $pricelist_products}
<div class="table-container">
  <table>
    <thead>
      <tr>
        <th>Изделие</th>
        <th>Длина, мм</th>
        <th>Ширина, мм</th>
        <th>Высота, мм</th>
        <th>Цена</th>
        <th>Количество</th>
      </tr>
    </thead>
    <tbody>
      {$pricelist_products}
    </tbody>
  </table>
</div>
<a class="btn-additional sm-d-block btn btn-basic" href="{$_modx->resource.parent | resource : 'uri'}">Посмотреть все марки</a>
{/if}
