const app2 = new Vue({
    el: '#frm_formulario',
    data: {
      nombre: document.getElementById("nombre").value,
      errors: [],
       existeErrores:false,
    

    },



    methods:{
 

      checkForm: function (e) {
 
  
        this.errors = [];
  
        if (!this.nombre) {
          this.errors.push('El Nombre es obligatorio.');
          this.existeErrores = true;
        }
 
         
        if (!this.errors.length) {
            return true;
        }


        e.preventDefault();
      }
    }
  })


  