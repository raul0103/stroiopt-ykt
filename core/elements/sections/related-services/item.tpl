{set $thumb = 'phpthumbof' | snippet : [
  'input' => "{$main_image}",
  'options' => '&w=80&zc=1'
]}

<a class="related-services__item fw-600" href="{$uri}">
  <div
    class="related-services__item-image"
    style="background-image: url('{$thumb}')"
  ></div>
  <div class="related-services__item-title">{$menutitle?:$pagetitle}</div>
</a>
