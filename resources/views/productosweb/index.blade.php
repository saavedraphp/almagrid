@extends('layouts.app')

@section('content')
<ul class="nav">
  <li class="nav-item">
      <a class="nav-link active" aria-current="page" href="/admin/productosweb">Gestion Productos</a>
  </li>

 
  <li class="nav-item">
      <a href="/catalogo/cosmeticos"  class="nav-link">Catálogo WEB</a>
  </li>
</ul>
<div class="container">
<h2 style="padding-bottom: 1em">LISTA DE PRODUCTOS 

  <a href="productosweb/create"> <button type="button" class="btn btn-success float-right">{{MiConstantes::NUEVO}}</button></a>


</h2>
<div style="font-size: 18px;font-weight:bold">
<span style="padding: 0.5em;background-color:rgb(215, 147, 147)">INVERSION:S/ {{number_format($resultado['inversion'],2)}}</span>
<span style="padding: 0.5em;background-color:greenyellow">GANANCIA:S/ {{number_format($resultado['ganancia'],2)}}</span>
<span style="padding: 0.5em;background-color:yellow">TOTAL:S/ {{number_format($resultado['total_venta'],2)}}</span>
</div>
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

 
<br>

<table class="table table-hover" >
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">PRODUCTO</th>
      <th scope="col">CATEGORIA</th>      
      <th scope="col">P.COMPRA</th>
      <th scope="col">P.VENTA</th>
      <th scope="col">DESCUENTO</th>
      <th scope="col">P.FINAL</th>
      <th scope="col">CANT</th>
      <th scope="col">ESTADO</th>
    </tr>
  </thead>
  <tbody id="userList">
  	@foreach($productos as $producto)

    <tr v-for>
      <th scope="row"> {{ $producto->id }} </th>
      <td>{{$producto->nombre}}</td>
      <td>{{$producto->categoria}}</td>
      <td>{{ number_format($producto->precio_compra,2)}}</td>
      <td>{{number_format($producto->precio,2)}}</td>
      <td>{{number_format($producto->descuento,2)}}</td>
      <td>{{number_format($producto->precio_final,2)}}</td>
      <td>{{$producto->cantidad}}</td>
      <td>{{$producto->estado}}</td>

      <td>


        <form action="{{route('productosweb.destroy',$producto->id)}}" method="POST" id="frm_destroy{{$producto->id}}"> 
          @method('DELETE')
          @csrf
        

          <a href="{{route('productosweb.edit',$producto->id)}}" title="{{MiConstantes::EDITAR}}"> <i class="far fa-edit" ></i></a> |
 
          <a title="{{MiConstantes::ELIMINAR}}" href="javascript:document.getElementById('frm_destroy{{$producto->id}}').submit();" onclick="return confirm('Estas Seguro de Borrar el Registro Id:{{$producto->id}}');"><i class="fas fa-trash-alt"></i></a>
 
        </form>

      </td>
    </tr>
    @endforeach
  </tbody>
</table>

<div class="row">
  <div class="mx-auto">{{$productos->links()}}</div>
</div>
</div>

@endsection
@section('scripts')

@endsection
