{set $files = "@FILE snippets/getProductFiles.php" | snippet : [
    "product_id" => $_modx->resource.id
]}

<div class="product-main__gallery">
  <div
    class="swiper product-main__gallery-thumbs"
    data-slider="product-gallery-thumbs"
  >
    <div class="swiper-wrapper">
      {foreach $files as $file}
      <div class="swiper-slide">
        <img src="{$file['thumb']}" loading="lazy" />
      </div>
      {/foreach}
    </div>
    <div class="swiper-button-prev"></div>
    <div class="swiper-button-next"></div>
  </div>

  <div
    class="swiper product-main__gallery-preview"
    data-slider="product-gallery-preview"
  >
    <div class="swiper-wrapper">
      {set $idx = 0}
      {foreach $files as $file}
      <div class="swiper-slide">
        <a
          class="glightbox"
          data-gallery="product-gallery"
          href="{$file['image']}"
          {if $idx == 0}itemscope itemtype="http://schema.org/ImageObject"{/if}
        >
          <img src="{$file['image']}" loading="lazy" {if $idx == 0}itemprop="contentUrl"{/if}/>
        </a>
      </div>

      {set $idx = $idx + 1}
      {/foreach}
    </div>
  </div>
</div>
