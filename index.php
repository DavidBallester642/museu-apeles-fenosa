<!--Controlador frontal: fichero que se encarga de cargarlo absolutamente todo -->
<?
session_start();
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css" href="css/main.css">
    <title>Index</title>
</head>
<body>
    <h2>
    
    </h2>
    <?php 
    require_once "autoload.php";

    if (isset($_GET['controller'])){
        $nombreController = $_GET['controller']."Controller";
    }
    else{
        //Controlador per dedecte
        $nombreController = "UserController";
    }
    if (class_exists($nombreController)){
        $controlador = new $nombreController(); 
        if(isset($_GET['action'])){
            $action = $_GET['action'];
        }
        else{
            $action ="loginForm";
        }
        $controlador->$action();   
    }else{
        echo "No existe el controlador";
    }
    ?>
</body>
</html>