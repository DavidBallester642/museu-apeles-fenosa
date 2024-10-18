<?php
// Verifica si la URL actual es la que deseas redirigir
if ($_SERVER['REQUEST_URI'] == '/museo/views/FormLogin.php') {
    
    header("Location: http://localhost/museo/");
    exit();
}
?>
<!-- body -->
<div class="login-page">
    <div class="foto">
            <img src="views/img/logoMuseu.png" alt="logo">
    </div>
    <div class="container_login">

        <div class="title">
            <h3>Inici de Sessió</h3>
        </div>

        <!-- Div para el formulario -->
        <div class="login-form">
            <form method="POST" action="index.php?controller=User&action=validarUser">
                <label for="username">Usuari:</label>
                <input type="text" id="username" name="username" required>

                <label for="password">Contrasenya:</label>
                <input type="password" id="password" name="password" required>

                <input type="submit" value="Accedir">
            </form>
        </div>
    </div>
</div>