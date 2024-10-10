<?php

class UserController {

    public function loginForm(){
        require_once 'views/formLogin.php';
    }
    
    public function validarUser() {

            $username = $_POST['username'];
            $password = $_POST['password'];

            // Crear una instancia del modelo Usuario
            $userModel = new User();
            $user= $userModel->comprobarUsuario($username, $password);

            if ($user) {
                session_start(); //quitar sino
                $_SESSION['username']=$username;
                $_SESSION['password']=$password;
                require_once 'views/inicio.php';
            } else {
                require_once 'views/formLogin.php';
            }
    
    }


      // Función para verificar si el usuario está logueado
      public function checkLogin() {
        session_start();
        if (!isset($_SESSION['username'])) {
            // Si no está logueado, redirigir al formulario de inicio de sesión
            header("Location: index.php?controller=User&action=loginForm");
            exit();
        }
    }




    public function paginaPrincipal(){
        require_once 'views/inicio.php';
    }


    public function logout() {
        // Destruir la sesión
        session_start();
        session_unset();
        session_destroy();

        // Redirigir a la página de inicio (o donde quieras)
        header("Location: index.php");
        exit();
    }
}
?>
