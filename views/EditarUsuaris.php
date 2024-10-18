
<h1>Fundació Apel·les Fenosa - Edició d'usuaris</h1>
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

<div class='editUser'>

    <h3>Editar Usuario: <?php echo htmlspecialchars($usuario['nom_usuari']); ?></h3>

        <form method="POST" action="index.php?controller=User&action=guardarEdicion">
            <input type="hidden" name="username" value="<?php echo htmlspecialchars($usuario['nom_usuari']); ?>">

            <label for="username">Nombre de usuario:</label>
            <input type="text" id="username" name="username" value="<?php echo htmlspecialchars($usuario['nom_usuari']); ?>" disabled>
            <br>

            <label for="password">Contraseña:</label>
            <input type="password" id="password" name="password" value="<?php echo htmlspecialchars($usuario['contrasenya']); ?>" required>
            <br>
            
            <label for="rol">Rol:</label>
            <select name="rol" id="rol" required>
                <option value="0" <?php echo $usuario['tipus_usuari'] == 0 ? 'selected' : ''; ?>>Invitado</option>
                <option value="1" <?php echo $usuario['tipus_usuari'] == 1 ? 'selected' : ''; ?>>Técnico</option>
                <option value="2" <?php echo $usuario['tipus_usuari'] == 2 ? 'selected' : ''; ?>>Administrador</option>
            </select>

            <input type="submit" value="Guardar Cambios">
        </form>
</div>

<a href="index.php?controller=User&action=crearUsuario"><button type="button">Tornar</button></a>


