<?php
class Obres {
    private $conn;
    private $table = "be_patrimonial";

    public function __construct() {
        $database = new Database();
        $this->conn = $database->connect();
    }

    public function obtenerObras() {
        $query = "SELECT n_registre_be_patrimonial, fotografia, nom_objecte, autor, datacio FROM " . $this->table;
        $stmt = $this->conn->prepare($query);
        $stmt->execute();

        // Devuelve los resultados como un array
        return $stmt->fetchAll(PDO::FETCH_ASSOC);
    }
}
?>