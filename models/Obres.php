<?php
class Obres {
    private $conn;
    private $table1 = "be_patrimonial";
    private $table2 = "autories";
    private $table3 = "datacions";

    public function __construct() {
        $database = new Database();
        $this->conn = $database->connect();
    }

    public function obtenerObras() {
        $resultado_array = [];
        try {
            $query = "SELECT bp.n_registre_be_patrimonial, bp.fotografia, bp.nom_objecte, a.descripcio AS autor, d.datacio
            FROM " . $this->table1 . " AS bp 
            INNER JOIN " . $this->table2 . " AS a ON bp.id_autor = a.id_autor 
            INNER JOIN " . $this->table3 . " AS d ON bp.id_datacions = d.id_datacions";
            $stmt = $this->conn->prepare($query);
            $stmt->execute();
            // Devuelve los resultados como un array
            $resultado_array = $stmt->fetchAll(PDO::FETCH_ASSOC);
        } catch (PDOException $e) {
            // Manejo de errores: muestra el mensaje de error
            echo "Error al obtener obras: " . $e->getMessage();
            $resultado_array = []; // Devuelve un array vacío en caso de error
        }
        return $resultado_array;
    }
}
?>