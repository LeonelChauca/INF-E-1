<?php
    session_start();
    $servername = "localhost";
    $username = "root";
    $password = "";
    $dbname = "bdleonel";


    $conn = new mysqli($servername, $username, $password, $dbname);

    $_SESSION['conex']=$conn;
    if ($conn->connect_error) {
        die("Conexion fallida : " . $conn->connect_error);
    }
?>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" href="styles.css">
    <title>Document</title>
</head>
<body>
    <nav class="container-nav">
        <h1>Ejercicio 1 PHP</h1>
        <h2>Leonel Moises Chauca Maydana</h2>
    </nav>
    <main class="container-main">
        <label for="">1.Realice un maquetado, con CSS y PHP. Donde muestre al menos tres tipos de cuentas bancarias. </label>
        <hr>

        <div class="container-main-table">
            <label for="">Tipos de cuentas bancarias</label>
            <table class="container-table">
                <tr>
                    <th>N. </th>
                    <th>Tipo de cuenta bancaria</th>
                </tr>
                <?php
                    $conex=$_SESSION['conex'];
                    $sql = "SELECT DISTINCT tipo FROM cuentabancaria";
                    $result = $conex->query($sql);
                    $cont=1;
            
                    if ($result->num_rows > 0) {
                        while ($row = $result->fetch_assoc()) {
                            echo "<tr>";
                            echo "<td align='center'>". $cont ."</td>";
                            echo "<td align='center'>" . $row["tipo"] . "</td>";
                            echo "</tr>";
                            $cont++;
                        }
                    } else {
                        echo "No results found.";
                    }
                ?>
            </table>
        </div>
    </main>
</body>
</html>
