<?php

class Session
{
    public $session_key = "session-cart";

    public function __construct()
    {
        session_start();
    }

    public function get()
    {
        return $_SESSION[$this->session_key];
    }

    public function set($data)
    {
        $_SESSION[$this->session_key] = $data;
    }

    public function unset()
    {
        unset($_SESSION[$this->session_key]);
    }
}
