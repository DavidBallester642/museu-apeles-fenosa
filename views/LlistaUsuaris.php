<h1>Fundació Apel·les Fenosa- Llistat d'usuaris</h1>
<nav>
        <ul>
            <!-- Mirar de redigir los items del menu a donde corresponde con MVC. -->
            <li><a href="index.php?controller=User&action=volverInicio">Inicio</a></li>
            <li><a href="index.php?controller=User&action=volverInicio">Obres</a></li>
            <li><a href="index.php?controller=User&action=volverInicio">Exposicions</a></li>
            <li><a href="index.php?controller=User&action=volverInicio">Ubicacions</a></li>
            <li><a href="index.php?controller=User&action=crearUsuario">Administracio</a></li>
        </ul>
    </nav>


<?php
// Verifica si es administrador
if (isset($_SESSION['tipus_usuari']) && $_SESSION['tipus_usuari'] == '2') {
?>
    <table>
        <thead>
            <tr>
                <th>Nombre de Usuario</th>
                <th>Contraseña</th>
                <th>Rol de Usuario</th>
                <th>Editar</th>
                <th>Eliminar</th>
            </tr>
        </thead>
        <tbody>
            <?php foreach ($usuarios as $usuario): ?>
                <tr>
                    <td><?php echo htmlspecialchars($usuario['nom_usuari']); ?></td>
                    <td><?php echo htmlspecialchars($usuario['contrasenya']); ?></td>
                    <td>
                        <?php
                        switch ($usuario['tipus_usuari']) {
                            case '0': echo 'Convidat'; break;
                            case '1': echo 'Tècnic'; break;
                            case '2': echo 'Administrador'; break;
                        }
                        ?>
                    </td>
                    <td>
                    <a href="index.php?controller=User&action=editarUsuario&username=<?php echo $usuario['nom_usuari']; ?>"><img src="views/img/edit.png" alt=""></a>
                    </td>
                    <td>
                        <a href="index.php?controller=User&action=eliminarUsuario&username=<?php echo urlencode($usuario['nom_usuari']); ?>"
                        onclick="return confirm('¿Estás seguro de que deseas eliminar este usuario?');">
                        <img src="views/img/eliminar.png" alt="Eliminar" title="Eliminar" />
                        </a>
                    </td>

                </tr>
            <?php endforeach; ?>
        </tbody>
    </table>
<?php
} else {
    echo "No tienes permiso para ver esta página.";
}
?>

<a href="index.php?controller=User&action=crearUsuario"><button type="button">Tornar</button></a>

