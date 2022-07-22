@extends('layouts.app')

@section('content')



<div class="container">

<h2>Lista de roles

  @can('admin.roles.create')
  <a href="roles/create"> <button type="button" class="btn btn-success float-right mr-3">Adicionar</button></a>  
  @endcan
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

 

<table class="table table-hover" >
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Rack</th>
      
      <th scope="col">Fecha de Creacion</th>      
      <th scope="col">Accion</th>
    </tr>
  </thead>
  <tbody id="userList">
  	@foreach($filas as $fila)

    <tr v-for>
      <th scope="row"> {{ $fila->id }} </th>
      <td>{{$fila->name}}</td>
      <td>{{ date('M d Y', strtotime($fila->created_at)) }}</td>

      <td>


        <form action="{{route('roles.destroy',$fila->id)}}" method="POST" id="frm_destroy{{$fila->id}}">
          @method('DELETE')
          @csrf
          
          @can('admin.roles.edit')
          <a href="{{route('roles.edit',$fila->id)}}" title="{{MiConstantes::EDITAR}}"> <i class="far fa-edit" ></i></a> |
          @endcan

          @can('admin.roles.destroy')
          <a href="javascript:document.getElementById('frm_destroy{{$fila->id}}').submit();" onclick="return confirm('Estas Seguro de Borrar el Registro Id:{{$fila->id}}');" title="{{MiConstantes::ELIMINAR}}"><i class="fas fa-trash-alt"></i></a>
          @endcan
     
        </form>

      </td>
    </tr>
    @endforeach
  </tbody>
</table>

<div class="row">
  <div class="mx-auto">{{$filas->links()}}</div>
</div>
</div>
 @endsection
@section('scripts')

@endsection