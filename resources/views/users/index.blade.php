@extends('layouts.app')

@section('content')



<div class="container"  id="container">

<h2>Lista de Usuarios
  @can('admin.usuarios.create')
  <a href="usuarios/create"> <button type="button" class="btn btn-success float-right mr-3">Adicionar</button></a>  
  @endcan

 </h2>


@if($search)
<h6><div class="alert alert-primary" role="alert">
  Resultado de la busqueda '{{$search}}'
  </div>
</h6>
@endif

 

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
      <th scope="col">Usuario</th>
      <th scope="col">Rol</th>      
      <th scope="col">Fecha de Creacion</th>      
      <th scope="col">Estado</th>
      <th scope="col">Opciones</th>
 
    </tr>
  </thead>
  <tbody id="userList">
  	@foreach($users as $fila)

    <tr v-for>
      <th scope="row"> {{ $fila->id }} </th>
      <td>{{$fila->name}}</td>
      <td>@foreach ($fila->roles as $role)
          {{ $role->name }}
          @endforeach
      </td>
      <td>{{ date('M d Y', strtotime($fila->created_at)) }}</td>
      <td>
      @if($fila->estado=='ACTI' )
                    <small class="badge badge-success" v-on:click="cambiar_estado({{$fila->id}})">  Activo </small>
                @else
                    <small class="badge badge-danger">  Baja </small>
                @endif
 
    </td>
      <td>
      <form action="{{route('usuarios.destroy',$fila->id)}}"   id="fr_formulario{{$fila->id}}" method="POST" >
          @method('delete')
          @csrf
      @can('admin.usuarios.edit')
          <a class="badge badge-danger" href="{{route('cambiar_estado_usurio_id',$fila->id)}}" title="Cambiar Estado"> Estado</a> |
          <a href="{{route('usuarios.edit',$fila->id)}}" title="{{MiConstantes::EDITAR}}"> <i class="far fa-edit" ></i></a> |
      @endcan

      @can('admin.usuarios.destroy')      
         <a href="javascript:document.getElementById('fr_formulario{{$fila->id}}').submit()" onclick="return confirm('Estas Seguro de Borrar el Registro Id:{{$fila->id}}');" title="{{MiConstantes::ELIMINAR}}"><i class="fas fa-trash-alt"></i></a>
      @endcan
      </form>
      </td>
    </tr>
    @endforeach
  </tbody>
</table>

<div class="row">
  <div class="mx-auto">{{$users->links()}}</div>
</div>
</div>
 @endsection
 
@section('scripts')



 @endsection