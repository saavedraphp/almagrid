@extends('layouts.app')

@section('content')
@inject('empresas','App\Services\Empresas')
@inject('documentos','App\Services\Documentos') 
@inject('servicios','App\Services\Servicios') 
@inject('presentaciones','App\Services\Presentaciones')

<h2>{{$array_titulos['CABECERA']}}</h2>
<ul class="nav nav-tabs">
    <li class="nav-item">
        <a href="#home" class="nav-link active" data-toggle="tab">Acta</a>
    </li>
    <li class="nav-item">
        <a href="#profile" class="nav-link" data-toggle="tab">{{$array_titulos['TAB']}}</a>
    </li>
 
</ul>

<form  method="POST" name="frm_formulario" id="frm_formulario">
@csrf
<div class="tab-content col-md-10" id="crud">


  <div class="tab-pane fade show active" id="home">
    
   
 
    <div class="form-row">
      <div class="form-group col-md-6">
          <label for="inputAddress">Empresa</label>
          <input type="text" class="form-control"  
          value="{{$empresa->empr_nombre}}" disabled>
           <input type="hidden" class="form-control"  id="empresa_id" v-model="empresa_id"
          value="{{$empresa->empr_id}}" >
 

      </div>

      <div class="form-group col-md-6">
          <label for="inputAddress">Acta Id</label>
          <input type="text" class="form-control" value="{{$acta->acta_id}}"   disabled>
          <input type="hidden" class="form-control" value="{{$acta->acta_id}}" v-model="acta_id" id="acta_id" >
      </div>
    </div>


    <div class="col-sm-12">
          <table class="table table-hover" >
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Producto</th>
                <th scope="col">Lote</th>

                <th scope="col">Cantidad</th>
                <th scope="col">Casilla</th>
               </tr>
            </thead>

            <tbody id="userList">
            @foreach($detalles as $item)
              <tr >
               <th class="item" scope="row">{{$item->prod_id}}
                 </th>
                <td>{{$item->prod_nombre}}</td>
                <td>{{$item->lote_id}}</td>

                <td align="center"> {{abs($item->kard_cantidad)}}</td>
                <td>
                    <select v-model="producto" id="producto_id"  ref="r_producto"   name="producto" class="form-control">
                      <option value="">Selecciona un producto</option>
                      <option v-for="casilla  in data" v-bind:value="casilla" >@{{casilla.rack_nombre+' - '+casilla.rc_nombre}}</option>
                    </select>
                </td>
              </tr>
            @endforeach  
 

                  
          
            </tbody>
          </table>

        </div>


        <div class="form-group col-md-12">
        <button type="button" @click="checkForm()"   class="btn btn-primary float-right">Grabar Asignacion</button>        
        </div>

        

    


    

  </div>

 



    <div class="tab-pane fade" id="profile">
    <p>&nbsp;</p>
    
 

    </div>



</div>

</form>



@endsection
@section('scripts')

<script>
function grabarActa()
{

  document.frm_actas.action = '/admin/actas';
  document.frm_actas.submit();


}

function mensaje(obj)
{

  alert(obj)
}
</script>
<script>
  const url = '{{ env("MY_URL") }}';
 </script>

<script src="{{ asset('js/asignarCasillaProducto.js')}}" ></script>

 
@endsection