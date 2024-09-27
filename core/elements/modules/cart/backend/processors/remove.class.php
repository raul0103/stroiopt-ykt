<?php

require_once dirname(__DIR__) . '/classes/main.class.php';

class remove extends Main
{
    /**
     * @param mixed $product_data
     * @return mixed $product_data - Обновленный массив данных
     */
    public function process($product_data)
    {
        $cart_items = $this->session->get();

        if (!empty($cart_items)) {
            foreach ($cart_items as $key => &$cart_item) {
                if ($cart_item['id'] == $product_data['id']) {
                    unset($cart_items[$key]);
                    break;
                }
            }
        }

        $this->session->set($cart_items);

        return [
            "product_total" => count($cart_items)
        ];
    }
}
