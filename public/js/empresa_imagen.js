const app2 = new Vue({
    el: '#frm_formulario',
    data: {
      errors: [],
      ruta_file: document.getElementById("ruta_file").value,
      imagen: document.getElementById("img_cabecera").value,
      
      
      

    },
    methods:{
      checkForm: function (e) {
 
  
        this.errors = [];
 
        if (this.ruta_file !="") {
            this.errors.push('Primero tiene que eliminar el archivo existente');
        }
 
 
 
 
         
        if (!this.errors.length) {
            return true;
        }


        e.preventDefault();
      }
    }
  })


  