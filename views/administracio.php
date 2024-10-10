


<a href="index.php?controller=User&action=logout">
    <img src="views/img/cerrarSession.png" alt="Cerrar sesión" id="cerrarSession" style="cursor:pointer;">
</a>

<h1>Fundació Apel·les Fenosa - Administració</h1>
<nav>
    <ul>
        <!-- Mirar de redigir los items del menu a donde corresponde con MVC. -->
        <li><a href="index.php?controller=User&action=paginaPrincipal">Inicio</a></li>
        <li><a href="inicio.php">Obres</a></li>
        <li><a href="inicio.php">Exposicions</a></li>
        <li><a href="inicio.php">Ubicacions</a></li>
        <li><a href="Administracio.php">Administracio</a></li>
    </ul>
</nav>

<div class="adminUser">
    <h3>Crear usuari</h3>

    <form method="POST" action="index.php?controller=Administracio&action=crearUsuario">
        <label for="username">Nom d'usuari</label>
        <input type="text" id="username" name="username" required>

        <label for="password">Contrasenya</label>
        <input type="password" id="password" name="password" required>

        <label for="rol">Rol</label>
        <select name="rol" id="rol" required>
            <option value="" disabled selected>--Seleccionar--</option>
            <option value="0">Convidat</option>
            <option value="1">Tecnic</option>
            <option value="2">Administrador</option>
        </select>
    
        <label for="confirm_password">Repeteix la contrasenya</label>
        <input type="password" id="confirm_password" name="confirm_password" required>

        

        <input type="submit" value="Crea">
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
    <a href="index.php?controller=Obres&action=mostrarTabla"><button>Anar a gestio de vocaularis</button></a>

</div>

<div class="adminCopies">
    <p>Copies de seguretat</p>
</div>