@extends('layouts.app')

@section('content')



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

   <form action="{{route('clientes.update',$empresa->empr_id)}}" id="frm_formulario" @submit="checkForm" method="POST">
@method('PATCH')
@csrf
<p v-if="errors.length">
    <b style="color: red;">Por favor, corrija el(los) siguiente(s) error(es):</b>
    <ul>
      <li v-for="error in errors">@{{error}}</li>
    </ul>
  </p>

  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Empresa</label>
      <input type="text" class="form-control" name="nombre" v-model="nombre_id" id="nombre_id" placeholder="Nombre" value="{{$empresa->empr_nombre}}">
      <input type="text" class="form-control" name="empresa_id" v-model="empresa_id" id="empresa_id"  value="{{$empresa->empr_id}}">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">DNI / RUC</label>
      <input type="number"   onKeyPress="if(this.value.length==11) return false;"   class="form-control" name="ruc" 
      id="ruc_id" v-model="ruc_id"  placeholder="Ruc" value="{{$empresa->empr_ruc}}">
    </div>
  </div>


  <div class="form-group">
    <label for="inputAddress">Direccion</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="Direccion" name="direccion" value="{{$empresa->empr_direccion}}">
  </div>

  <div class="form-group">
    <label for="inputAddress">Correo</label>
    <input   type="text" class="form-control"   v-model="correo_id"  id="correo_id" placeholder="Email" name="correo" 
    value="{{$empresa->empr_correo}}"  @blur="existeEmail" >
    <span    v-if="encontroEmail" class="alert alert-danger">El correo existe en nuestra base de datos</span>
  </div>


  <div class="form-row">
  
  <div class="form-group col-md-6">
      <label for="inputPassword4">Celular</label>
      <input type="number" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==9) return false;" class="form-control" v-model="celular_id" name="celular" id="celular_id" placeholder="Celular" value="{{$empresa->empr_celular}}">
    </div>


    <div class="form-group col-md-6">
      <label for="inputEmail4">Telefono</label>
      <input  type="number" maxlength="9"  class="form-control" name="telefono" id="inputEmail4" placeholder="Telefono" 
      value="{{$empresa->empr_telefono}}">
    </div>


  </div>

 
  <hr>
  <div class="form-group">
    <label for="inputAddress">Lista de Contactos</label>
    <input   type="text" class="form-control"   v-model="contacto"  id="contacto" placeholder="Contacto" name="contacto" 
    value="{{$empresa->empr_contacto}}"  >


    <table class="table table-hover" >
      <thead>
        <tr>
          <th scope="col">#</th>
          <th scope="col">Nombre</th>
          <th scope="col">Telefono</th>      
          <th scope="col">Email</th>
          <th scope="col">Opciones</th>
        </tr>
      </thead>
     
      <tbody id="userList">
 
 <tr v-for="contacto in data">
   <th scope="row"> @{{contacto.id }} </th>
   <td>@{{contacto.nombre}}</td>
   <td>@{{contacto.telefono}}</td>
   <td>@{{contacto.email}}</td>
   <td>

 opciones

   </td>
 </tr>
</tbody>
  </table>



    <button type="button" class="btn btn-primary" data-toggle="modal" data-target="#exampleModal">
  Crear Contacto
</button>
   </div>


  <button type="submit" class="btn btn-primary">Actualizar</button>
  <button type="reset" class="btn btn-danger">Cancelar</button>


  <!-- Modal -->
 
</form>

<!-- modal-->
<div class="modal fade" id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nuevo Contacto</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">
        <form id="frm_contacto" name="frm_contacto">
          <div class="form-group">
            <label for="recipient-name" class="col-form-label">Nombre:</label>
            <input type="text" class="form-control" id="nombre" value="Luis">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">Telefono:</label>
            <input type="text" class="form-control" id="telefono" value="123456">
          </div>
          <div class="form-group">
            <label for="message-text" class="col-form-label">Email:</label>
            <input type="text" class="form-control" id="email" value="saavedraphp@gmail.com">
          </div>
          

        </form>
      </div>
      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
        <button type="button" class="btn btn-primary"  @click="adicionarContacto()"  >Grabar</button>
      </div>
    </div>
  </div>
</div>
<!--fin modal-->


</div>
</div>
</div>


@endsection
@section('scripts')
<script>
  const url = '{{ env("MY_URL") }}';
  
</script>
<script src="{{asset('js/frm_empresa.js') }}" ></script>

<script src="{{asset('js/frm_contacto.js') }}" ></script> 
@endsection