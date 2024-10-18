<?php
    // Verifica si es administrador y si se ha iniciado sesion 
    if (isset($_SESSION['tipus_usuari']) && ($_SESSION['tipus_usuari'] == '2')) {
?>
    <a href="index.php?controller=User&action=cerrarSesion"><img src="views/img/cerrarSession.png" alt="Cerrar sesión" id="cerrarSession" style="cursor:pointer;"></a>
    <h1>Fundació Apel·les Fenosa - Administració</h1>
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

    <div class="adminUser">
        <h3>Crear usuari</h3>

        <form method="POST" action="index.php?controller=User&action=crearUsuario">
            <label for="username">Nom d'usuari:</label>
            <input type="text" id="username" name="username" required>

            <label for="password">Contrasenya:</label>
            <input type="password" id="password" name="password" required>
        
            <label for="confirm_password">Repeteix la contrasenya:</label>
            <input type="password" id="confirm_password" name="confirm_password" required>

            <label for="rol">Rol:</label>
            <select name="rol" id="rol" required>
                <option value="" disabled selected>--Seleccionar--</option>
                <option value="0">Convidat</option>
                <option value="1">Tecnic</option>
                <option value="2">Administrador</option>
            </select>

            <input type="submit" value="Crea">
            <a href="index.php?controller=User&action=listarUsuarios"><button type="button">Administrar usuaris</button></a>

        </form>
        <?php
        if (isset($mensaje)) {
            echo "<p>$mensaje</p>"; // Mostrar el mensaje de error o éxito
        }
        ?>
    </div>
    <div class="adminVocabulari">
        <h3>Vocabularis</h3>
        <p>Afegeix, modifica o elimina els registres dels vocabularis.</p>
        <a href="index.php?controller=User&action=listarUsuarios"><button type="button">Administrar vocabularis</button></a>

    </div>
    <div class="adminCopies">
        <h3>Copies de seguretat</h3>
    </div>
    
<?php 
} else {
    echo "No pots accedir aquesta pàgina.";
} 
?>