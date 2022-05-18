@extends('layouts.app')

@section('content')
@inject('empresas','App\Services\Empresas')
@inject('presentaciones','App\Services\Presentaciones')

@section('scripts')
<script src="{{asset('js/productos.js') }}" ></script>

<!-- Include Date Range Picker -->
<script type="text/javascript" src="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/js/bootstrap-datepicker.min.js"></script>
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/bootstrap-datepicker/1.4.1/css/bootstrap-datepicker3.css"/>

 

<script>
	$(document).ready(function(){
		var date_input=$('input[name="fecha_vencimiento"]'); //our date input has the name "date"
		var container=$('.bootstrap-iso form').length>0 ? $('.bootstrap-iso form').parent() : "body";
		date_input.datepicker({
			format: 'yyyy-mm-dd',
			container: container,
			todayHighlight: true,
			autoclose: true,
		})
	})

</script>
@endsection



<div class="container">

<div class="row">
<div class="col-md-8">
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


<form action="{{route('productos.update',$producto->prod_id)}}" method="POST"  id="frm_formulario" @submit="checkForm">
@method('PATCH')
@csrf

  <p v-if="errors.length">
    <b style="color: red;">Por favor, corrija el(los) siguiente(s) error(es):</b>
    <ul>
      <li v-for="error in errors">@{{error}}</li>
    </ul>
  </p>
  <h2>[Editar]  </h2>

  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="producto">Producto</label>
      <input type="text" class="form-control" v-model="producto" name="producto" id="producto" placeholder="Nombre" value="{{$producto->prod_nombre}}">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">P. Inventario</label>
      <input type="text" class="form-control"  v-model="sku" name="sku" id="sku_id" placeholder="SKU" value="{{$producto->prod_sku}}">
    </div>
  </div>



  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="cbo_presentacion_id">Unidad de Medida</label>

      <select class="form-control" aria-label="Default select example" name="cbo_presentacion" id="cbo_presentacion_id"
       v-model="cbo_presentacion_id">
      {{$guion  =""}};
        @foreach ($presentaciones->get() as $index => $value)
        
          <option value={{$index}}  @if($producto->unidad_id ==$index) selected @endif>{{$index.$guion.$value}}</option>
            {{@$guion  =" - "}}
        @endforeach
      </select>
 
   </div>


    <div class="form-group col-md-6">
    <label for="inputAddress">Peso neto KG</label>
        <input type="text" class="form-control" @keypress="esNumerico($event)" id="inputAddress" placeholder="peso" name="peso" value="{{$producto->prod_peso}}">    </div>

    
  </div>



 





 
  <div class="form-group">
    
  <label for="empresa_id">Empresa</label>
      <select v-model="empresa_id" id="empresa_id" data-old="{{old('cbo_empresa')}}"
      name="cbo_empresa"  class="form-control">
      {{$guion  =""}};
        @foreach ($empresas->get() as $index => $value)
        
          <option value={{$index}}  @if($producto->empr_id ==$index) selected @endif>{{$index.$guion.$value}}</option>
            {{@$guion  =" - "}}
        @endforeach
      </select>
 
  </div>

 




    <div class="form-group">
      <label for="inputEmail4">Comentario</label>
      
      <textarea class="form-control" id="comentario_id" name="comentario" rows="3" placeholder="Comentario">{{$producto->prod_comentario}}</textarea>
    </div>
 



  <button type="submit" class="btn btn-primary">Actualizar</button>
  <button type="reset" class="btn btn-danger">Cancelar</button>

</form>
</div>
</div>
</div>
@endsection
@section('scripts')
@endsection