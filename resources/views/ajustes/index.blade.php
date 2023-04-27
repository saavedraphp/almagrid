@extends('layouts.app')

@section('content')

<div class="container">
<h2>LISTA DE BACKUPS
 

</h2>

 


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

 
<div class="container px-4">
  <div class="row gx-5">
    <div class="col">
     <div class="p-3 border bg-light"><a href="/admin/reporteProducto"> Reporte de Productos</a></div>
    </div>

  </div>
  <div class="row gx-5">
    <div class="col">
     <div class="p-3 border bg-light"><a href="/admin/reporteProducto"> Reporte de Productos</a></div>
    </div>

  </div>
</div>
 

@foreach($tree_array as $year => $months)
    <ul>
        <li>
            {{$year}}
            @foreach($months as $month => $files)
                <ul>
                    <li>
                        {{$month}}
                        @foreach($files as $file)
                            <ul>
                                <li>
                                    <a href="{{$file['url']}}">{{$file['filename']}}</a>
                                </li>
                            </ul>
                        @endforeach
                    </li>
                </ul>
            @endforeach
        </li>
    </ul>
@endforeach
</div>

@endsection
@section('scripts')

@endsection