const app2 = new Vue({
    el: '#frm_formulario',
    data: {
      errors: [],
      producto: document.getElementById("producto").value,
      codigo_producto: document.getElementById("codigo_producto").value,
      empresa_id: document.getElementById("empresa_id").value,
      cbo_presentacion_id:  document.getElementById("cbo_presentacion_id").value
    },
    methods:{
      checkForm: function (e) {
 
  
        this.errors = [];
  
        if (!this.producto) {
          this.errors.push('El nombre es requerido.');
        }

        if (!this.codigo_producto) {
          this.errors.push('El codigo es requerido.');
      }    

        if ( (!this.empresa_id)){
          this.errors.push('La Empresa es requerido.');
        }

        if (!this.cbo_presentacion_id) {
            this.errors.push('La Unidad de medida es requerido.');
        }        
  
         
          if (!this.errors.length) {
            return true;
          }


        e.preventDefault();
      }
    }
  })