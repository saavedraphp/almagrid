Vue.component('v-select', VueSelect.VueSelect)

const app = new Vue({
    el: '#frm_formulario',

    data: {
        producto: document.getElementById("producto_id").value,
        selected_empresa: document.getElementById("empresa_id").value,
        data: [],
        productos: [],
        errors: [],
    },


    methods: {


        reporteProductosExcel() {
            this.errors = [];

            if (!this.selected_empresa) {
                this.errors.push('Tiene que elegir una empresa');
                return false;
            }




            if (this.selected_empresa > 0 && this.producto) {
                window.open('/exportarProductosExcel?empresa_id=' + this.selected_empresa + '&producto_id=' + this.producto.prod_id);

            }
            else
                window.open('/exportarProductosExcel?empresa_id=' + this.selected_empresa);

            /*
              console.log('valor productos'+this.producto);
  
              window.open('/exportarProductosExcel?empresa_id='+this.selected_empresa+'&producto_id='+this.producto.prod_id);
              
  
              /*
                            axios.get(url + `/exportarProductosExcel`, { params: { empresa_id: this.selected_empresa,producto_id: this.producto.prod_id } }).then((response) => {
                            console.log("cargo");
                            //document.frm_formulario.href
             
                         }).catch(error => {
                             console.log(error);
                             if (error.response) {
                                 if (error.response.status == 401) {
                                     swal('VUELVA INICIAR SESIÓN - SESIÓN INHAUTORIZADA - 401');
                                     location.reload('0');
                                 }
                             }
                             console.log("sssss");
                         });
              */
        },




        buscar() {
            this.errors = [];
 

            if (document.getElementById("empresa_id").value == "") {
                this.errors.push('Tiene que elegir una empresa');
                return false;
            }

            if (this.selected_empresa && this.producto)
                paramentros = { empresa_id: this.selected_empresa, producto_id: this.producto.prod_id };
            else
                paramentros = { empresa_id: this.selected_empresa };


            axios.get(url + `/buscarProductoIdEmpresaId`, { params: paramentros }).then((response) => {
                this.productos = response.data;

            });

        },


        obtenerProductos() {

            this.producto = "";
            this.productos_acta = [];

            axios.get(url + `/productos/empresa`, { params: { empresa_id: this.selected_empresa } }).then((response) => {
                this.data = response.data;

            });

        },







    }, //END METHOD




});