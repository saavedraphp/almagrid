@extends('layouts.app')

@section('content')



<div class="container">


@if(Session::get('operacion')=='1')
<div class="alert alert-success alert-dismissible" role="alert">
  <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
  {{Session::get('message')}}
</div>
@endif

@if(Session::get('operacion')=='0')
  <div class="alert alert-danger alert-dismissible" role="alert">
    <button type="button" class="close" data-dismiss="alert" aria-label="Close"><span aria-hidden="true">&times;</span></button>
    {{Session::get('message')}}
  </div>

@endif



<form action="{{route('upload_mages',$empresa->empr_id)}}" method="POST" enctype="multipart/form-data">

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
                <input type="file" class="custom-file-input" id="img_cabecera" name="img">
                <label class="custom-file-label" for="inputGroupFile01">Choose file</label>
            </div>
        
        </div>
  </div>


  <div class="form-group">
  
    <img src="/img/cabecera_reporte/@if(empty($empresa->empr_ruta_img_reporte))defauld_1090_163.jpg @else{{$empresa->empr_ruta_img_reporte}} @endif" class="img-fluid" alt="Responsive image">

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