const app = new Vue({
    el: '#frm_formulario',

    data: {
        rack_add: '',
        casilla_add:'',
        
        producto: document.getElementById("producto_id").value,
        v_cantidad: document.getElementById("cantidad_id").value,
        selected_casilla: document.getElementById("casilla_id").value,
        nro_documento_frm: document.getElementById("nro_documento_frm").value,


        total_productos: 0,
        totalProductos_x_Lotes: 0,


        lote: document.getElementById("lote").value,

        data: [],
        productos_acta: [],
        casillas: [],
        casillas_add: [],




        errors: [],
        selected_empresa: document.getElementById("empresa_id").value,
        tipo_documento_id: document.getElementById("tipo_documento_id").value,
        acta_sub_cliente_id: document.getElementById("acta_sub_cliente_id").value,
        grabar: false,

        nombre_sub_cliente: document.getElementById("nombre_sub_cliente").value,
        nro_documento: document.getElementById("nro_documento").value,
        tipo_documento_id_modal: document.getElementById("tipo_documento_id_modal").value,

        msg_nombre_sub_cliente: false,
        msg_nro_documento: false,
        msg_tipo_documento_id: false,
        
        msg_empresa:false,
        msg_rack_add:false,
        msg_casilla_add:false,


        array_sub_cliente: [],

    },
    mounted(){
        this.casilla_add=0;
        console.log('inicio');
    },


    methods: {

        obtenerCasillasRackId(rack_id) {
            //console.log(rack_id);
            try {
                axios.get(url + `/racks/obtenerCasillas`, { params: { rack_id: rack_id } }).then((response) => {
                    this.casillas_add = response.data;
                    this.casilla_add=0;
                    //console.log('Cassillas ' + this.casillas_add);
                    

                });

            }
            catch (error) {
                console.log(error);
            }


        },


       async adicionar_casillaEmpresaId()
        {
 
            let validacion = true;

            this.msg_empresa = false;
            this.msg_rack_add = false;
            this.msg_casilla_add = false;


            if (!this.selected_empresa) {
                alert('Seleccion un Empresa');
                this.msg_empresa = true;
                validacion = false;
            }


            if (!this.rack_add) {
                this.msg_rack_add = true;
                validacion = false;
            }

            if (!this.casilla_add) {
                this.msg_casilla_add = true;
                validacion = false;
            }

 

            /**SI PASA LAS VALIDACIONES */
            if (validacion == true) {
                console.log('submit');
                try {

                   let respuesta =  await axios.get(url + `/adicionarCasillaIdEmpresaId`, {
                        params: {
                            casilla_id: this.casilla_add.rc_id,
                            empresa_id: this.selected_empresa
                        }
                    }).then((response) => {
                        console.log(response.data);
                    });

                    /**************************ACTUALIZAR EL OBJETO SELECTED CASILLAS DE LA EMPRESA */
                    axios.get(url + `/obtenerCasillasEmpresaId`, { params: { empresa_id: this.selected_empresa } }).then((response) => {
                        this.casillas = response.data;
        
                    });

                    /*********** INICIAR LOS OBJETOS ADD CASILLAS******************/
                    this.rack_add =  '';
                    this.casilla_add =  0;
                    this.casillas_add = '';


                    
                    //this.buscarPersona();
                    console.log('agrego correctamente la casilla'+this.casilla_add);
                    const elem = this.$refs.myBtn
                    elem.click()



                } catch (error) {
                    alert(error.response.data.errors);
                    console.log(error.response.data.errors);




                }

            }


        },


        async getCantidadPoductoPorLote(producto_id, lote_id) {
            try {
                let response = await axios.get(url + `/getTotalProductosLotes`,
                    { params: { producto_id: producto_id, lote_id: lote_id } }).then((response) => {
                        this.totalProductos_x_Lotes = response.data;
                        //console.log('paso 1 => '+ this.totalProductos_x_Lotes);

                    });

            }
            catch (error) {
                console.log(error);
            }


        },



        removeItem: function (element) {
            this.productos_acta.splice(this.productos_acta.indexOf(element), 1);
            console.log(element);
        },


        async add_producto() {

            let existeProductoLote = false;
            console.log('valor de producto ' + this.producto.prod_nombre);

            if (this.selected_empresa == "") {
                alert("Seleccione una Empresa");
                this.$refs.r_empresa.focus();
                return;

            }


            if (this.producto == "") {
                alert("Seleccione un producto");
                this.$refs.r_producto.focus();
                return;

            }

            //console.log('valor cantidad '+this.v_cantidad);

            if (this.v_cantidad == "" || this.v_cantidad <= 0) {
                alert("Ingrese una Cantidad");
                this.v_cantidad = "";
                this.$refs.r_cantidad.focus();
                return;

            }


            if (this.selected_rack == "") {
                alert("Seleccione un Rack");
                this.$refs.r_rack.focus();
                return;

            }

            console.log('valor casilla = ' + this.selected_casilla.rc_id);

            if (typeof this.selected_casilla.rc_id == 'undefined' || this.selected_casilla.rc_id == "") {
                console.log(this.selected_casilla.rc_id);
                alert("Seleccione una Casilla");
                this.$refs.r_casilla.focus();
                return;

            }


            if (this.v_cantidad > 0) {




                await this.getCantidadPoductoPorLote(this.producto.prod_id, this.lote);
                //console.log('Paso 2 => '+this.totalProductos_x_Lotes)

                //let array = response.data; array.forEach(element => console.log(element.nombre));

                const newArray = this.productos_acta.filter((elemento, index) => {
                    console.log('prod_id :' + elemento.prod_id + ' = ' + this.producto.prod_id + '   LoteID :' + elemento.prod_lote + ' = ' + this.lote);
                    console.log('index =>' + index);
                    if (elemento.prod_id === this.producto.prod_id && elemento.prod_lote === this.lote &&
                        elemento.rc_id == this.selected_casilla.rc_id) {

                        elemento.cantidad = parseInt(elemento.cantidad) + parseInt(this.v_cantidad);
                        elemento.rc_id = this.selected_casilla.rc_id;
                        elemento.rc_nombre = this.selected_casilla.rack_nombre +' - '+ this.selected_casilla.rc_nombre;
                        existeProductoLote = true;
                    }
                    console.log('Existe LoteXProducto');
                });



                /*this.productos_acta.forEach((element, index) => 
                console.log(element, index)
                           
                if(element.prod_id == this.producto.prod_id && element.lote_id == this.lote)
                {
                    alert('encontro');
                }

     

                );*/

                if (existeProductoLote == false) {
                    this.productos_acta.push({
                        prod_id: this.producto.prod_id, producto_nombre: this.producto.producto_nombre,
                        prod_lote: this.lote, stock_x_lote: this.totalProductos_x_Lotes, cantidad: this.v_cantidad,
                        total: this.producto.prod_stock + this.cantidad, rc_id: this.selected_casilla.rc_id,
                        rc_nombre: this.selected_casilla.rack_nombre +' - '+ this.selected_casilla.rc_nombre
                    });
                }

                this.$refs.r_producto.focus();
                this.v_cantidad = "";
                this.producto = 0;
                this.selected_casilla = 0;


                //console.log(this.productos_acta);
                /*
                this.calcularTotal();
                */

            }



            //Vue.set(this.lista, this.new_item, {id:this.temp.id ,name:this.temp.name,numcode:this.temp.numcode, cantidad: this.temp.numcode})




        },




        checkForm: function (e) {
            console.log('Total Productos de DetalleActa => ' + this.productos_acta.length);

            this.errors = [];

            if (!this.selected_empresa) {
                this.errors.push('Seleccione una empresa.');
            }

            if (!this.acta_sub_cliente_id) {
                this.errors.push('Ingrese el nombre del Usuario.');
            }


            if (!this.tipo_documento_id) {
                this.errors.push('Seleccione un tipo de Documento.');
            }





            if (this.productos_acta.length == 0) {
                this.errors.push('Por favor tiene que adicionar  algún producto para generar la Acta');
            }



            if (!this.errors.length) {
                document.frm_formulario.submit();
                return true;


            }

            //e.preventDefault();

        },


 

        obtenerProductos() {

            this.acta_sub_cliente_id = "";
            this.tipo_documento_id = "";
            this.nro_documento_frm = "";

            this.productos_acta = [];

            axios.get(url + `/productos/empresa`, { params: { empresa_id: this.selected_empresa } }).then((response) => {
                this.data = response.data;

            });
            this.v_cantidad = "";


            axios.get(url + `/obtenerCasillasEmpresaId`, { params: { empresa_id: this.selected_empresa } }).then((response) => {
                this.casillas = response.data;

                if (this.casillas == "0")
                    alert('El cliente no tiene casillas asignadas');

            });



        },




        modificarStock: function (producto) {


            if (parseInt(producto.valor) >= 0) {
                //RESTA DESPACHO
                if (document.getElementById('operacion_id').value == 0) {

                    if (parseInt(producto.valor) > parseInt(producto.prod_stock)) {
                        alert('El valor ingresado excede la cantidad del Stock');
                        this.errors.push('Tiene que ingresar una cantidad menor al Stock.');

                        return false;
                    }
                    else {
                        producto.total = parseInt(producto.prod_stock) - parseInt(producto.valor);
                    }
                }


                //ADICIONAR SUMA
                if (document.getElementById('operacion_id').value == 1) {

                    producto.total = parseInt(producto.prod_stock) + parseInt(producto.valor);
                }



                this.total_productos += parseInt(producto.valor);
            }// SI ES NUMERICO

            // document.getElementById('lbTotal').text = producto.total;
            //alert(producto.total);
            //console.log(producto);

        },//END modificarStock

 


        async adicionar_persona() {
            console.log('adicionar_persona');
            let validacion = false;

            if (!this.nombre_sub_cliente) {
                this.msg_nombre_sub_cliente = true;
                validacion = true;
            }

            if (!this.tipo_documento_id_modal) {
                this.msg_tipo_documento_id = true;
                validacion = true;
            }


            if (!this.nro_documento) {
                this.msg_nro_documento = true;
                validacion = true;
            }
            console.log('valor validacion '+validacion);

            /**SI PASA LAS VALIDACIONES */
            if (validacion == false) {
                console.log('submit');
                try {

                    await axios.get(url + `/adicionarPersona`, {
                        params: {
                            nombre_sub_cliente: this.nombre_sub_cliente,
                            tipo_documento_id: this.tipo_documento_id_modal,
                            nro_documento: this.nro_documento
                        }
                    }).then((response) => {
                        console.log(response.data);
                    });

                    this.nro_documento_frm = this.nro_documento;
                    this.buscarPersona();
                    console.log('agrego correctamente');
                    document.getElementById('btnPersonaClose').click();

                    //const elem = this.$refs.myBtnCasilla
                    //elem.click()



                } catch (error) {
                   
                    console.log(error.response.data.errors);


                }

            }


        },




        close() {
            this.reiniciar();
            this.$emit('close');
        },


        close_modelPersona() {
            
            this.nombre_sub_cliente = "";
            this.tipo_documento_id_modal = "";
            this.nro_documento = ""; 

            this.msg_empresa = false;
            this.msg_rack_add = false;
            this.msg_casilla_add = false;            
            document.getElementById('btnPersonaClose').click();
            
            //this.$emit('close');
        },


        
        reiniciar() {

            this.msg_nombre_sub_cliente = false;
            this.msg_nro_documento = false;
            this.msg_tipo_documento_id = false;
       },



        async buscarPersona() {
            if (!this.nro_documento_frm) {
                alert('Ingrese un numero de documento');
                this.$refs.nro_documento_frm.focus();
                return false;
            }



            try {

                await axios.get(url + `/buscarPersona`, { params: { nro_documento: this.nro_documento_frm } }).then((response) => {
                    this.array_sub_cliente = response.data;

                    this.acta_sub_cliente_id = "";
                    this.tipo_documento_id = "";
                    this.nro_documento_frm = "";

                    if (response.data == "0") {
                        alert('El usuario no existe por favor registrelo');
                    }
                    else {
                        this.acta_sub_cliente_id = this.array_sub_cliente.nombre;
                        this.tipo_documento_id = this.array_sub_cliente.tipo_documento;
                        this.nro_documento_frm = this.array_sub_cliente.nro_documento;
                    }
                    console.log('buscarPersona Nro:: '+this.nro_documento_frm);

                });





            } catch (error) {
                console.log(error);

            }

        },



        reniciar_acta() {

            if (confirm("Desea cancelar el proceso de registro"))
                window.location.href = "../recepcion";
            else
                return false;
            /*
            this.$refs.form.reset();
            this.productos_acta = [];
            this.casillas       = [];
            this.data           = [];
            this.errors         = [];
            this.array_sub_cliente = [];
            */
        }








    }, //END METHOD




});