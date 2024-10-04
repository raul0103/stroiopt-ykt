{set $data = "@FILE snippets/getJsonData.php" | snippet : [
    "path" => "/assets/template/json/sections/delivery.json"
]}

{if $data['status'] == 'success'}
<div class="table-container">
    <table>
      <thead>
        <tr>
          {foreach $data['message']['header'] as $header}
          <th>{$header}</th>
          {/foreach}
        </tr>
      </thead>
      <tbody>
        {foreach $data['message']['body'] as $items}
        <tr>
          {foreach $items as $item}
          <td>{$item}</td>
          {/foreach}
        </tr>
        {/foreach}
      </tbody>
    </table>
</div>
<button class="btn-additional {if !$show_btn_desktop}sm-d-block{/if} btn btn-primary" onclick="modals.events.open('modal-callback')">Заказать с доставкой</button>
{/if}