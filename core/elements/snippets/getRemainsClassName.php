<?php

if (!$remains) return;

if ($remains < 100) {
    return "error-color";
} else {
    return "success-color";
}
