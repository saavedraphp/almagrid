@extends('layouts.app')

@section('content')
<div class="container">

<div class="row">
<div class="col-md-8">
<form action="{{route('usuarios.update',$usuario->usua_id)}}" method="POST">
@method('PATCH')
@csrf
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Nombre</label>
      <input type="text" class="form-control" name="nombre" id="inputEmail4" placeholder="Nombre" value="{{$usuario->usua_nombre}}">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Email</label>
      <input type="text" class="form-control" name="email" id="inputPassword4" placeholder="Email" value="{{$usuario->usua_email}}">
    </div>
  </div>

  <div class="form-group">
    <label for="inputAddress">Direccion</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St" name="direccion" value="{{$usuario->usua_direccion}}">
  </div>
 
  <div class="form-row">
    <div class="form-group col-md-4">
      <label for="inputCity">Pais</label>
      <select id="inputState" class="form-control" name="pais_id">
        <option selected>Choose...</option>

        @foreach ($paises as $key => $value)
          <option value="{{$value->id}}"
          @if($usuario->pais_id==$value->id) selected @endif  
            >{{$value->pais_nombre}}</option>  
        @endforeach
        
      </select>

    </div>

    <div class="form-group col-md-4">
      <label for="inputCity">Estado</label>
       <select id="inputState" class="form-control" name="estado_id">
        <option selected>Choose...</option>
        <option>...</option>
        </select>
    </div>

    <div class="form-group col-md-4">
      <label for="inputState">Ciudad</label>
      <select id="inputState" class="form-control" name="ciudad_id">
        <option selected>Choose...</option>
        <option>...</option>
      </select>
    </div>
  </div>


   <div class="form-group">
    <label for="inputZip">Zip</label>
      <input type="text" class="form-control" id="inputZip" name="zip"
      value="{{$usuario->usua_code_zip}}">
    </div>





  <div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="gridCheck">
      <label class="form-check-label" for="gridCheck">
        Check me out
      </label>
    </div>
  </div>


  <button type="submit" class="btn btn-primary">Actualizar</button>
  <button type="reset" class="btn btn-danger">Cancelar</button>

</form>
</div>
</div>
</div>
@endsection
