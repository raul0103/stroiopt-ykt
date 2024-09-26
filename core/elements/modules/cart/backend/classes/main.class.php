<?php

require_once  "session.class.php";

/**
 * Класс с основными методами используемыми во всех процессорах
 */
class Main
{
    public $session;
    public function __construct()
    {
        $this->session = new Session();
    }
    /**
     * Возвращает кол-во товара в корзине по product_id
     * @param mixed $product_id
     * @return mixed
     */
    public function getProductCount($product_id)
    {

        $cart_items = $this->session->get();

        if (empty($cart_items)) return 0;

        $product_count = 0;
        foreach ($cart_items as $cart_item) {
            if ($cart_item['id'] == $product_id) {
                $product_count = $cart_item['count'];
                break;
            }
        }

        return $product_count;
    }
    /**
     * возвращает общее число товаров в корзине
     * @param mixed $product_id
     * @return mixed
     */
    public function getProductTotal()
    {

        $cart_items = $this->session->get();

        if (empty($cart_items)) return 0;

        return count($cart_items);
    }
}
