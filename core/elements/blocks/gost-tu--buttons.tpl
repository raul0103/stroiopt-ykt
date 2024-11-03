<div class="gost-tu--buttons">
  <button data-gost-tu--btn data-value="gost" class="btn btn-secondary active">ГОСТ</button>

  {set $ids_plitperekritiya = 'ids_plitperekritiya' | config}
  {set $ids_plitperekritiya = $ids_plitperekritiya ? ($ids_plitperekritiya | split) : []  }
  {if $_modx->resource.parent not in list $ids_plitperekritiya}
    <button data-gost-tu--btn data-value="tu" class="btn btn-secondary">ТУ</button>
  {/if}
</div>
