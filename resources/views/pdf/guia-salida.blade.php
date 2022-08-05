<html>
<head>
    <style>
        @page {
            margin: 0cm 0cm;
            font-family: Arial;
        }

        body {
            margin: 1cm 1cm 1cm 1cm;
            background-color: white;
        }

        header {
            position: relative;
            top: cm;
            left: 0cm;
            right: 0cm;
            text-align: center;
      
 
        }

        footer {
            position:relative;
            bottom:0cm;
            left: 0cm;
            right: 0cm;
            background-color: white;
            color: black;
             

        }

        #head1-i{
            float: left;
            width: 420px;
            height: 100;
            
 
        }

        #head1-d{
            float: right;
            width: 230px;
            height: 90;
            background-color: white;

            margin-left: 20px;
            border-radius: 10px;
            border: solid black;
            text-align: center;
            
 
        }        

        .divBorder
        {
            border-radius: 6px;
            border: solid black;
            border-width: 0px;

        }

        .headTable
        {
            border-top-left-radius: 3px;
            border-top-right-radius: 3px;
            font-weight: bold;
            font-size: 10px;
            background-color: black;
            color: white;
            padding: 1px;
            text-align: center;

        }        
        

        #div_pequeno{
            position: relative;
            float: left;
            width: 400px;
            height: 100;
            
 
        }


        .fontbold1
        {
            font-size: 12;
            font-weight: bold;
            vertical-align: top;
            line-height: 1;
        }

        .fontbold2
        {
            font-size: 14;
            font-weight: bold;
         }        

        .font3
        {
            font-size: 13px;
            vertical-align:top;
            word-wrap: break-word;
            line-height: 1;
        }

        
        .font3bold
        {
            font-size:10px ;
            font-weight: bold;
            line-height: 1;

        }


        .fontPeuenho
        {
        /* Checkbox texto */
        
        font-size: 10px;
        text-align: left; 
        margin-top: 1px;
  
        }        
      

        .tdCenter
        {
            text-align: center;

        }

        input[type=checkbox] {
        transform: scale(0.5);
        }        

        .checkboxtexto
        {
        /* Checkbox texto */
        
        font-size: 8px;
        display:inline-block;
        text-align: left; 
        margin-top: 10px;
        
 
        }

        .tableChk td
        {
            height: -3px;
             line-height: 0.7;


        }

        .columnadiv
        {
            background-color: white;
            border-color: #D4D2D2;
            height: 15px;
            display: inline-block;
            line-height: 5px;
 
        }

        .fila
        {

          background-color: white;  
        }


        .tableProductos
        {
            width: 100%;
 
        }

        .tableProductos td
        {
            vertical-align: top;
            border: 1px solid #000;
            border-collapse: collapse;
            

        }
    </style>
</head>
<body>
    <header>
    <table width="100%"  border="0">
        <tr>
            <td width="60%">
            <table border="0" >
            <tr>
                <td width="25%"><img src="{{ public_path('/dist/img/logo-trimas.png') }}"  width="100" height="60" ></td>
                <td> 
                    <div style="height: 35px;background-color: white; ">
                    <span  class="fontbold1"  style="display: block;">ALMACENES Y SERVICIOS</span>
                    <span class="fontbold1">LOGISTICOS GRILLOS SAC</span>
                    </div>
                    <div style="height: 25px;background-color:white;">
                    <span  class="font3">Almacenamiento, operación logistica gestión documentaría transporte de materiales y equipos</span>
                    </div>
                
                
                 </td>
            </tr>
            <tr>
                <td colspan="2" style="vertical-align:top;" >
                    <div class="font3bold">Cal. Juan Soto Bermeo N° 402, Urb. El Totoral Santiago de Surco - Lima -Lima</div>
                    <div  class="font3bold" style="text-align:center;">993 473 937</div>
                   
                </td>
            </tr>
            <tr style="height: 20;">
                <td  colspan="2">
                    <span  class="font3bold" style="width:200px ; background-color: white; display: inline-block;">Fecha de Emision: <?php echo date('m/d/Y')?></span> 
                    <span  class="font3bold">Fecha de Traslado: __ __ ____ / __ __ ____ </span>
                </td>
                

            </tr>

            </table>
            </td>


            <td width=40%  style="vertical-align: top;line-height: 30px;">
                <div  id="head1-d" class="fontbold2" >
                     <div>R.U.C 2060474111</div>
                    <div style="background-color:#D4D2D2 ;">GUIA DE REMISION REMITENTE</div>
                    <div>0001- N° 000500</div>
     
                
                </div>
               
            </td>
        </tr>


    </table>
