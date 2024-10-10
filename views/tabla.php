

    <h1>Fundació Apel·les Fenosa - Llistat d'obres</h1>
    
    <nav>
        <ul>
            <li><a href="index.php?controller=User&action=paginaPrincipal">Inicio</a></li>
            <li><a href="inicio.php">Obres</a></li>
            <li><a href="inicio.php">Exposicions</a></li>
            <li><a href="inicio.php">Ubicacions</a></li>
            <li><a href="vistaAdministracio.php">Administracio</a></li>
        </ul>
    </nav>

    <?php
      
            // Creo la tabla con su apartados.
            echo "<table>";
            echo "<tr>";
            echo "<th>Fotografía</th>";
            echo "<th>Nombre del Objeto</th>";
            echo "<th>ID Registro</th>";
            echo "<th>Autor</th>";
            echo "<th>Datación</th>";
            echo "<th>Ubicació</th>";
            echo "<th>Editar/Eliminar</th>";
            echo "</tr>";
           
           foreach($obres as $obra){
                echo "<tr>";
                echo "<td>" . $obra["fotografia"] . "</td>";
                echo "<td>" . $obra["nom_objecte"] . "</td>";
                echo "<td>" . $obra["n_registre_be_patrimonial"] . "</td>";
                echo "<td>" . $obra["autor"] . "</td>";
                echo "<td>" . $obra["datacio"] . "</td>";
                echo "<td>Ubicació</td>";
                echo "<td>Editar/Eliminar</td>";
                echo "</tr>";
            }
            echo "</table>";
        
    ?>
