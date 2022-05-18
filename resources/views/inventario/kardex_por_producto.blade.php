@extends('layouts.app')

@section('content')


 
 
<h2 style="text-align: center;">KARDEX</h2>
 
 <STYLE>
     .bold1
     {
        font-weight: 900; 
     }
 </STYLE>
 <table class="table table-hover">
      <tbody>
        <tr>
            <td class="bold1">EMPRESA: {{$empresa->empr_nombre}}</td>
            <td></td>
            <td></td>
            <td></td>
            <td  class="bold1"><?php echo date('Y-m-d H:i')?></td>
        </tr>

        <tr>
            <td class="bold1">PRODUCTO: {{$producto->prod_nombre}} - Total = {{$producto->prod_stock}}</td>
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
      <th scope="col">Fecha</th>
      <th scope="col">Movimiento</th>
      <th scope="col">Lote</th>
      <th scope="col">Entrada</th>
      <th scope="col">Salida</th>
      <th scope="col">Comentario</th>
    </tr>
  </thead>
  <tbody id="userList">
  	@foreach($kardex as $item)
      
    <tr v-for>
      <th scope="row"> {{ $item->kard_id }} </th>
      <td>{{ date('M d Y h:i', strtotime($item->created_at)) }}</td>
      <td>{{$item->tipo_movimiento}}</td>
      <td>{{$item->lote_id}}</td>
      <td><?php echo ($item->tipo_movimiento=='INGRESO'?$item->kard_cantidad:'0')?></td>
      <td><?php echo ($item->tipo_movimiento=='DESPACHO'?$item->kard_cantidad:'0')?></td>
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