<?php
class AdministracioController {
    private $userModel;

    public function __construct() {
        $this->userModel = new User();
    }

    public function crearUsuario() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $username = $_POST['username'];
            $password = $_POST['password'];
            $rol = $_POST['rol'];
            
            $mensaje = $this->userModel->crearUsuario($username, $password, $rol);

            return $mensaje; // Esto se puede mostrar en la vista
        } else {
            include 'views/Administracio.php';
        }
    }
}
?>