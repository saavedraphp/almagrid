const app2 = new Vue({
  el: '#frm_formulario',
  data: {
    errors: [],
    producto: document.getElementById("producto").value,
    
    sku: document.getElementById("sku_id").value,
    empresa_id: document.getElementById("empresa_id").value,
    cbo_presentacion_id: document.getElementById("cbo_presentacion_id").value
  },
  methods: {
    checkForm: function (e) {


      this.errors = [];

      if (!this.producto) {
        this.errors.push('Ingrese el nombre del Producto.');
      }

      /*if (!this.sku) {
        this.errors.push('El SKU es requerido.');
      } */

      if ((!this.empresa_id)) {
        this.errors.push('Selecione la Empresa.');
      }

      if (!this.cbo_presentacion_id) {
        this.errors.push('Seleccione la Unidad de medida.');
      }


      if (!this.errors.length) {
        return true;
      }


      e.preventDefault();
    },



    esNumerico: function (evt) {
      evt = (evt) ? evt : window.event;
      var charCode = (evt.which) ? evt.which : evt.keyCode;
      if ((charCode > 31 && (charCode < 48 || charCode > 57)) && charCode !== 46) {
        evt.preventDefault();;
      } else {
        return true;
      }
    },


    existe_sku: function () {
      try {
        let response = axios.get(`/existeSKU`,
          { params: { sku: this.sku } }).then((response) => {
            if (response.data == 1) {
              console.log('Resultado => ' + response.data);
              alert('El SKU:' + this.sku + ' Existe en la base de datos');
            }
            console.log('Resiltado ='+response.data);

          });

      }
      catch (error) {
        console.log(error);
      }
    },



    existeSKU_Edit: function (producto_id) {
      try {
        let response = axios.get(`/existeSKU_Edit`,
          { params: { sku: this.sku,producto_id: producto_id } }).then((response) => {
            if (response.data == 1) {
              console.log('Resultado => ' + response.data);
              alert('El SKU:' + this.sku + ' Existe en la base de datos');
            }
            console.log('Resultado ='+response.data);

          });

      }
      catch (error) {
        console.log(error);
      }
    },    

    


  }// METHOD




})