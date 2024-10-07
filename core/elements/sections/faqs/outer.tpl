{foreach $faqs as $index => $item}
<div class="faqs__item">
    <div class="faqs__item-question fs-title-2 fw-600" data-opened-btn="answer-{$index_column}{$index}">{$item['question']} <span class="plus main-color">+</span><span class="minus main-color">-</span></div>
    <div class="faqs__item-answer dark-color" data-opened-element="answer-{$index_column}{$index}">{$item['answer']}</div>
</div>
{/foreach}