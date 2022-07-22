@extends('layouts.app')

@section('content')

<div class="container">
<h2>Lista de Clientes 
@can('admin.clientes.create')
  <a href="clientes/create"> <button type="button" class="btn btn-success float-right">Adicionar</button></a>
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

<form action="" method="GET" class="card-header" >
<div class="form-outline">
  <div class="form-row">
    
    <div class="form-group col-md-5" >
      <div class="input-group input-group-sm">
          <input class="form-control form-control-navbar" type="search" placeholder="Buscar" aria-label="Search" name="search">
          <div class="input-group-append">
              <button class="btn btn-navbar" type="submit">
                  <i class="fas fa-search"></i>
              </button>
          </div>
      </div>

    </div>
  </div>

  </div>
 
</form>
<br>

<table class="table table-hover" >
  <thead>
    <tr>
      <th scope="col">#</th>
      <th scope="col">Clientes</th>
      <th scope="col">Ruc</th>      
      <th scope="col">Email</th>
      <th scope="col">Telefono</th>
      <th scope="col">Opciones</th>
    </tr>
  </thead>
  <tbody id="userList">
  	@foreach($empresas as $empresa)

    <tr v-for>
      <th scope="row"> {{ $empresa->empr_id }} </th>
      <td>{{$empresa->empr_nombre}}</td>
      <td>{{$empresa->empr_ruc}}</td>
      <td>{{$empresa->email}}</td>
      <td>{{$empresa->empr_telefono}}</td>

      <td>


        <form action="{{route('clientes.destroy',$empresa->empr_id)}}" method="POST" id="frm_destroy{{$empresa->empr_id}}"> 
          @method('DELETE')
          @csrf


        <a href="{{route('lista_casillas_asignadas',$empresa->empr_id)}}" title="{{MiConstantes::ASIGNAR_CASILLAS}}"> <i class="fas fa-border-none"></i></a> |
        <a href="{{route('imagesHead',$empresa->empr_id)}}" title="{{MiConstantes::IMG_REPORTE}}"> <i class="far fa-images" ></i></a> |
         @can('admin.empresas.edit')
         <a href="{{route('clientes.edit',$empresa->empr_id)}}" title="{{MiConstantes::EDITAR}}"> <i class="far fa-edit" ></i></a> |
         @endcan

         @can('admin.empresas.destroy')
         <a title="{{MiConstantes::ELIMINAR}}" href="javascript:document.getElementById('frm_destroy{{$empresa->empr_id}}').submit();" onclick="return confirm('Estas Seguro de Borrar el Registro Id:{{$empresa->empr_id}}');"><i class="fas fa-trash-alt"></i></a>
         @endcan

        </form>

      </td>
    </tr>
    @endforeach
  </tbody>
</table>

<div class="row">
  <div class="mx-auto">{{$empresas->links()}}</div>
</div>
</div>

@endsection
@section('scripts')

@endsection