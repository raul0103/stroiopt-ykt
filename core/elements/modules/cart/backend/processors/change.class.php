<?php

require_once dirname(__DIR__) . '/classes/session.class.php';
require_once dirname(__DIR__) . '/classes/main.class.php';

class change extends Main
{
    public $session;

    public function __construct()
    {
        $this->session = new Session();
    }

    /**
     * @param mixed $product_data
     * @return mixed $product_data - Обновленный массив данных
     */
    public function process($product_data)
    {

        $cart_items = $this->session->get();

        if (empty($cart_items)) {
            $cart_items = [];

            $cart_items[] = $product_data;
        } else {
            /**
             * Ищем товар в корзине
             * Если есть, то обновляем значения всех полей array_replace
             *      так как данные (цена, единица измерения и тд) могли измениться
             */
            $item_exist = false;
            foreach ($cart_items as &$cart_item) {
                if ($cart_item['id'] == $product_data['id']) {
                    $cart_item = array_replace($cart_item, $product_data);

                    $product_data['count'] = $cart_item;
                    $item_exist = true;
                    break;
                }
            }

            // Если товара не было в массиве корзины, добавить
            if (!$item_exist) {
                $cart_items[] = $product_data;
            }
        }

        $this->session->set($cart_items);

        return [
            "product_data" => $product_data,
            "product_total" => count($cart_items)
        ];
    }
}
