@extends('layouts.app')


@section('content')
    @inject('empresas', 'App\Services\Empresas')
    <div class="container">
        <form name="frm_formulario" id="frm_formulario">



            <div class="row justify-content-end">
                <button class="btn btn-success col-xs-2" type="button" v-on:click="reporteProductosExcel">DESCARGAR EXCEL <i
              class="far fa-file-excel"  ></i></button>
            </div>



            @csrf
            <h2>BITACORA DE PRODUCTO
            </h2>

            <div v-cloak v-if="errors.length">
                <b style="color: red;">Por favor, corrija el(los) siguiente(s) error(es):</b>
                <ul>
                    <li v-for="error in errors">@{{ error }}</li>
                </ul>
            </div>

            <div>
                <div class="row gx-5">
                    <div class="col">
                        <div class="p-3 border bg-light">
                            <label for="inputAddress">Empresa</label>
                            <select v-model="selected_empresa" v-on:change="obtenerProductos" ref="r_empresa"
                                id="empresa_id" data-old="{{ old('cbo_empresa') }}" name="cbo_empresa" class="form-control">
                                {{ $guion = '' }};
                                @foreach ($empresas->get() as $index => $value)
                                    <option value="{{ $index }}">{{ $index . $guion . $value }}</option>
                                    {{ $guion = ' - ' }};
                                @endforeach
                            </select>
                        </div>
                    </div>

                    <div class="col">
                        <div class="p-3 border bg-light">

                            <label for="Productos">Productos</label>
                            <v-select :options="data" label="producto_nombre" item-value="prod_id" v-model="producto"
                                id="producto_id" ref="r_producto" name="producto">
                            </v-select>


                        </div>
                        <button type="button" class="btn btn-success float-right mr-3" v-on:click="buscar">Buscar</button>
                    </div>
                </div>
            </div>


            <table class="table table-hover">
                <thead>
                    <tr>
                        <th>#</th>
                        <th scope="col">ACTA</th>
                        <th scope="col">KARDEX</th>
                        <th scope="col">EMPRESA</th>
                        <th scope="col">MOVIMIENTO</th>
                        <th scope="col">SKU</th>
                        <th scope="col">PRODUCTO</th>
                        <th scope="col">CANT</th>
                        <th scope="col">CASILLA</th>
                        <th scope="col">FECHA</th>
                    </tr>
                </thead>
                <tbody id="userList">
                    <?php $conta = 0; ?>

                    <tr v-for="(producto, index) in productos">
                        <th scope="row">@{{ ++index }} </th>
                        <th scope="row"> @{{ producto.acta }} </th>
                        <td>@{{ producto.kardex }}</td>
                        <td>@{{ producto.empresa }}</td>
                        <td>@{{ producto.movimiento }}</td>
                        <td>@{{ producto.sku }}</td>
                        <td>@{{ producto.producto }}</td>
                        <td>@{{ producto.cantidad }}</td>
                        <td>@{{ producto.casilla }}</td>
                        <td>@{{ producto.fecha_registro }}</td>
                    </tr>

                </tbody>
            </table>

        </form>
    </div>
@endsection

@section('scripts')
    <script>
        const url = '{{ env('MY_URL') }}';
    </script>

    <!-- include VueJS first -->
    <script src="https://unpkg.com/vue@2"></script>

    <!-- use the latest vue-select release -->
    <script src="https://unpkg.com/vue-select@latest"></script>
    <link rel="stylesheet" href="https://unpkg.com/vue-select@latest/dist/vue-select.css">
    <script src="{{ asset('js/reporte_producto.js') }}"></script>
@endsection
