<?php

$env = array_filter(
    getenv(),
    static function ($name) {
        return 0 === strpos($name, 'DATABASE_');
    },
    ARRAY_FILTER_USE_KEY
);

ksort($env);

var_export($env);
