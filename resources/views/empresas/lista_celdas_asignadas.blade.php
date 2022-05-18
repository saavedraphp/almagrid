@extends('layouts.app')

@section('content')



<div class="container">


<h2>Lista de Casillas Asignadas: {{$empresa->empr_nombre}}

  <a href="{{route('elegir_celdas',$empresa->empr_id)}}"> <button type="button" class="btn btn-success float-right mr-3">Adicionar</button></a>  

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
      <th scope="col">Casilla</th>
      <th scope="col">Fecha de Creacion</th>      
    </tr>
  </thead>
  <tbody id="userList">
    <?php
     ?>
  	@foreach($casillas_x_empresa as $fila)

    <tr v-for>
      <th scope="row"> {{ $fila->id }} </th>
      <td>{{$fila->rack_nombre}}</td>
      <td>{{$fila->rc_nombre}}</td>
      <td>{{ date('M d Y', strtotime($fila->created_at)) }}</td>

      <td>


        <form action="{{route('racks.destroy',$fila->rack_id)}}" method="POST" id="frm_destroy{{$fila->rack_id}}">
          @method('DELETE')
          @csrf
          
          <a href="{{route('racks.edit',$fila->rack_id)}}" title="{{MiConstantes::EDITAR}}"> <i class="far fa-edit" ></i></a> |
          <a href="javascript:document.getElementById('frm_destroy{{$fila->rack_id}}').submit();" onclick="return confirm('Estas Seguro de Borrar el Registro Id:{{$fila->rack_id}}');" title="{{MiConstantes::ELIMINAR}}"><i class="fas fa-trash-alt"></i></a>
         
     
        </form>

      </td>
    </tr>
    @endforeach
  </tbody>
</table>

<div class="row">
  <div class="mx-auto">{{$casillas_x_empresa->links()}}</div>
</div>
</div>
 @endsection
@section('scripts')

@endsection