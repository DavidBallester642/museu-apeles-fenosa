<?php
        require_once 'index.php'; // Asegúrate de incluir la inicialización de la sesión

        if (!isset($_SESSION['username'])) {
            // Si no está logueado, redirigir a la página de login
            header("Location: index.php?controller=User&action=loginForm");
            exit();
        }
    ?>


<h1>Fundació Apel·les Fenosa</h1>
<div id="contenedor_inicio">
    <!-- Celda 1 -->
    <div class="celda">
        <img src="views/img/imgEscultura.jpg" alt="Llistat d'obres">
        <h3>Llistat d'obres</h3>
        <p>Visulatitza el llistat de registres d'obres amb totes les dades</p>
        <a href="index.php?controller=Obres&action=mostrarTabla"><button>Acceder</button></a>
    </div>
               
    <!-- Celda 2 -->
    <div class="celda">
        <img src="views/img/imgExpo.jpg" alt="Exposicions">
        <h3>Exposicions</h3>
        <p>Visualitza el llistat d'exposicions amb totes les dades especificades</p>
        <a href="index.php?controller=Obres&action=mostrarTabla"><button>Acceder</button></a>

    </div>

    <!-- Celda 3 -->
    <div class="celda">
        <img src="views/img/imgExpo.jpg" alt="Ubicacions">
        <h3>Ubicacions</h3>
        <p>Revisa, a través d'un diagrama en forma d'arbre, les ubicacions de les peces.</p>
        <a href="index.php?controller=Obres&action=mostrarTabla"><button>Acceder</button></a>

    </div>
    
    <!-- Celda 4 -->
    <div class="celda">
        <img src="views/img/administracio.jpg" alt="Administracio">
        <h3>Administracio</h3>
        <p>Administra usuaris i rols dels usuaris del sistema.</p>
        <a href="index.php?controller=Administracio&action=crearUsuario"><button>Acceder</button></a>
    </div>
</div>
