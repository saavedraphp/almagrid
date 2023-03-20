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
          <td width="27%" class="tituloBoldLeft"><img src="{{ public_path('/dist/img/logo-trimas.png') }}" alt="AdminLTE Logo" class="brand-image img-circle elevation-3" width="80" height="40" ></td>
          <td width="50%"><p class="tituloBoldLeft">LISTA DE PRODUCTOS</p></td>
          <td width="23%"><table width="200" border="0">
            <tbody>
              <tr>
                <td class="tituloBoldLeft">Fecha</td>
                <td> 
                
                {{date('Y-m-d')}}</td>
              </tr>
              <tr>
                <td class="tituloBoldLeft">Hora</td>
                <td>{{date('h:i a')}}</td>
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
          <td width="29%"> <p class="tituloBoldLeft">CONSULTA:</p></td>
          <td width="71%">{{$consulta}}</td>
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
$col_large_l = "60%";


  ?>
    <table width="100%" border="0">
      <tbody>
          <tr class="th_cabecera">
            <td width="{{$col_small}}">ID</td>
            <td width="{{$col_small_l}}" align="left">SKU</td>
            <td width="{{$col_large_l}}" align="left">Productos</td>
             <td width="{{$col_small}}" align="center">Stock</td>
            <td width="{{$col_large}}" align="center">Empresa</td>
 
          </tr>

          <?php $x=1?>
          @foreach($productos as $producto)
            <tr>
              <td align="center" width="{{$col_small}}">{{$producto->prod_id}}</td>
              <td width="{{$col_small_l}}" align="left">{{$producto->prod_sku}}</td>
              <td width="{{$col_large_l}}" align="left">{{$producto->prod_nombre}}<</td>
               <td width="{{$col_small}}" align="center">{{(int)$producto->prod_stock}}</td>
              <td width="{{$col_large}}" align="center">{{$producto->empr_nombre}}</td>
    
   
            </tr>
          @endforeach  
        </tbody>
      </table>
  </div>
</div>

<p>&nbsp;</p>

</body>
</html>