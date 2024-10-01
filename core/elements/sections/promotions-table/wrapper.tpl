{set $promotion_products = 'msProducts' | snippet : [
  'parents' => 0
  'tpl' => '@FILE sections/promotions-table/table-item.tpl'
  'where' => '{"Data.old_price:>":"Data.price"}'
]}

{if $promotion_products}
<div class="promotions-table section-margin">
  <div class="table-container">
    <table>
      <thead>
        <tr>
          <th>Фото</th>
          <th>Изделие</th>
          <th>Длина, мм</th>
          <th>Ширина, мм</th>
          <th>Высота, мм</th>
          <th>Цена руб.</th>
          <th>Количество</th>
        </tr>
      </thead>
      <tbody>
        {$promotion_products}
      </tbody>
    </table>
  </div>
  <a class="btn-additional btn btn-primary" href="order/"
    >Перейти к оформлению</a
  >
</div>
{/if}
