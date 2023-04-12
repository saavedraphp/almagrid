<!doctype html>
<html lang="en">

<head>
    <meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <title>Bootstrap demo</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/css/bootstrap.min.css" rel="stylesheet"
        integrity="sha384-KK94CHFLLe+nY2dmCWGMq91rCGa5gtU4mk92HdvYe+M/SXH301p5ILy+dN9+nJOZ" crossorigin="anonymous">

    <style>
        #contenido {
            width: 95%;
            margin: 0px auto;
            background-color: #D4E5F2;
            font-family: Verdana, Geneva, Tahoma, sans-serif;

        }

        #imagen {
            width: 230px;
            height: 230px;
            align-content: center;
        }



        #precio_producto {

            font-size: 20px;
            font-weight: bold;
            text-align: center;
            background-color: yellowgreen;

        }



        #title {
            font-size: 15px;
            font-weight: normal;
            text-align: center;
            padding-top: 10px;
            padding-bottom: 10px;
            background-color: antiquewhite;
            height: 5em;

        }


        #element {
            padding: 10px;
            margin-left: 10px;
            box-shadow: 0 2px 5px #666666;
            float: left;
            position: relative;
            width: 250px;
            border: steelblue solid 1px;
            height: auto;
            background-color: white;
        }

        #right {
            padding-top: 10px;
            padding-left: 10px;
            margin-left: 10px;
            position: relative;
            float: left;
            width: 45%;
            border: steelblue solid 1px;
            height: auto;
        }

        .precio_oferta {
            font-style: normal;
            font-weight: 300;
            font-size: 16px;
            align-items: center;
            text-align: center;
            text-decoration-line: line-through;
            color: #828282;
            margin-right: 12px;
        }
    </style>
</head>

<body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0-alpha3/dist/js/bootstrap.bundle.min.js"
        integrity="sha384-ENjdO4Dr2bkBIFxQpeoTz1HIcje39Wm4jDKdf19U8gI4ddQ3GYNS7NTKfAdVQSZe" crossorigin="anonymous">
    </script>
    <ul class="nav">
        <li class="nav-item">
            <a class="nav-link active" aria-current="page" href="/admin/productosweb">Gestion Productos</a>
        </li>
      
       
        <li class="nav-item">
            <a href="/catalogo"  class="nav-link">Catálogo WEB</a>
        </li>
      </ul>

    
    <div id="contenido">
        <h2>Catalogo de Productos</h2>
        <?php
        $conta = 0;
        
     
        ?>
  
        @foreach($productos as $producto)
        <?php
        $conta++;
        ?>
            <div id="element">
                <div id="div_image"><img src="{{asset('img/productosweb/'.$producto->ruta_imagen)}}" alt="" id="imagen">
                </div>
                <div id="title">{{ $producto->nombre.' Unid ('.((int)$producto->cantidad>0?$producto->cantidad:1).')' }}<p style="font-weight:600;">SKU: P<?php echo str_pad($conta, 3, '0', STR_PAD_LEFT); ?></p>
                </div>
                <div id="precio_producto">
                    @if ((int)$producto->oferta > 1)

                        <span class=precio_oferta>S/. <?php echo number_format($producto->precio, 2); ?></span>
                        {{ 'S/. ' . number_format($producto->oferta, 2) }}
                    @else
                        {{ 'S/. ' . number_format($producto->precio, 2) }}
                    @endif
                    
                </div>


            </div>
        @endforeach


    </div>
</body>

</html>
