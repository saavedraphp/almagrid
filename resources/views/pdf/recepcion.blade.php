<!DOCTYPE html>
<html>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Document</title>
 
<style> 

body
{
  font-family: Arial, Helvetica, sans-serif;
  font-size: 10;
	
}


#main {
  width: auto;

  border: 1px solid #c3c3c3;
  align-content: center;
  padding:10px
}

#main div {
  width: auto;

  align-content: center;
}

.th_cabecera
{
	font-weight:bold;
	text-align:center;
}
	
 
	
.tituloBoldLeft
{
	font-weight:bold;
	text-align:left;	
}
</style>
</head>
<body>

<div id="main">
  <div style="background-color:CAD7D7;">
    <table width="90%" border="0">
      <tbody>
        <tr>
          <td width="27%" class="tituloBoldLeft">SISTEMA DE ALMACEN</td>
          <td width="50%"><p class="tituloBoldLeft">ACTA DE RECEPCION NRO. {{$acta[0]->acta_id}}</p></td>
          <td width="23%"><table width="200" border="0">
            <tbody>
              <tr>
                <td class="tituloBoldLeft">Fecha</td>
                <td> 
                
                {{date('Y-m-d', strtotime(str_replace('-','/', $acta[0]->created_at)))}}</td>
              </tr>
              <tr>
                <td class="tituloBoldLeft">Hora</td>
                <td>{{date('h:i a', strtotime($acta[0]->created_at))}}</td>
              </tr>
            </tbody>
          </table></td>
        </tr>
      </tbody>
    </table>

  
  </div>
  <div style="background-color:FFFFFF;">
  
  <table width="90%" border="0">
      <tbody  >
        <tr>
          <td colspan="2"><strong>DATOS GENERALES</strong></td>
        </tr>
        <tr>
          <td width="29%"> <p class="tituloBoldLeft">CLIENTE</p></td>
          <td width="71%">{{$acta[0]->empr_nombre}}</td>
        </tr>
        <tr>
          <td class="tituloBoldLeft">TIPO DE DOCUMENTO</td>
          <td>{{$acta[0]->tipo_docu_nombre}}</td>
        </tr>
        <tr>
          <td class="tituloBoldLeft">NRO DOCUMENTO</td>
          <td>{{$acta[0]->acta_numero_ingr_sali}}</td>
        </tr>
        <tr>
          <td>&nbsp;</td>
          <td>&nbsp;</td>
        </tr>
      </tbody>
    </table>
    
  </div>
  <div style="background-color:FFFFFF;">
  <?php
$col1 = "10%";
$col2 = "20%";
$col3 = "30%";
$col4 = "40%";


  ?>
    <table width="90%" border="0">
      <tbody>
          <tr class="th_cabecera">
            <td width="6%">Item</td>
            <td width="{{$col4}}" align="left">Descripcion</td>
            <td width="9%">Presentacion</td>
            <td width="{{$col1}}" align="center">Lote</td>
            <td width="{{$col1}}" align="center">Serie</td>
            <td width="{{$col1}}" align="center">Codigo</td>
            <td width="{{$col1}}" align="center">Cantidad</td>
 
          </tr>

 
          @foreach($detalles as $detalle)
         <?php $x=1?>
         
         
         
      
            
            <tr>
              <td align="center">{{$x}}</td>
              <td width="{{$col4}}">{{$detalle->prod_id}} - {{$detalle->prod_nombre}}</td>
              <td width="{{$col2}}" align="center">{{$detalle->pres_nombre}}<</td>
              <td width="{{$col1}}" align="center">{{$detalle->prod_lote}}</td>
              <td width="{{$col1}}" align="center">{{$detalle->prod_serie}}</td>
              <td width="{{$col1}}" align="center">{{$detalle->prod_codigo}}</td>
              <td width="{{$col1}}" align="center">{{$detalle->kard_cantidad}}</td>
    
   
            </tr>
          @endforeach  
        </tbody>
      </table>
  </div>
</div>

<p>&nbsp;</p>

</body>
</html>