<br>
    <table width="100%" border="0">
        <tr>
            <td width="50%" style="vertical-align: top;">
                <div  class="divBorder">
                    <div class="headTable">PUNTO DE PARTIDA</div>
                    <div class="fontPeuenho">DIRECCION:.....................................................................................................................</div>
                    <div class="fontPeuenho">DISTRITO:.................................PROV:..................................DEP:.................................</div>
                </div>
            </td>

            <td width="50%" style="vertical-align: top;">
                <div  class="divBorder">

                    <div class="headTable">PUNTO DE LLEGADA</div>
                    <div class="fontPeuenho">DIRECCION:.....................................................................................................................</div>
                    <div class="fontPeuenho">DISTRITO:.................................PROV:..................................DEP:.................................</div>
                </div>
            </td>


        </tr>
    </table>


    <table width="100%" border="0">
        <tr>
            <td width="50%" style="vertical-align: top;">
                <div  class="divBorder">
                    <div class="headTable">DESTINATARIO</div>
                    <div class="fontPeuenho" style="padding-top: 2px;"> NOMBRES / RAZON SOCIAL:.......................................................................................</div>
                    <div class="fontPeuenho" style="padding-top: 4px;"> RUC:...................................................................................................................................</div>
                    <div class="fontPeuenho" style="padding-top: 4px;padding-bottom: 2px;">TIPO N° DE DOCUMENTO DE IDENTIDAD:..............................................................</div>
                </div>
            </td>

            <td width="50%" style="vertical-align: top;">
                <div  class="divBorder">

                    <div class="headTable">UNIDAD DE TRASPORTE / CONDUCTOR</div>
                    <div class="fontPeuenho">VEHICULO MARCA:...........................................PLACA N°.........................................</div>
                    <div class="fontPeuenho">CERTIFICADO DE INSCRIPCIÓN N°:..........................................................................</div>
                    <div class="fontPeuenho">CONDUCTOR:..................................................................................................................</div>
                    <div class="fontPeuenho">LICENCIA DE CONDUCTOR N°:..................................................................................</div>
                </div>
            </td>


        </tr>
    </table>

    </header>
<main>

   <table  width="100%"  class="tableProductos">
    <tr class="headTable">
        <th>CODIGO</th>
        <th>DESCRIPCION</th>
        <th>CANT</th>
        <th>MEDIDA</th>
        <th>PESO</th>
    </tr>
    
        <?php
        $productos = array(
            array("id"=>"A102051","descripcion"=>"Cebolla en Polvo Onion Powder"),
            array("id"=>"A102052","descripcion"=>"Papel Toalla Interfoliado SUPREMO"),
            array("id"=>"A102053","descripcion"=>"Pimienta Roja Cayenne Pepper BADIA"),
            array("id"=>"A102054","descripcion"=>"Tapas Envases Salseros CMG"),
            array("id"=>"A102055","descripcion"=>"Envase Hamburguesa Ct4 ECOESTRATEGIA"),
            array("id"=>"A102056","descripcion"=>"Pasta Nicolini Codo Rayado NICOLINI"),
            array("id"=>"A102057","descripcion"=>"Vasos Descartables Transparentes NN"),
            array("id"=>"A102058","descripcion"=>"Estropajo para Limpieza CARMELITAS"),
            array("id"=>"A102059","descripcion"=>"Mayonesa ALPESA"),
            array("id"=>"A102060","descripcion"=>"Inca Kola ZERO	")
            
            
            
        );
 

        $columna1 = 12;
        $columna2 = 64;
        $columna3 = 10;
        $columna4 = 15;
        $columna5 = 10;
        //for ($conta=0; $conta <8 ; $conta++) { 
        $conta = 0;
        foreach ($detalles as $producto)
        { $conta++;
            echo '<tr class="font3">
            <td  width="'.$columna1.'%" >'.$producto->prod_sku.' </td>
            <td width="'.$columna2.'%">'.$producto->prod_nombre.'</td>
            <td width="'.$columna3.'%" class="tdCenter">'.$producto->kard_cantidad.'</td>
            <td width="'.$columna4.'%" class="tdCenter">'.$producto->unid_nombre.'</td>
            <td width="'.$columna5.'%" class="tdCenter">'.$producto->prod_peso.'</td>
            </tr>';

        }
        for ($i=$conta; $i <26 ; $i++) { 
        echo '<tr><td>&nbsp;</td><td></td><td></td><td></td><td></td></tr>';

        }
        ?>
        
    </table>
