{* Выборка похожих товаров по длине*}
{set $pricelist_products = 'msProducts' | snippet : [
  'parents' => $_modx->resource.parent
  'tpl' => '@FILE templates/product/tabs/pricelist/tab-pricelist-item.tpl'
  'innerJoin' => '{"Options":{"class":"msProductOption"}}',
  '-where' => '{"id:!=":'~$_modx->resource.id~',"Options.key":"dlina-mm", "Options.value:=":"'~$_modx->resource['dlina-mm'][0]~'"}',
  'where' => '{"id:!=":'~$_modx->resource.id~',"Options.key":"marka", "Options.value:!=":null}',
  'limit' => $_modx->getPlaceholder('custom-placeholders')['limits']['product-pricelist']
]}
{if $pricelist_products}
<div class="table-container">
  <table data-swap-table>
    <thead>
      <tr>
        <th>Изделие</th>
        <th>Длина, мм</th>
        <th>Ширина, мм</th>
        <th>Высота, мм</th>
        <th>Цена руб.</th>
        <th>Количество</th>
      </tr>
    </thead>
    <tbody>
      {$pricelist_products}
    </tbody>
  </table>
</div>
<a class="btn-additional sm-d-block btn btn-secondary" href="{$_modx->resource.parent | resource : 'uri'}">Посмотреть все марки</a>
{/if}
