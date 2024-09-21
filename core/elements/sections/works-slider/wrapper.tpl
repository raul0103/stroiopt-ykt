{set $data = "@FILE snippets/getJsonData.php" | snippet : [
    "path" => "/assets/template/json/sections/works-slider.json"
]}

{if $data['status'] == 'success'}
<div class="works-slider section-margin">
  <div class="container">
    <h3 class="fs-h3 section-title">
      Мы поставили продукцию более чем на
      <span class="main-color">300</span> объектов !
    </h3>

    <div class="works-slider__row swiper" data-slider="works-slider">
      <div class="swiper-wrapper">
        {foreach $data['message'] as $src}
        <a
          data-gallery="works-slider"
          href="{$src}"
          class="glightbox swiper-slide works-slider__item"
          style="background-image: url('{$src}')"
        ></a>
        {/foreach}
      </div>
    </div>
  </div>
</div>
{/if}
