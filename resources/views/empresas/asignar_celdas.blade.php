@extends('layouts.app')

@section('content')



<div class="container">

@if ($errors->any())
    <div class="alert alert-danger">
      <h4>Por Favor corriga los siguientes errores   </h4>
        <ul>
            @foreach ($errors->all() as $error)
                <li>{{ $error }}</li>
            @endforeach
        </ul>
    </div>
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



<form action="{{route('upload_mages',$empresa->empr_id)}}" method="POST" 
id="frm_formulario"  >

@csrf

 

  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Empresa</label>
      {{$empresa->empr_nombre}}  -  {{$empresa->empr_ruc}}
    </div>
  </div>


 


  <div class="form-row">
  
  <div class="form-group col-md-4">
      <ul class="list-group" id="racks_id">
        <li class="list-group-item active" aria-current="true">Racks</li>
        @foreach($racks as $rack)
        <li class="list-group-item"   @click="obtenerCasillas({{$rack->rack_id}})" >{{$rack->rack_nombre}} <a href="" >Add +</a></li>
        @endforeach
   
       </ul>
  </div>


  <div class="form-group col-md-4">
      <ul class="list-group" id="casillas_id">
          <li class="list-group-item active" aria-current="true">Celdas</li>
          <li class="list-group-item"  v-for="option in data" v-bind:value="option.value"  >@{{ option.rc_nombre }} - <a href="" >Add +</a></li>
      </ul>
    
  </div>



  <div class="form-group col-md-4">
    <button type="button" class="list-group-item list-group-item-action active">
      Cedas Asignadas
    </button>
    <button type="button" class="list-group-item list-group-item-action">A - 101</button>
    <button type="button" class="list-group-item list-group-item-action">A - 102</button>
    <button type="button" class="list-group-item list-group-item-action">B - 101</button>
    
  </div>



  </div>

 

  <button type="submit" class="btn btn-primary">Grabar Cambios</button>

  @if(!empty($empresa->empr_ruta_img_reporte))
    <a href="{{route('dropImages',$empresa->empr_id)}}" 
    onclick="return confirm('Estas Seguro de Borrar la Imagen de la Empresa Id:{{$empresa->empr_id}}');">
    <button type="button" class="btn btn-danger">Eliminar Imagen</button></a>
  @endif
</form>
</div>
</div>
</div>
@endsection
@section('scripts')
<script src="{{asset('js/casillasEmpresa.js') }}" ></script>

@endsection