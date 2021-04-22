const app2 = new Vue({
    el: '#frm_formulario',
    data: {
      errors: [],
      imagen: document.getElementById("img_cabecera").value,
      
      

    },
    methods:{
      checkForm: function (e) {
 
  
        this.errors = [];

    
 

        if (!this.$refs.imagen.value) {
            this.errors.push('Tiene que seleccionar una imagen');
          }
 
 
 
         
        if (!this.errors.length) {
            return true;
        }


        e.preventDefault();
      }
    }
  })


  