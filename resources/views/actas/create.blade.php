@extends('layouts.app')

@section('content')
    @inject('empresas', 'App\Services\Empresas')
    @inject('documentos', 'App\Services\Documentos')
    @inject('servicios', 'App\Services\Servicios')
    @inject('presentaciones', 'App\Services\Presentaciones')
    @inject('racks', 'App\Services\Racks')


    <div class="container">

        <div class="card">
            <h3 class="card-header">RECEPCION [{{ MiConstantes::NUEVO }}]</h5>
                <div class="card-body">

                    <div class="row">
                        <div class="col-md-12">



                            <form method="POST" name="frm_formulario" id="frm_formulario" action="/admin/recepcion">

                                <div v-cloak v-if="errors.length">
                                    <b style="color: red;">Por favor, corrija el(los) siguiente(s) error(es):</b>
                                    <ul>
                                        <li v-for="error in errors">@{{ error }}</li>
                                    </ul>
                                </div>



                                @csrf
                                <div class="form-group">

                                    <label for="inputAddress">Empresa</label>
                                    <select v-model="selected_empresa" v-on:change="obtenerProductos" ref="r_empresa"
                                        id="empresa_id" data-old="{{ old('cbo_empresa') }}" name="cbo_empresa"
                                        class="form-control">
                                        {{ $guion = '' }};
                                        @foreach ($empresas->get() as $index => $value)
                                            <option value="{{ $index }}">{{ $index . $guion . $value }}</option>
                                            {{ $guion = ' - ' }};
                                        @endforeach
                                    </select>

                                </div>



                                <div class="form-row">
                                    <label for="inputAddress">Datos de la persona que trae los productos(Cliente)</label>

                                    <div class="input-group">

                                        <input type="text" class="form-control" name="nro_documento_frm"
                                            v-model="nro_documento_frm" id="nro_documento_frm"
                                            placeholder="Ingrese el Numero de documento a buscar" ref="nro_documento_frm">
                                        <div class="input-group-append">
                                            <button class="btn btn-outline-secondary" type="button"
                                                v-on:click="buscarPersona">Buscar</button>
                                            <button type="button" class="btn btn-primary" data-toggle="modal"
                                                data-target="#exampleModal" data-whatever="@mdo">Nuevo</button>
                                        </div>
                                    </div>

                                </div>




                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="inputAddress">Tipo de Documento</label>
                                        <select v-model="tipo_documento_id" id="tipo_documento_id" name="tipo_documento"
                                            class="form-control">
                                            {{ $guion = '' }}
                                            @foreach ($documentos->get() as $index => $value)
                                                <option value="{{ $index }}">{{ $index . $guion . $value }}</option>
                                                {{ $guion = ' - ' }}
                                            @endforeach
                                        </select>
                                    </div>

                                    <div class="form-group col-md-6">
                                        <label for="inputAddress">Sub Cliente</label>
                                        <input type="text" class="form-control" v-model="acta_sub_cliente_id"
                                            name="sub_cliente" id="acta_sub_cliente_id" placeholder="Nombre Sub Cliente"
                                            value="{{ old('acta_sub_cliente') }}">
                                    </div>
                                </div>





                                <div class="form-row">
                                    <div class="form-group col-md-6">
                                        <label for="Productos">Productos</label>
                                        <v-select :options="data" label="producto_nombre" v-model="producto"
                                            id="producto_id" ref="r_producto" name="producto">
                                        </v-select>
                                    </div>



                                    <div class="form-group col-md-1">
                                        <label for="inputAddress">Cantidad</label>
                                        <input type="number" class="form-control input-lg" name="cantidad" id="cantidad_id"
                                            ref="r_cantidad" placeholder="0" value="" v-model="v_cantidad">
                                    </div>



                                    <div class="form-group col-md-5">
                                        <label for="inputAddress">Cassilla</label>
                                        <div class="input-group-append">


                                            <select v-model="selected_casilla" id="casilla_id" ref="r_casilla"
                                                name="casilla" class="form-control">
                                                <option value="0">Seleccione una casilla</option>
                                                <option v-for="casilla  in casillas" v-bind:value="casilla">
                                                    @{{ casilla.rack_nombre + ' - ' + casilla.rc_nombre }}</option>
                                            </select>

                                            <button type="button" v-on:click="add_producto"
                                                class="btn btn-primary">Ingresar</button>
                                            <button class="btn btn-outline-secondary" type="button" data-toggle="modal"
                                                data-target="#modalCasillas" data-whatever="@mdo">Add+</button>
                                        </div>
                                    </div>




                                </div>




                                <select v-model="lote" id="lote" data-old="{{ old('lote') }}" name="lote_id"
                                    class="form-control" style="visibility:hidden">
                                    @foreach ($lotes as $lote)
                                        <option value="{{ $lote->lote_nombre }}">
                                            {{ $lote->lote_nombre . ' - ' . $lote->lote_fecha_vencimiento }}</option>
                                    @endforeach
                                </select>




                                <!--tabla-->
                                <div class="col-sm-12">
                                    <table class="table table-hover">
                                        <thead>
                                            <tr>
                                                <th scope="col">#</th>
                                                <th scope="col">#ID</th>
                                                <th scope="col">Producto</th>
                                                <th scope="col">Stock</th>
                                                <th scope="col">Ingreso</th>
                                                <th scope="col">Casilla</th>
                                                <th scope="col">Accion</th>
                                            </tr>
                                        </thead>

                                        <tbody id="userList">
                                            <tr v-for="(producto, conta) in productos_acta">
                                                <th>@{{ conta + 1 }}</th>
                                                <th class="item-{{ $index }}" scope="row">
                                                    @{{ producto.prod_id }}
                                                    <input type="hidden" class="form-control" v-model="producto.prod_id"
                                                        size="3" name="prod_id[]">
                                                </th>
                                                <td>@{{ producto.producto_nombre }}
                                                    <input v-model="producto.prod_lote" type="hidden"
                                                        size="3"name="lote[]">
                                                    <input v-model="producto.rc_id" type="hidden"
                                                        size="3"name="rc_id[]">
                                                </td>

                                                <td>@{{ producto.stock_x_lote }}</td>
                                                <td>@{{ producto.cantidad }}
                                                    <input v-model="producto.cantidad"
                                                        v-on:blur="modificarStock(producto)"
                                                        v-on:keydown.enter.prevent="modificarStock(producto)"
                                                        type="hidden" class="form-control" size="3"
                                                        placeholder="Cantidad" name="cantidad[]" value="0"
                                                        maxlength="5">





                                                </td>
                                                <td>@{{ producto.rc_nombre }}</td>
                                                <td><button type="button" class="btn btn-default"
                                                        @click="removeItem(producto)">Remove</button></td>
                                            </tr>

                                            <tr>
                                                <td colspan="6"><input type="hidden" class="form-control"
                                                        size="3" v-model="total_productos"
                                                        name="txt_total_productos" value="0"></td>
                                                <input type="hidden" class="form-control" size="3"
                                                    id="operacion_id" name="operacion" value="1">
                                            </tr>

                                        </tbody>
                                    </table>
                                </div>
                                <!--tabla-->



                                <div class="form-row">
                                    <div class="form-group col-md-12">
                                        <label for="inputAddress">Comentario</label>
                                        <textarea class="form-control" id="comentario_id" name="comentario" rows="3"></textarea>
                                    </div>

                                </div>


                                <button type="button" @click="checkForm()"
                                    class="btn btn-primary ">{{ MiConstantes::REGISTRAR }}</button>
                                <button type="reset" class="btn btn-danger">{{ MiConstantes::CANCELAR }}</button>





                                <!-- inicio Modal CONTACTO-->
                                <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Registrar Persona</h5>
                                                <button type="button" id="close_id" class="close"
                                                    data-dismiss="modal" aria-label="Close"
                                                    v-on:click="close_modelPersona">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>
                                            </div>


                                            <div class="modal-body">

                                                <div class="form-row">
                                                    <div class="form-group col-md-4">
                                                        <label for="recipient-name" class="col-form-label">Nombre:</label>
                                                    </div>
                                                    <div class="form-group col-md-8">
                                                        <input type="text" class="form-control"
                                                            id="nombre_sub_cliente" v-model="nombre_sub_cliente"
                                                            name="nombre_sub_cliente">
                                                        <label for="recipient-name" v-if="msg_nombre_sub_cliente"
                                                            class="col-form-label" style="color: red;">Este campo es
                                                            requerido.
                                                        </label>
                                                    </div>
                                                </div>


                                                <div class="form-row">
                                                    <div class="form-group col-md-4">
                                                        <label for="recipient-name" class="col-form-label">Tipo
                                                            Documento:</label>
                                                    </div>
                                                    <div class="form-group col-md-8">
                                                        <select v-model="tipo_documento_id_modal"
                                                            id="tipo_documento_id_modal" name="tipo_documento_id_modal"
                                                            class="form-control">
                                                            {{ $guion = '' }};
                                                            @foreach ($documentos->get() as $index => $value)
                                                                <option value="{{ $index }}">
                                                                    {{ $index . $guion . $value }}</option>
                                                                {{ $guion = ' - ' }};
                                                            @endforeach
                                                        </select>
                                                        <label for="recipient-name" v-if="msg_tipo_documento_id"
                                                            class="col-form-label" style="color: red;">Este campo es
                                                            requerido.
                                                    </div>
                                                </div>


                                                <div class="form-row">
                                                    <div class="form-group col-md-4">
                                                        <label for="recipient-name" class="col-form-label">Nro de
                                                            Documento:</label>
                                                    </div>
                                                    <div class="form-group col-md-8">
                                                        <input type="text" class="form-control" id="nro_documento"
                                                            v-model="nro_documento" name="nro_documento">
                                                        <label for="recipient-name" v-if="msg_nro_documento"
                                                            class="col-form-label" style="color: red;">Este campo es
                                                            requerido.
                                                        </label>
                                                    </div>
                                                </div>





                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                                    v-on:click="close_modelPersona" ref="myBtn"
                                                    id="btnPersonaClose">Close</button>
                                                <button type="button" class="btn btn-primary"
                                                    v-on:click="adicionar_persona">Grabar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--fin modal-->



                                <!-- inicio Modal ADD CASILLAS-->
                                <div class="modal fade" id="modalCasillas" tabindex="-1" role="dialog"
                                    aria-labelledby="exampleModalLabel" aria-hidden="true">
                                    <div class="modal-dialog" role="document">
                                        <div class="modal-content">
                                            <div class="modal-header">
                                                <h5 class="modal-title" id="exampleModalLabel">Adicionar Casilla</h5>
                                                <button type="button" id="close_id" class="close"
                                                    data-dismiss="modal" aria-label="Close" v-on:click="close">
                                                    <span aria-hidden="true">&times;</span>
                                                </button>

                                            </div>
                                            <div class="modal-body">



                                                <div class="form-row">
                                                    <div class="form-group col-md-2">
                                                        <label for="recipient-name" class="col-form-label">Rack:</label>
                                                    </div>
                                                    <div class="form-group col-md-10">
                                                        <select v-model="rack_add" id="rack_add" name="rack_add"
                                                            class="form-control"
                                                            v-on:change="obtenerCasillasRackId(rack_add)">
                                                            {{ $guion = '' }};
                                                            @foreach ($racks->get() as $index => $value)
                                                                <option value="{{ $index }}">
                                                                    {{ $index . $guion . $value }}</option>
                                                                {{ $guion = ' - ' }};
                                                            @endforeach
                                                        </select>
                                                        <label for="recipient-name" v-if="msg_rack_add"
                                                            class="col-form-label" style="color: red;">Este campo es
                                                            requerido.

                                                    </div>

                                                </div>




                                                <div class="form-row">

                                                    <div class="form-group col-md-2">
                                                        <label for="inputAddress">Cassilla</label>
                                                    </div>
                                                    <div class="form-group col-md-10">


                                                        <select v-model="casilla_add" id="casilla_add" ref="casilla_add"
                                                            name="casilla_add" class="form-control">
                                                            <option value="0" selected>Seleccione una casilla</option>
                                                            <option v-for="casilla  in casillas_add"
                                                                v-bind:value="casilla" selected>
                                                                @{{ casilla.rack_nombre + ' - ' + casilla.rc_nombre }}</option>
                                                        </select>
                                                        <label for="recipient-name" v-if="msg_casilla_add"
                                                            class="col-form-label" style="color: red;">Este campo es
                                                            requerido.

                                                    </div>
                                                </div>

                                            </div>
                                            <div class="modal-footer">
                                                <button type="button" class="btn btn-secondary" data-dismiss="modal"
                                                    v-on:click="close" ref="myBtnCasilla"
                                                    id="btnCasillaClose">Close</button>
                                                <button type="button" class="btn btn-primary"
                                                    v-on:click="adicionar_casillaEmpresaId">Adicionar</button>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                                <!--fin modal-->
                            </form>

                        </div>
                    </div>


                    <script>
                        const url = '{{ env('MY_URL') }}';
                    </script>
                    <!-- include VueJS first -->
                    <script src="https://unpkg.com/vue@2"></script>

                    <!-- use the latest vue-select release -->
                    <script src="https://unpkg.com/vue-select@latest"></script>
                    <link rel="stylesheet" href="https://unpkg.com/vue-select@latest/dist/vue-select.css">

                    <script src="{{ asset('js/lista_productos.js') }}"></script>
                @endsection
