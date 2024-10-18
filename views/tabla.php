<?php
    // Verifica si se ha iniciado sesion y es algun tipo de usario
    if (isset($_SESSION['tipus_usuari']) && ($_SESSION['tipus_usuari'] == '0' || $_SESSION['tipus_usuari'] == '1' || $_SESSION['tipus_usuari'] == '2')) {
?>
    <a href="index.php?controller=User&action=cerrarSesion"><img src="views/img/cerrarSession.png" alt="Cerrar sesión" id="cerrarSession" style="cursor:pointer;"></a>

    <h1>Fundació Apel·les Fenosa - Llistat d'obres</h1>

    <nav>
        <ul>
            <li><a href="index.php?controller=User&action=volverInicio">Inicio</a></li>
            <?php if ($_SESSION['tipus_usuari'] == '1' || $_SESSION['tipus_usuari'] == '2') { ?>
                <li><a href="index.php?controller=Obres&action=mostrarTabla">Obres</a></li>
                <li><a href="index.php?controller=User&action=volverInicio">Exposicions</a></li>
                <li><a href="index.php?controller=User&action=volverInicio">Ubicacions</a></li>
            <?php } ?>
            <?php if ($_SESSION['tipus_usuari'] == '2') { // Verifica solo es administrador ?>
                <li><a href="index.php?controller=User&action=crearUsuario">Administracio</a></li>
            <?php } ?>
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
        echo "<th>Editar</th>";
        echo "<th>Eliminar</th>";
        echo "</tr>";

        // Verifica si haya obras
        if(!$obres == NULL) { 
            foreach($obres as $obra) {
                echo "<tr>";
                echo "<td>" . "<img src='views/img/" . $obra["fotografia"] . "' alt='" . $obra["fotografia"] . "'>" . "</td>";
                echo "<td>" . $obra["nom_objecte"] . "</td>";
                echo "<td>" . $obra["n_registre_be_patrimonial"] . "</td>";
                echo "<td>" . $obra["autor"] . "</td>";
                echo "<td>" . $obra["datacio"] . "</td>";
                echo "<td>Ubicació</td>";
                echo "<td><button onclick='editarObra(" . $obra["id"] . ")'>Editar</button></td>"; // Botón de editar
                echo "<td><button onclick='eliminarObra(" . $obra["id"] . ")'>Eliminar</button></td>"; // Botón de eliminar
                echo "</tr>";
            }
            echo "</table>";
        } else {
            echo "<tr><td>No hi han obres disponibles</td></tr>";
        }
    } else {
        echo "No pots accedir aquesta pàgina.";
    }
?>