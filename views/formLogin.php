<!-- body -->
<div class="login-page">

    <div class="foto">
            <img src="views/img/logoMuseu.png" alt="logo">
    </div>

    <div class="container_login">
        <!-- Div para el título -->
        
        <div class="title">
            <h3>Inici de Sessió</h3>
        </div>

        <!-- Div para el formulario -->
        <div class="login-form">
            <form method="POST" action="index.php?controller=User&action=validarUser">
                <label for="username">Usuari:</label>
                <input type="text" id="username" name="username" required>

                <br>

                <label for="password">Contrasenya:</label>
                <input type="password" id="password" name="password" required>

                <br>

                <input type="submit" value="Accedir">
            </form>
        </div>
    </div>
</div>