</main>

<footer>
     <table width="100%" border="0">
        <tr>
            <td width="30%" style="vertical-align: top;">
                <div  class="divBorder">
                    <div class="headTable">TRANSPORTISTA</div>
                    <div class="fontPeuenho">NOMBRE:.......................................................</div>
                    <div class="fontPeuenho">RUC:.............................................................</div>
                </div> 
                 
                <div  class="divBorder" style="margin-top: 4px;">
                    <div class="headTable">COMPROBANTE DE PAGO</div>
                    <div class="fontPeuenho">TIPO:...................................N°......................</div>
                    <div class="fontPeuenho">FECHA:.........................................................</div>
                </div>                      

            </td>
            <td width="60%" style="vertical-align: top;" >
                    <div  class="divBorder">
                        <div class="headTable">MOTIVO DEL TRANSLADO</div>
                        
 
                                <div class="fila">
                    
                                    <div class="columnadiv" style="width: 15px;"> <input type="checkbox" name="" id=""> </div>
                                     <div class="columnadiv" style=" width: 50px;"> <span class="checkboxtexto">Venta</span> </div>
                                    
                                    <div class="columnadiv" style="width: 15px"> <input type="checkbox" name="" id=""> </div>
                                    <div class="columnadiv" style=" width: 170px;"><span class="checkboxtexto">  Venta sujeta cofirmacion del comprador</span></div>

                                    <div class="columnadiv" style="width: 15px;"> <input type="checkbox" name="" id=""></div>
                                    <div class="columnadiv" style=" width: 90px;"><span class="checkboxtexto">Zona Primaria</span> </div>
                                    

                                </div>


                                <div class="fila">
                    
                                    <div class="columnadiv" style="width: 15px;"> <input type="checkbox" name="" id=""> </div>
                                     <div class="columnadiv" style=" width: 50px;"> <span class="checkboxtexto">Compra</span> </div>
                                    
                                    <div class="columnadiv" style="width: 15px"> <input type="checkbox" name="" id=""> </div>
                                    <div class="columnadiv" style=" width: 170px;"><span class="checkboxtexto">Traslado entre establecimiento de la misma empresa</span></div>

                                    <div class="columnadiv" style="width: 15px;"> <input type="checkbox" name="" id=""> </div>
                                    <div class="columnadiv" style=" width: 90px;"><span class="checkboxtexto">Exportación</span> </div>


                                </div>
                                
                                

                                <div class="fila">
                    
                                    <div class="columnadiv" style="width: 15px;"> <input type="checkbox" name="" id=""> </div>
                                     <div class="columnadiv" style=" width: 50px;"> <span class="checkboxtexto">Devolución</span> </div>
                                    
                                    <div class="columnadiv" style="width: 15px"> <input type="checkbox" name="" id=""> </div>
                                    <div class="columnadiv" style=" width: 170px;"><span class="checkboxtexto">Traslados de bienes para transformación</span></div>

                                    <div class="columnadiv" style="width: 15px;"> <input type="checkbox" name="" id=""> </div>
                                    <div class="columnadiv" style=" width: 90px;"><span class="checkboxtexto">Importación</span> </div>


                                </div>
                                
                                

                                <div class="fila">
                    
                                    <div class="columnadiv" style="width: 15px;"> <input type="checkbox" name="" id=""> </div>
                                     <div class="columnadiv" style=" width: 50px;"> <span class="checkboxtexto">Consignación</span> </div>
                                    
                                    <div class="columnadiv" style="width: 15px"> <input type="checkbox" name="" id=""> </div>
                                    <div class="columnadiv" style=" width: 170px;"><span class="checkboxtexto">  Recojo de bienes transformados</span></div>

                                    <div class="columnadiv" style="width: 15px;"> <input type="checkbox" name="" id=""> </div>
                                    <div class="columnadiv" style=" width: 90px;"><span class="checkboxtexto">Otros...................................</span> </div>


                                </div>

 
                    </div>     

            </td>
            <td width="20%" style="vertical-align: top;" >
                    <div  class="divBorder">
                        <div class="headTable">&nbsp;</div>
                        <div class="fontPeuenho" style="padding-top: 10px;">...............................................</div>
                        <div class="fontPeuenho" style="text-align: center;">FIRMA</div>
                        <div class="fontPeuenho" style="padding-top: 15px">...............................................</div>
                        <div class="fontPeuenho" style="text-align: center;">RECIBI CONFORME</div>
                    </div>     

            </td>
        </tr>
        

    </table>
</footer>
 
 
</body>
</html>