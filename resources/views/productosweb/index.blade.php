@extends('layouts.app')

@section('content')

<div class="container">
<h2>LISTA DE PRODUCTOS 

  <a href="productosweb/create"> <button type="button" class="btn btn-success float-right">{{MiConstantes::NUEVO}}</button></a>


</h2>

 


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
      <th scope="col">PRECIO</th>
      <th scope="col">OFERTA</th>
      <th scope="col">ESTADO</th>
    </tr>
  </thead>
  <tbody id="userList">
  	@foreach($productos as $producto)

    <tr v-for>
      <th scope="row"> {{ $producto->id }} </th>
      <td>{{$producto->nombre}}</td>
      <td>{{$producto->categoria}}</td>
      <td>{{$producto->precio}}</td>
      <td>{{$producto->oferta}}</td>
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
