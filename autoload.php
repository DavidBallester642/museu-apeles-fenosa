<?php
spl_autoload_register(function ($class_name) {
    $path = __DIR__ . '/';
    if (file_exists($path . "controllers/" . $class_name . ".php")) {
        require_once $path . "controllers/" . $class_name . ".php";
    } elseif (file_exists($path . "models/" . $class_name . ".php")) {
        require_once $path . "models/" . $class_name . ".php";
    }
});
?>
