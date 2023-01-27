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

<form  method="POST" name="frm_actas">
<div class="tab-content col-md-10" id="crud">


  <div class="tab-pane fade show active" id="home">
    
    @csrf


    <div class="form-row">
      <div class="form-group col-md-6">
        <label for="inputAddress">Acta Id: {{$acta->acta_id}}</label>
      </div>

      <div class="form-group col-md-6">
        <label for="inputAddress">Fecha de Registro: {{date('M d Y h:i', strtotime($acta->created_at))}}</label>
      </div>      
    </div>


    <div class="form-row">
      <div class="form-group col-md-6">
        <label for="inputAddress">Empresa</label>
        <select  id="empresa_id" name="cbo_empresa"  class="form-control" disabled>
        {{$guion  =""}};
          @foreach ($empresas->get() as $index => $value)
          
            <option value="{{$index}}"  @if($acta->empr_id==$index)   selected @endif >{{$index.$guion.$value}}</option>
              {{$guion  =" - "}};
          @endforeach
        </select>
      </div>

      <div class="form-group col-md-6">
          <label for="inputAddress">Sub Cliente</label>
          <input type="text" class="form-control" name="sub_cliente" id="acta_sub_cliente_id" placeholder="Sub Cliente"
          value="{{$acta->acta_sub_cliente}}" disabled>
      </div>
    </div>
    


 



    <div class="form-row">
      <div class="form-group col-md-6">
          <label for="inputAddress">Tipo de Documento</label>
          <select  id="tipo_documento_id" data-old="{{old('cbo_empresa')}}"
          name="tipo_documento"  class="form-control" disabled>
          {{$guion  =""}};
            @foreach ($documentos->get() as $index => $value)
            
              <option value="{{$index}}"  @if($acta->tipo_docu_id ==$index) selected @endif >{{$index.$guion.$value}}</option>
                {{$guion  =" - "}};
            @endforeach
          </select>
      </div>

      <div class="form-group col-md-6">
          <label for="inputAddress">Nro Documento</label>
          <input type="text" class="form-control" name="nro_documento" id="nro_documento_id" placeholder="Nro Documento" 
          value="{{$acta->acta_numero_ingr_sali}}" disabled>
      </div>
    </div>



 
 


    <div class="form-row">
      <div class="form-group col-md-12">
        <label for="inputAddress">Comentario</label>
        <textarea class="form-control" id="comentario_id" name="comentario" rows="3" disabled>{{$acta->acta_comentario}}</textarea>
     </div>

    </div>

    


    

  </div>

 



    <div class="tab-pane fade" id="profile">
    <p>&nbsp;</p>
    
    
 



 
        <div class="col-sm-12">
          <table class="table table-hover" >
            <thead>
              <tr>
                <th scope="col">#</th>
                <th scope="col">Producto</th>
                 <th scope="col">Cantidad</th>
                 @if($acta->tipo_movimiento_codigo!='DESPACHO')
                 <th scope="col">Casilla</th>
                 @endif
               </tr>
            </thead>

            <tbody id="userList">
            @foreach($detalles as $item)
              <tr >
               <td class="item-{{$index}}" scope="row">{{$item->prod_id}}
                <input  type="hidden" class="form-control"     v-model="producto.prod_id"  size="3" name="prod_id[]" >
                </td>
                <td>{{$item->prod_sku.' - '.$item->prod_nombre}}</td>
                
                <td > <span style="text-align: center;" >{{abs($item->kard_cantidad)}}</span></td>

                 <td > <span style="text-align: center;" >{{$item->rack_nombre.' - '.$item->rc_nombre}}</span></td>
 
              </tr>
            @endforeach  
            
            <tr>
              <td colspan="4">
                <input  type="hidden" class="form-control"  size="3"  v-model="total_productos"  name="txt_total_productos"  value="0">
                <input  type="hidden" class="form-control"  size="3"   id="operacion_id" name="operacion"  value="1">
            </td>
            
            </tr>


                  
          
            </tbody>
          </table>
        </div>

        




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

 
@endsection