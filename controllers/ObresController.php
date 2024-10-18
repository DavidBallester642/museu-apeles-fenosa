<?php
session_start();

class ObresController {
    private $obres;

    public function __construct() {
        $this->obres = new Obres();
    }

    public function mostrarTabla() {
        if (isset($_SESSION['tipus_usuari'])) {
            $obres= $this->obres->obtenerObras();

            // Asegúrate de que se pasa el resultado a la vista
            include 'views/Tabla.php'; // Ahora la vista puede acceder a $resultado
        } else {
            include 'views/FormLogin.php';
        }
    }
}
?>