@extends('layouts.app')

@section('content')
 <div class="jumbotron jumbotron-fluid">
  <div class="container">
    <h1 class="display-4">{{$usuario->usua_nombre}}</h1>
    <p class="lead">{{$usuario->usua_email}}</p>
  </div>
</div>
@endsection
