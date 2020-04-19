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

<form action="/usuarios" method="POST">
@csrf
  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Nombre</label>
      <input type="text" class="form-control" name="nombre" id="inputEmail4" placeholder="Nombre" value="{{old('nombre')}}">
    </div>
    <div class="form-group col-md-6">
      <label for="inputPassword4">Email</label>
      <input type="text" class="form-control" name="email" id="inputPassword4" placeholder="Email" value="{{old('email')}}">
    </div>
  </div>

  <div class="form-group">
    <label for="inputAddress">Direccion</label>
    <input type="text" class="form-control" id="inputAddress" placeholder="1234 Main St" name="direccion" value="{{old('direccion')}}">
  </div>
 

  <div class="form-row">
    <div class="form-group col-md-4">
      <label for="inputCity">Pais</label>
      <select id="inputState" class="form-control" name="pais">
        <option value="0" selected >Choose...</option>

        @foreach ($paises as $key => $value)
          <option value="{{$value->id}}" @if(old('pais')==$value->id) selected @endif>{{$value->pais_nombre}}</option>  
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
      <input type="text" class="form-control" id="inputZip" name="zip">
    </div>





  <div class="form-group">
    <div class="form-check">
      <input class="form-check-input" type="checkbox" id="gridCheck">
      <label class="form-check-label" for="gridCheck">
        Check me out
      </label>
    </div>
  </div>


  <button type="submit" class="btn btn-primary">Registrar</button>
  <button type="reset" class="btn btn-danger">Cancelar</button>

</form>
</div>
</div>
</div>
@endsection
