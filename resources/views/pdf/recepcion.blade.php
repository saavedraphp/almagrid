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
          <td width="27%" class="tituloBoldLeft">
           <img src="{{ public_path('/dist/img/logo-trimas.png') }}" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" width="80" height="40" ></td>
          <td width="50%"><p class="tituloBoldLeft">ACTA DE {{strtoupper($acta[0]->tm_nombre)}} NRO: {{$acta[0]->acta_id}}</p></td>
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
          <td class="tituloBoldLeft">NOMBRE</td>
          <td>{{$acta[0]->acta_sub_cliente}}</td>
        </tr>
        <tr>
          <td class="tituloBoldLeft">DOCUMENTO</td>
          <td>{{$acta[0]->tipo_docu_nombre.' - '.$acta[0]->acta_numero_ingr_sali}}</td>
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
$col_small = "10%";
$col_small_l = "20%";
$col_large = "30%";
$col_large_l = "40%";


  ?>
    <table width="100%" border="0">
      <tbody>
          <tr class="th_cabecera">
            <td width="{{$col_small}}">Item</td>
            <td width="{{$col_large_l}}" align="left">Descripcion</td>
            <td width="{{$col_small_l}}">Medida</td>
             <td width="{{$col_small_l}}" align="center">Cantidad</td>
            <td width="{{$col_small}}" align="center">Ubicación</td>
 
          </tr>

          <?php $conta=1?>
          @foreach($detalles as $detalle)
            
            <tr>
              <td align="center" width="{{$col_small}}">{{($conta<10?'0'.$conta:$conta)}}</td>
              <td width="{{$col_large_l}}">{{$detalle->prod_sku}} - {{$detalle->prod_nombre}}</td>
              <td width="{{$col_small_l}}" align="center">{{$detalle->unid_codigo}}<</td>
               <td width="{{$col_small}}" align="center">{{abs($detalle->kard_cantidad)}}</td>
              <td width="{{$col_small_l}}" align="center">{{$detalle->rack_nombre.' - '.$detalle->rc_nombre}}</td>
            </tr>
            <?php
            $conta++;
            ?>
            

          @endforeach  
        </tbody>
      </table>
  </div>
</div>

<p>&nbsp;</p>

</body>
</html>