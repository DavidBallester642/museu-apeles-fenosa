<?php
session_start();

class UserController {
    private $userModel;

    public function __construct() {
        $this->userModel = new User();
    }

    public function crearUsuario() {
        if (isset($_SESSION['tipus_usuari'])) {
            if ($_SESSION['tipus_usuari'] == '2') {
                if ($_SERVER['REQUEST_METHOD'] == 'POST') {
                    $username = $_POST['username'];
                    $password = $_POST['password'];
                    $confirm_password = $_POST['confirm_password'];  // Obtener la segunda contraseña
                    $rol = $_POST['rol'];
    
                    // Validación de contraseñas
                    if ($password !== $confirm_password) {
                        // Si las contraseñas no coinciden, mostrar un mensaje de error
                        $mensaje = "Las contraseñas no coinciden. Por favor, vuelve a intentarlo.";
                        include 'views/Administracio.php';
                        return;  // Salir de la función para evitar que el usuario se cree
                    }
    
                    // Si las contraseñas coinciden, llamar al modelo para crear el usuario
                    $mensaje = $this->userModel->crearUsuario($username, $password, $rol);
                    
                    // Mostrar el mensaje (puede ser de éxito o error)
                    include 'views/Administracio.php';
                } else {
                    include 'views/Administracio.php';
                }
            } else {
                include 'views/Inicio.php';
            }
        } else {
            include 'views/FormLogin.php';
        }
    }
    

    public function validarUser() {
        $username = $_POST['username'];
        $password = $_POST['password'];
    
        // Crear una instancia del modelo Usuario
        $userModel = new User();
        $user = $userModel->comprobarUsuario($username, $password);
    
        if ($user) {
            $_SESSION['username'] = $username;
            $_SESSION['password'] = $password;
            $_SESSION['tipus_usuari'] = $user['tipus_usuari']; // Guardar el tipo de usuario
    
            require_once 'views/inicio.php';
        } else {
            require_once 'views/formLogin.php';
        }
    }

    public function volverInicio(){
        require_once 'views/Inicio.php';
    }

    public function loginForm(){
        require_once 'views/formLogin.php';
    }

    public function cerrarSesion() {
        session_destroy(); // Destruye la sesión
        require_once 'views/formLogin.php';
    }

    public function listarUsuarios() {
        if (isset($_SESSION['tipus_usuari']) && $_SESSION['tipus_usuari'] == '2') { // Solo si es admin
            $usuarios = $this->userModel->obtenerTodosUsuarios(); // Obtener todos los usuarios
            include 'views/LlistaUsuaris.php'; // Cargar la vista con los datos
        } else {
            include 'views/Inicio.php'; // Si no es admin, volver al inicio
        }
    }

    public function eliminarUsuario() {
        if (isset($_GET['username'])) {
            $username = $_GET['username'];
            $this->userModel->eliminarUsuario($username);
            header("Location: index.php?controller=User&action=listarUsuarios"); // Redirigir después de eliminar
        }
    }


    public function editarUsuario() {
        if (isset($_GET['username'])) {
            $username = $_GET['username'];
    
            // Obtener los datos del usuario por su nombre de usuario
            $usuario = $this->userModel->obtenerUsuarioPorUsername($username);
    
            if ($usuario) {
                // Mostrar el formulario de edición con los datos actuales
                include 'views/editarUsuaris.php';
            } else {
                echo "Usuario no encontrado.";
            }
        } else {
            echo "No se ha proporcionado el nombre de usuario.";
        }
    }


    public function guardarEdicion() {
        if ($_SERVER['REQUEST_METHOD'] == 'POST') {
            $username = $_POST['username'];
            $password = $_POST['password'];
            $rol = $_POST['rol'];
    
            // Llamar al modelo para actualizar los datos del usuario
            $mensaje = $this->userModel->editarUsuario($username, $password, $rol);
    
            // Redirigir a la lista de usuarios o mostrar mensaje de éxito
            header("Location: index.php?controller=User&action=listarUsuarios");
            exit();
        }
    }
    



}
?>