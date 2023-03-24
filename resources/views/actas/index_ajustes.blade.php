@extends('layouts.app')

@section('content')

<div class="container">
<h2>LISTA DE ACTA DE SALIDA SIN CASILLAS 
 

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
      <th>#</th>
      <th scope="col">ACTA ID</th>
      <th scope="col">EMPRESA</th>      
      <th scope="col">ITEMS</th>      
      <th scope="col">FECHA</th>
      <th scope="col">OPCIONES</th>
    </tr>
  </thead>
  <tbody id="userList">
    <?php $conta =0;?>
  	@foreach($actas as $acta)

    <tr v-for>
      <th scope="row">{{++$conta}} </th> 
      <th scope="row"> {{ $acta->acta_id }} </th>
      <td>{{$acta->empr_nombre}}</td>
      <td>{{$acta->items}}</td>
      <td>{{$acta->created_at}}</td>
      <td>


        <form action="{{route('clientes.destroy',$acta->acta_id)}}" method="POST" id="frm_destroy{{$acta->acta_id}}"> 
          @method('DELETE')
          @csrf
   
         <a href="{{route('asignarProductosCeldas',$acta->acta_id)}}" title="{{MiConstantes::EDITAR}}"> <i class="far fa-edit" ></i></a>
 

  

        </form>

      </td>
    </tr>
    @endforeach
  </tbody>
</table>

 
</div>

@endsection
@section('scripts')

@endsection