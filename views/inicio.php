<?php
    // Verifica si se ha iniciado sesion y es algun tipo de usario
    if (isset($_SESSION['tipus_usuari']) && ($_SESSION['tipus_usuari'] == '0' || $_SESSION['tipus_usuari'] == '1' || $_SESSION['tipus_usuari'] == '2')) {
?>
    <a href="index.php?controller=User&action=cerrarSesion"><img src="views/img/cerrarSession.png" alt="Cerrar sesión" id="cerrarSession" style="cursor:pointer;"></a>
    
    <h1>Fundació Apel·les Fenosa</h1>
    <div id="contenedor_inicio">
        <!-- Celda 1 -->
        <div class="celda">
            <img src="views/img/llista.png" alt="Llistat d'obres">
            <h3>Llistat d'obres</h3>
            <p>Visualitza el llistat de registres d'obres amb totes les dades</p>
            <a href="index.php?controller=Obres&action=mostrarTabla"><button>Acceder</button></a>
        </div>
        <!-- Celda 2 -->
        <?php if ($_SESSION['tipus_usuari'] == '1' || $_SESSION['tipus_usuari'] == '2') { ?>
            <div class="celda">
                <img src="views/img/expo.png" alt="Exposicions">
                <h3>Exposicions</h3>
                <p>Visualitza el llistat d'exposicions amb totes les dades especificades</p>
                <a href="index.php?controller=Obres&action=mostrarTabla"><button>Acceder</button></a>
            </div>

            <!-- Celda 3 -->
            <div class="celda">
                <img src="views/img/ubi.png" alt="Ubicacions">
                <h3>Ubicacions</h3>
                <p>Revisa, a través d'un diagrama en forma d'arbre, les ubicacions de les peces.</p>
                <a href="index.php?controller=Obres&action=mostrarTabla"><button>Acceder</button></a>
            </div>
        <?php } ?>
        <!-- Celda 4 (Administració) -->
        <?php if ($_SESSION['tipus_usuari'] == '2') { // Verifica si es administrador ?>
            <div class="celda">
                <img src="views/img/administracio.jpg" alt="Administracio">
                <h3>Administracio</h3>
                <p>Administra usuaris i rols dels usuaris del sistema.</p>
                <a href="index.php?controller=User&action=crearUsuario"><button>Acceder</button></a>
            </div>
        <?php } ?>
    </div>
<?php
} else {
    echo "No pots accedir aquesta pàgina.";
} 
?>