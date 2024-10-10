<?php

class User {
    private $conn;
    private $table = "usuari";  // Asegúrate de que esta tabla exista en tu base de datos

    public function __construct() {
        // Conectar a la base de datos
        $database = new Database();
        $this->conn = $database->connect();
    }

    // Método para comprobar si el usuario existe y es válido
    public function comprobarUsuario($username, $password) {
        $query = "SELECT * FROM " . $this->table . " WHERE nom_usuari = :username AND password = :password";
        $stmt = $this->conn->prepare($query);
        
        // Vincular los parámetros de entrada
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':password', $password);
        
        // Ejecutar la consulta
        $stmt->execute();

        // Comprobar si el usuario existe
        $resultado = false;
        if ($stmt->rowCount() > 0) {
            $resultado = true;
        }
        return $resultado;
    }

    public function usuarioExiste($username) {
        // Preparar la consulta para comprobar si el usuario existe
        $query = "SELECT COUNT(*) FROM " . $this->table . " WHERE nom_usuari = :username";
        $stmt = $this->conn->prepare($query);
        
        // Vincular el parámetro
        $stmt->bindParam(':username', $username);
        
        // Ejecutar la consulta
        $stmt->execute();
        
        // Obtener el resultado
        $count = $stmt->fetchColumn();
        
        // Si el conteo es mayor que 0, el usuario ya existe
        return $count > 0;
    }

    // Método para crear un Usuario.
    public function crearUsuario($username, $password, $rol) {
        $mensaje = "";
        // Comprobar si las contraseñas son iguales
        if ($_POST['password'] != $_POST['confirm_password']) {
            $mensaje = "Las contraseñas no coinciden.";
        }
    
        // Verificar si el usuario ya existe
        if ($this->usuarioExiste($username)) {
            $mensaje = "El nombre de usuario ya está en uso. Por favor, elige otro.";
        }
    
        // Preparar la consulta para insertar el nuevo usuario
        $query = "INSERT INTO " . $this->table . " (nom_usuari, password, tipus_usuari) VALUES (:username, :password, :rol)";
        $stmt = $this->conn->prepare($query);
    
        // Vincular los parámetros
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':password', $password);
        $stmt->bindParam(':rol', $rol);
    
        // Ejecutar la consulta
        try {
            if ($stmt->execute()) {
                $mensaje = "Usuario creado con éxito.";
            }
        } catch (PDOException $ex) {
            $mensaje = "Error al crear el usuario: " . $ex->getMessage();
        }
        return $mensaje;
    }
}
?>