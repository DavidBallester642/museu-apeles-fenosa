<?php
class User {
    private $conn;
    private $table = "usuari";  // Asegúrate de que esta tabla exista en tu base de datos

    public function __construct() {
        // Conectar a la base de datos
        $database = new Database();
        $this->conn = $database->connect();
    }

    // Método para comprobar si el usuario existe, es válido y que tipo de rol tiene.
    public function comprobarUsuario($username, $password) {
        $query = "SELECT tipus_usuari FROM " . $this->table . " WHERE nom_usuari = :username AND contrasenya = :password";
        $stmt = $this->conn->prepare($query);
        
        // Vincular los parámetros de entrada
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':password', $password);
        
        // Ejecutar la consulta
        $stmt->execute();
    
        // Inicializar una variable para almacenar el tipo de usuario
        $tipoUsuario = false;
    
        // Comprobar si el usuario existe y obtener el tipo de usuario
        if ($stmt->rowCount() > 0) {
            $tipoUsuario = $stmt->fetch(PDO::FETCH_ASSOC); // Almacena el tipo de usuario
        }
        return $tipoUsuario; // Usuario no encontrado o el usuario
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
        $query = "INSERT INTO " . $this->table . " (nom_usuari, contrasenya, tipus_usuari) VALUES (:username, :password, :rol)";
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

    //metodo para obtener todos los usuarios
    public function obtenerTodosUsuarios() {
        $query = "SELECT nom_usuari, contrasenya, tipus_usuari FROM " . $this->table;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();
        
        return $stmt->fetchAll(PDO::FETCH_ASSOC); // Devuelve un array con todos los usuarios
    }


     // Método para eliminar un usuario
     public function eliminarUsuario($username) {
        $query = "DELETE FROM " . $this->table . " WHERE nom_usuari = :username";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':username', $username);
        return $stmt->execute();
    }


    public function obtenerUsuarioPorUsername($username) {
        $query = "SELECT * FROM " . $this->table . " WHERE nom_usuari = :username";
        $stmt = $this->conn->prepare($query);
        $stmt->bindParam(':username', $username);
        $stmt->execute();
    
        // Verifica si el usuario existe
        if ($stmt->rowCount() > 0) {
            return $stmt->fetch(PDO::FETCH_ASSOC); // Retorna los datos del usuario
        } else {
            return false;
        }
    }


    public function editarUsuario($username, $password, $rol) {
        $query = "UPDATE " . $this->table . " SET contrasenya = :password, tipus_usuari = :rol WHERE nom_usuari = :username";
        $stmt = $this->conn->prepare($query);
    
        $stmt->bindParam(':username', $username);
        $stmt->bindParam(':password', $password);
        $stmt->bindParam(':rol', $rol);
    
        try {
            if ($stmt->execute()) {
                return "Usuario actualizado con éxito.";
            } else {
                return "Error al actualizar el usuario.";
            }
        } catch (PDOException $ex) {
            return "Error al actualizar el usuario: " . $ex->getMessage();
        }
    }
    
    

}
?>
