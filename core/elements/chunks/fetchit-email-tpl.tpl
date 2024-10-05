{set $fields = [
    'name' => 'Имя / Контактное лицо',
    'phone' => 'Телефон',
    'email' => 'Почта',
    'product-buy-one-click' => 'Купить в один клик',
    'city'=>'Город',
    'street'=>'Улица',
    'comment'=>'Комментарий',
    'company_name'=>'Название компании',
    'yur-address'=>'Юрилический адрес',
    'innkpp'=>'ИНН/КПП',
    'payment'=>'Оплата',
]}

{foreach $fields as $field => $field_name}
    {set $value = $_pls[$field]}
    {if $value}
        <p><b>{$field_name}</b>: {$value}</p>
    {/if}
{/foreach}
