@extends('layouts.app')

@section('content')
@inject('empresas','App\Services\Empresas')
@inject('documentos','App\Services\Documentos') 
@inject('servicios','App\Services\Servicios') 
@inject('presentaciones','App\Services\Presentaciones')
@inject('racks','App\Services\Racks')

<h2>CAMBIO DE UBICACION - [{{MiConstantes::NUEVO}}] </h2>
 

<form  method="POST" name="frm_formulario" id="frm_formulario" action="/admin/cambio-ubicacion" >

<p v-if="errors.length">
    <b style="color: red;">Por favor, corrija el(los) siguiente(s) error(es):</b>
    <ul>
      <li v-for="error in errors">@{{error}}</li>
    </ul>
  </p>

<div class="tab-content col-md-12" id="crud">


  <div   id="home">
    
    @csrf
    <div class="form-group">
    
      <label for="inputAddress">Empresa</label>
        <select v-model="selected_empresa"  v-on:change="obtenerProductos" ref="r_empresa"   id="empresa_id" data-old="{{old('cbo_empresa')}}"
        name="cbo_empresa"  class="form-control">

        {{$guion  =""}};
          @foreach ($empresas->get() as $index => $value)
          
            <option value="{{$index}}"  >{{$index.$guion.$value}}</option>
              {{$guion  =" - "}};
          @endforeach
        </select>
   
    </div>

 
    
 



 

    
    <div class="form-row">
      <div class="form-group col-md-12">
      <label for="Productos">Productos</label>

       <select v-model="producto" id="producto_id"  ref="r_producto"   name="producto" class="form-control" v-on:change="obtenerUbicacionProductoId()">
        <option value="0">Selecciona un producto</option>
        <option v-for="producto  in data" v-bind:value="producto" >@{{producto.prod_sku+' - '+producto.prod_nombre+' - '+producto.prod_stock}}</option>
        </select>
     </div>


 
 

 
 
    </div>

    <div class="form-row">

        <div class="form-group col-md-4">
            <label for="inputAddress">Origen</label>
    
     
              <select v-model="selected_casilla" id="casilla_id"  ref="r_casilla"   name="casilla" class="form-control">
                <option value="0" selected>Seleccione una casilla</option>
                <option v-for="casilla  in casillas" v-bind:value="casilla" >@{{casilla.rack_nombre + ' - '+casilla.rc_nombre +'  ('+casilla.total+')'}}</option>
                </select>
    
     
          </div>

          
        <div class="form-group col-md-2">
            <label for="inputAddress">Cantidad</label>
            <input type="number" class="form-control" name="cantidad" id="cantidad_id" ref="r_cantidad" placeholder="Cantidad" 
            value="" v-model="v_cantidad">
        </div>



          <div class="form-group col-md-6">
            <label for="inputAddress">Destino</label>
    
            <div class="input-group-append">
    
              <select v-model="selected_casilla_destino" id="selected_casilla_destino"  ref="selected_casilla_destino"   name="selected_casilla_destino" class="form-control">
                <option value="0" selected>Seleccione una casilla</option>
                <option v-for="casilla  in casillas_destino" v-bind:value="casilla" >@{{casilla.rack_nombre + ' - '+casilla.rc_nombre }}</option>
                </select>
    
                <button type="button" v-on:click="add_producto"   class="btn btn-primary">Ingresar</button>
            </div>
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
                <th scope="col">#</th>
                <th scope="col">#ID</th>
                <th scope="col">PRODUCTO</th>
                 <th scope="col">ORIGEN</th>
                <th scope="col">CANT</th>
                <th scope="col">DESTINO</th>
                <th scope="col">ACCIONES</th>
              </tr>
            </thead>

            <tbody id="userList">
              <tr v-for="(producto, conta) in productos_acta"   >
                <td>@{{conta+1}}</td>
                <td class="item-{{$index}}" scope="row">@{{producto.prod_id}} 
                <input  type="hidden" class="form-control"     v-model="producto.prod_id"  size="3" name="prod_id[]" >
                </td>
                <td>@{{producto.prod_nombre}}</td>
                
                <td>@{{producto.rc_nombre}} 
                  <input v-model="producto.prod_lote" type="hidden" size="3"name="lote[]" >
                  <input v-model="producto.rc_id" type="hidden" size="3"name="rc_id[]" > 
                 </td>

                <td >@{{producto.cantidad}}
                    <input v-model="producto.cantidad" v-on:blur="modificarStock(producto)" v-on:keydown.enter.prevent="modificarStock(producto)" 
                     type="hidden" class="form-control"     size="3" placeholder="Cantidad"    
                          name="cantidad[]" value="0" maxlength="5"   >                
                          

                </td>
                <td>@{{producto.rc_destino}}
                  <input v-model="producto.rc_id_destino" type="hidden" size="3"name="rc_id_destino[]" > 
                </td>

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

    


    <button type="button" @click="checkForm()"   class="btn btn-primary">{{MiConstantes::REGISTRAR}}</button>
    <button type="reset" class="btn btn-danger">{{MiConstantes::CANCELAR}}</button>
    

  </div>

 



    <div   >
    <p>&nbsp;</p>
    
    
 
 


        




    </div>



</div>

</form>
<script>
  const url = '{{ env("MY_URL") }}';
 </script>

<script src="{{ asset('js/frm_traslado.js') }}" ></script>



@endsection

