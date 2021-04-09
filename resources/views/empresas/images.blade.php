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

   <form action="{{route('empresas.update',$empresa->empr_id)}}" method="POST" enctype="multipart/form-data">

@csrf


  <div class="form-row">
    <div class="form-group col-md-6">
      <label for="inputEmail4">Empresa</label>
      {{$empresa->empr_nombre}}  -  {{$empresa->empr_ruc}}
    </div>
  </div>


  <div class="form-group">
        <label for="inputAddress">Imagen</label>
        <div class="input-group mb-3">

            <div class="input-group-prepend">
                <span class="input-group-text">Upload</span>
            </div>

            <div class="custom-file">
                <input type="file" class="custom-file-input" id="img_cabecera">
                <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
            </div>
        
        </div>
  </div>


  <div class="form-group">

    <img src="..." class="img-fluid" alt="Responsive image">

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