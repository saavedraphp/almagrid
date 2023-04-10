const app2 = new Vue({
    el: '#frm_formulario',
    data: {
      errors: [],
      nombre: document.getElementById("nombre").value,
      precio: document.getElementById("precio").value,
      
      msg:[],
      //data:[],
 
      resultado:"",

    },
    methods:{
 
      async checkForm () {

  
        this.errors = [];
  
        if (!this.nombre) {
         
          this.errors.push('El Nombre es obligatorio.');
        }

        
        if (!this.precio) {
          
          this.errors.push('El precio.');
        }        
  
         
         
          if (!this.errors.length) {
            document.frm_formulario.submit();

            return true;
        }
         
      },
 


  
    }//fin method

  
  })