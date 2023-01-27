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



<form     id="frm_formulario"   @submit="validar_casillas" >
 @method('PATCH')
@csrf

  <div class="form-row">
    
    <div class="form-group col-md-6">
    <input name="id_empresa" type="hidden" value="{{$empresa->empr_id}}" id="id_empresa"  v-model="id_empresa">
      <label for="inputEmail4">Empresa</label>
      {{$empresa->empr_id.' - '.$empresa->empr_nombre}}  -  {{$empresa->empr_ruc}}
    </div>
  </div>


 


  <div class="form-row">
  

  <div class="form-group col-md-4">
      <button type="button" class="list-group-item list-group-item-action active"> Racks </button>
      @foreach($racks as $rack)
      <button type="button" class="list-group-item list-group-item-action" v-on:click="obtenerCasillas({{$rack->rack_id}})" >{{$rack->rack_nombre}}</button>
      @endforeach
  </div>


  <div class="form-group col-md-4">
      <ul class="list-group" id="casillas_id">
          <li class="list-group-item active" aria-current="true">Celdas</li>
          
          <li  class="list-group-item"  v-for="option in casillas_rack" v-bind:value="option.value" 
              :class="{ 'disabled': option.empr_nombre }"  >@{{ option.rc_nombre }} - @{{ (option.empr_nombre?option.empr_nombre:'DISPONIBLE') }}
            
              <a href="#"  v-on:click="asignarCasilla(option)"><i class="fas fa-plus-circle" style="font-size: 12px;"></i></a>
        
          </li>

      </ul>
    
  </div>



  <div class="form-group col-md-4">
  <ul class="list-group" id="casillas_id">
          <li class="list-group-item active" aria-current="true">Celdas a Asignar</li>
          <li class="list-group-item"  v-for="(option, index) in casillas_empresa" v-bind:value="option.value"  >@{{ option.rack_nombre+' - '+option.rc_nombre }} - 
          <a href="#"  v-on:click="quitarCasilla(index)"><i class="fas fa-minus-circle" style="font-size: 12px;"></i></a></li>
      </ul>
    
  </div>



  </div>

 

  <button type="submit" class="btn btn-primary">Adicionar Celdas</button>
 
</form>
</div>
</div>
</div>

<script>
  const url = '{{ env("MY_URL") }}';
  
</script>

<script src="{{asset('js/casillasEmpresa.js') }}" ></script>
@endsection
