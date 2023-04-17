const app2 = new Vue({
  el: '#frm_formulario',
  data: {
    errors: [],

    nombre: document.getElementById("nombre").value,
    precio: document.getElementById("precio").value,
    descuento: document.getElementById("descuento").value,
    precio_compra: document.getElementById("precio_compra").value,
    precio_final: document.getElementById("precio_final").value,
    cantidad: document.getElementById("cantidad").value,
    imagen: document.getElementById("imagen").value,
    ruta_imagenDB: document.getElementById("ruta_imagenDB").value,

    pv_valor_inicia: precio,
    msg: [],

    //data:[],

    resultado: "",

  },
  methods: {



    async checkForm() {

      this.errors = [];

      if (!this.nombre) {

        this.errors.push('El Nombre es obligatorio.');
      }

      if (!this.precio_compra) {

        this.errors.push('El precio de compra es obligatorio');
      }


      if (parseInt(this.cantidad) <= 0 || !this.cantidad) {

        this.errors.push('La cantidad  es obligatorio.');
      }


      //PRECIO DE VENTA
      if (!this.precio) {

        this.errors.push('El precio de venta es obligatorio.');
      }




      if (this.$refs.imagen.value == "" && (!this.ruta_imagenDB)) {

        this.errors.push('Tiene que seleccionar una imagen.');
      }


      if (!this.errors.length) {
        document.frm_formulario.submit();

        return true;
      }

    },



    calculo_descuento() {
      if(this.pv_valor_inicia != this.precio)
        this.precio_final = (this.precio - this.descuento);
    },

    calculo_precioFinal() {

      if (this.precio_final == 0) {
        this.descuento = 0;
      }
      else {
        if (this.precio_final < this.precio)
          this.descuento = this.precio - this.precio_final;
      }
      /*
      this.variable_descuento = (this.precio -  this.precio_compra)  - this.precio_final;
      if(this.variable_descuento>0)
      this.descuento = this.variable_descuento;
      */

    },


  }//fin method


})