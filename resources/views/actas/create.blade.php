@extends('layouts.app')

@section('content')
@inject('empresas','App\Services\Empresas')
@inject('documentos','App\Services\Documentos') 
@inject('servicios','App\Services\Servicios') 
@inject('presentaciones','App\Services\Presentaciones')
@inject('racks','App\Services\Racks')

<h2>[Nuevo] </h2>
 

<form  method="POST" name="frm_formulario" id="frm_formulario" action="/admin/recepcion" >

<p v-if="errors.length">
    <b style="color: red;">Por favor, corrija el(los) siguiente(s) error(es):</b>
    <ul>
      <li v-for="error in errors">@{{error}}</li>
    </ul>
  </p>

<div class="tab-content col-md-10" id="crud">


  <div   id="home">
    
    @csrf
    <div class="form-group">
    
      <label for="inputAddress">Empresa</label>
        <select v-model="selected_empresa"  @change="obtenerProductos"  ref="r_empresa" id="empresa_id" data-old="{{old('cbo_empresa')}}"
        name="cbo_empresa"  class="form-control">
        {{$guion  =""}};
          @foreach ($empresas->get() as $index => $value)
          
            <option value="{{$index}}"  >{{$index.$guion.$value}}</option>
              {{$guion  =" - "}};
          @endforeach
        </select>
   
    </div>



 
    <div class="form-group">
      <label for="inputEmail4">Usuario</label>
      <input type="text" class="form-control"  v-model="acta_sub_cliente_id" name="sub_cliente" id="acta_sub_cliente_id" placeholder="Sub Cliente"
       value="{{old('acta_sub_cliente')}}" >
    </div>
 
 



    <div class="form-row">
      <div class="form-group col-md-6">
          <label for="inputAddress">Tipo de Documento</label>
          <select  v-model="tipo_documento_id" id="tipo_documento_id" data-old="{{old('cbo_empresa')}}"
          name="tipo_documento"  class="form-control">
          {{$guion  =""}};
            @foreach ($documentos->get() as $index => $value)
            
              <option value="{{$index}}"  >{{$index.$guion.$value}}</option>
                {{$guion  =" - "}};
            @endforeach
          </select>
      </div>

      <div class="form-group col-md-6">
          <label for="inputAddress">Nro Documento</label>
          <input type="text" class="form-control" name="nro_documento" id="nro_documento_id" placeholder="Nro Documento" 
          value="{{old('codigo_producto')}}">
      </div>
    </div>




 

    
    <div class="form-row">
      <div class="form-group col-md-6">
      <label for="Productos">Productos</label>

       <select v-model="producto" id="producto_id"  ref="r_producto"   name="producto" class="form-control">
        <option value="">Selecciona un producto</option>
        <option v-for="producto  in data" v-bind:value="producto" >@{{producto.prod_nombre+' - '+producto.prod_stock}}</option>
        </select>
     </div>


 
 

      <div class="form-group col-md-6">
          <label for="inputAddress">Cantidad</label>
          <input type="number" class="form-control" name="cantidad" id="cantidad_id" ref="r_cantidad" placeholder="Cantidad" 
          value="" v-model="v_cantidad">
      </div>

 
    </div>



    <div class="form-row">

    <div class="form-group col-md-6">
            <label for="producto">Rack *</label>
            <select  v-model="selected_rack" name="rack" id="rack_id"  ref="r_rack" @change="obtenerCasillasRackId($event.target.value)" class="form-control" >
                 @foreach ($racks->get() as $index => $value)
                  <option value={{$index}}>{{$value}}</option>
                @endforeach
              </select>
        </div>



      <div class="form-group col-md-4">
      <label for="Productos">Casillas</label>

       <select v-model="selected_casilla" id="casilla_id"  ref="r_casilla"   name="casilla" class="form-control">
        <option value="">Seleccione una casilla</option>
        <option v-for="casilla  in casillas" v-bind:value="casilla" >@{{casilla.rc_nombre}}</option>
        </select>
     </div>


 

      <div class="form-group col-md-2" >
      <label for="Productos">&nbsp;</label>
<br>
      <button type="button" @click="add_producto"   class="btn btn-primary">Ingresar</button>

      </div>


    </div>
    
    

    <select  v-model="lote" id="lote" data-old="{{old('lote')}}"
      name="lote_id"  class="form-control" style="visibility:hidden">
      @foreach($lotes as $lote)
      
        <option value="{{$lote->lote_nombre}}"  >{{$lote->lote_nombre.' - '.$lote->lote_fecha_vencimiento}}</option>
        @endforeach
    </select>
        

 

<!--tabla-->
<div class="col-sm-12">
          <table class="table table-hover"  >
            <thead>
              <tr>
                <th scope="col">#ID</th>
                <th scope="col">Producto</th>
                 <th scope="col">Stock</th>
                <th scope="col">Ingreso</th>
                <th scope="col">Casilla</th>
                <th scope="col">Accion</th>
              </tr>
            </thead>

            <tbody id="userList">
              <tr v-for="producto in productos_acta"   >
                <th class="item-{{$index}}" scope="row">@{{producto.prod_id}} 
                <input  type="hidden" class="form-control"     v-model="producto.prod_id"  size="3" name="prod_id[]" >
                </th>
                <td>@{{producto.prod_nombre}}
                  <input v-model="producto.prod_lote" type="hidden" size="3"name="lote[]" > 
                  <input v-model="producto.rc_id" type="hidden" size="3"name="rc_id[]" > 
                </td>
            
                <td>@{{producto.stock_x_lote}}</td>
                <td >@{{producto.cantidad}}
                    <input v-model="producto.cantidad" v-on:blur="modificarStock(producto)" v-on:keydown.enter.prevent="modificarStock(producto)" 
                     type="hidden" class="form-control"     size="3" placeholder="Cantidad"    
                          name="cantidad[]" value="0" maxlength="5">                
                          
 

                                  

                </td>
                <td>@{{producto.rc_nombre}}</td>
              <td><button type="button" class="btn btn-default" @click="removeItem(producto)">Remove</button></td>  
              </tr>
              
              <tr>
              <td colspan="6"><input  type="hidden" class="form-control"  size="3"  v-model="total_productos"  name="txt_total_productos"  value="0"></td>
              <input  type="hidden" class="form-control"  size="3"   id="operacion_id" name="operacion"  value="1">
              </tr>
          
            </tbody>
          </table>
        </div>
<!--tabla-->



    <div class="form-row">
      <div class="form-group col-md-12">
        <label for="inputAddress">Comentario</label>
        <textarea class="form-control" id="comentario_id" name="comentario" rows="3"></textarea>
     </div>

    </div>

    


    <button type="button" @click="checkForm()"   class="btn btn-primary">Registrar</button>
    <button type="reset" class="btn btn-danger">Cancelar</button>
    

  </div>

 



    <div   >
    <p>&nbsp;</p>
    
    
 
 


        




    </div>



</div>

</form>



@endsection
@section('scripts')

<script>
  const url = '{{ env("MY_URL") }}';
  
 </script>

<script src="{{ asset('js/lista_productos.js') }}" ></script>
 
@endsection