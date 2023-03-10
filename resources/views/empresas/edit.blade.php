@extends('layouts.app')

@section('content')



<div class="container">
  <div class="card">
    <h5 class="card-header">EMPRESA [Editar]</h5>
    <div class="card-body">

<div class="row">
<div class="col-md-12">

   <form action="{{route('clientes.update',$empresa->empr_id)}}" id="frm_formulario"  name="frm_formulario"  method="POST">
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
        <label for="inputEmail4">EMPRESA</label>
        <input type="text" class="form-control" name="nombre" v-model="nombre_id" id="nombre_id" placeholder="Nombre" value="{{$empresa->empr_nombre}}">
        <input type="hidden" class="form-control" name="empresa_id" v-model="empresa_id" id="empresa_id"  value="{{$empresa->empr_id}}">
        <input type="hidden" class="form-control" name="user_id" v-model="user_id" id="user_id"  value="{{$empresa->user_id}}">
      </div>
      <div class="form-group col-md-6">
        <label for="inputPassword4">DNI / RUC</label>
        <input type="number"   onKeyPress="if(this.value.length==11) return false;"   class="form-control" name="ruc" 
        id="ruc_id" v-model="ruc_id"  placeholder="Ruc" value="{{$empresa->empr_ruc}}">
      </div>
    </div>


    <div class="form-group">
      <label for="inputAddress">DIRECCION</label>
      <input type="text" class="form-control" id="inputAddress" placeholder="Direccion" name="direccion" value="{{$empresa->empr_direccion}}">
    </div>

    <div class="form-row">
    
    <div class="form-group col-md-6">
        <label for="inputPassword4">CELULAR</label>
        <input type="number" pattern="/^-?\d+\.?\d*$/" onKeyPress="if(this.value.length==9) return false;" 
        class="form-control" v-model="celular_id" name="celular" id="celular_id" placeholder="Celular" value="{{$empresa->empr_celular}}">
      </div>


      <div class="form-group col-md-6">
        <label for="inputEmail4">TELEFONO</label>
        <input  type="number" maxlength="9"  class="form-control" name="telefono" id="inputEmail4" placeholder="Telefono" 
        value="{{$empresa->empr_telefono}}">
      </div>


    </div>

    <div class="form-group">
      <label for="inputAddress">CORREO DE USUARIO</label>
      <input   type="text" class="form-control"  readonly  v-model="correo_id"  id="correo_id" placeholder="Email" name="correo" 
      value="{{$empresa->email}}"     >
      <input   type="hidden"  name="correo_original"  value="{{$empresa->email}}"     >

    </div>






      <button type="button" v-on:click="checkForm" class="btn btn-primary">{{MiConstantes::ACTUALIZAR}}</button>
      <button type="reset" class="btn btn-danger">{{MiConstantes::CANCELAR}}</button>


  
  
  </form>
  </div>
  </div>

  </div>
</div>

  <br>
<br>
<hr>


<!--lista contactos-->
<div class="container" id="lista_contacto">
  <div style="text-align:center">
<label for="inputAddress" style="text-align:center">Lista de Contactos</label>
</div>

 <button type="button"   @click="showModal" id="btn_frmcontacto" class="btn btn-success float-right" data-toggle="modal" data-target="#exampleModal">
    Crear Contacto 
</button>
 



        

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


            <a title="{{MiConstantes::ELIMINAR}}"  @click="eliminar_contacto(contacto)"> <i class="fas fa-trash-alt"></i> </a> |
            <a href="#" title="{{MiConstantes::EDITAR}}" @click="obtenerContactoId(contacto)"> <i class="far fa-edit" ></i></a>


            </td>
          </tr>
          </tbody>
          </table>
 

<!-- modal-->
<div class="modal fade"  id="exampleModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
  <div class="modal-dialog" role="document">
    <div class="modal-content">
      <div class="modal-header">
        <h5 class="modal-title" id="exampleModalLabel">Nuevo Contacto</h5>
        <button type="button" class="close" data-dismiss="modal" aria-label="Close">
          <span aria-hidden="true">&times;</span>
        </button>
      </div>
      <div class="modal-body">

      <p v-if="errors.length">
          <b style="color: red;">Por favor, corrija el(los) siguiente(s) error(es):</b>
          <ul>
            <li v-for="error in errors">@{{error}}</li>
          </ul>
        </p>

          <form id="frm_contacto" name="frm_contacto">
            <div class="form-group">
              <label for="recipient-name" class="col-form-label">Nombre:*</label>
              <input type="text" class="form-control" id="nombre"  v-model="nombre"  value="" >
            </div>
            <div class="form-group">
              <label for="message-text" class="col-form-label">Telefono:*</label>
              <input type="text" class="form-control" id="telefono"  v-model="telefono"  value="">
            </div>
            <div class="form-group">
              <label for="message-text" class="col-form-label">Email:</label>
              <input type="text" class="form-control" id="email" v-model="email"  value="">
            </div>
            

          </form>
      </div>

      <div class="modal-footer">
        <button type="button" class="btn btn-secondary" data-dismiss="modal" id="close">Close</button>
        <button type="button" class="btn btn-primary"  @click="grabarContacto()"  >Grabar</button>
      </div>

    </div>
  </div>
</div>
<!--fin modal-->

</div>
   <!--fin lista contactos-->

 







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