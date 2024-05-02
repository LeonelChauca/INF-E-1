<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <link rel="stylesheet" type="text/css"  href="styles.css">
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
            <div class="maintarget">
                <div class="target-main">
                    <img src="./img1.webp" width="400px" alt="">
                    <h3>Cuenta corriente</h3>
                    <p>La cuenta corriente es una cuenta bancaria que permite a los titulares realizar depósitos y retiros de dinero, así como también transferencias y pagos de servicios. </p>
                    <button class="botonH" onclick="location='cuentaCorriente.php'" >Ver mas</button>
                </div>
                <div class="target-main">
                    <img src="./img2.jpeg" width="400px" alt="">
                    <h3>Cuenta a plazo fijo </h3>
                    <p> 
Una cuenta a plazo fijo es un producto financiero en el cual depositas una cierta cantidad de dinero en una institución financiera por un período de tiempo específico, que puede variar desde unos pocos meses hasta varios años. </p>
                    <button class="botonH" onclick="location='cuentaPlazoFijo.php'">Ver mas</button>
                </div>
                <div class="target-main">
                    <img src="./img3.jpeg" width="400px" alt="">
                    <h3>Cuenta de Mercado Monetario</h3>
                    <p> Similar a una cuenta de ahorros, pero con tasas de interés más altas y la capacidad de emitir cheques. Suelen requerir un saldo mínimo más alto y pueden tener restricciones en cuanto al número de transacciones.</p>
                    <button class="botonH" onclick="location='cuentaMonetaria.php'">Ver mas</button>
                </div>
            </div>
        </div>
    </main>
</body>
</html>
