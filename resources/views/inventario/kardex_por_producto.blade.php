@extends('layouts.app')

@section('content')

<div class="container">
  
<div class="form-row">
    
    <div class="form-group col-md-8">
      <label for="producto">KARDEX *</label>
    </div>

    <div class="form-group col-md-4">
      <div class="row btn-custom">
          <div class="btn-group btn-group col-xs-4" >
            <a href="{{ route('downloadKardexProductoId',$producto->prod_id)}}"><button class="btn btn-success col-xs-2">DESCARGAR EXCEL <i class="far fa-file-excel"></i></button></a>
          </div>
        </div>
    
    </div>


  </div>
</div>  
 
 
<h2 style="text-align: center;"></h2>  

     
 
 <STYLE>

.btn-custom {
    margin-bottom: 5px; 
}

.btn-custom button { 
    border-left:none; 
    height: 50px;
}

.bold1
{
  font-weight: 900; 
}


 </STYLE>


 <table class="table table-hover">
      <tbody>
        <tr>
            <td class="bold1">EMPRESA: {{$empresa->empr_id.' - '.$empresa->empr_nombre}}</td>
            <td></td>
            <td></td>
            <td></td>
            <td  class="bold1"><?php echo date('Y-m-d H:i')?></td>
        </tr>

        <tr>
            <td class="bold1">SKU PRODUCTO: {{$producto->prod_sku.' - '.$producto->prod_nombre}} - Total = {{$producto->prod_stock}}</td>
            <td></td>
            <td></td>
            <td></td>
            <td  class="bold1">USUA:{{ Auth::user()->name }}</td>
        </tr>

     </tbody>
 </table>
 
 

@if(Session::get('operacion')=='1')
<div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  {{Session::get('message')}}
</div>
@endif

@if(Session::get('operacion')=='0')
  <div class="alert alert-danger alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    {{Session::get('message')}}
  </div>

@endif



<table class="table table-hover" >
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">MOVIMIENTO</th>
       <th scope="col">ENTRADA</th>
      <th scope="col">SALIDA</th>
      <th scope="col">UBICACION</th>
      <th scope="col">FECHA</th>      
      <th scope="col">COMENTARIOS</th>
    </tr>
  </thead>
  <?php
  setlocale(LC_TIME,"es_ES");
  ?>
  <tbody id="userList">
  	@foreach($kardex as $item)
      
    <tr v-for>
      <th scope="row"> {{ $item->kard_id }}</th>
      <td>{{$item->tm_nombre}}</td>
      <td><?php echo ($item->tm_movimiento=='INGRESO'?$item->kard_cantidad:'0')?></td>
      <td><?php echo ($item->tm_movimiento=='SALIDA'?$item->kard_cantidad:'0')?></td>
      <td>{{$item->rack_nombre.' - '.$item->rc_nombre}}</td>
      <td>{{ date('M d Y h:i', strtotime($item->created_at)) }}</td>
      <td title="{{$item->acta_comentario}}">{{substr($item->acta_comentario, 0, 8)}}</td>
      
    </tr>
    @endforeach
  </tbody>
</table>

<div class="row">
  <div class="mx-auto">{{@$kardex->links()}}</div>
</div>
</div>
 @endsection
@section('scripts')

@endsection