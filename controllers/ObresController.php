<?php
class ObresController {
    private $obres;

    public function __construct() {
        $this->obres = new Obres();
    }

    public function mostrarTabla() {
        $obres= $this->obres->obtenerObras();

        // Asegúrate de que se pasa el resultado a la vista
        include 'views/Tabla.php'; // Ahora la vista puede acceder a $resultado
    }
}
?>