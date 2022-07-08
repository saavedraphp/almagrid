const app2 = new Vue({
    el: '#frm_formulario',
    data: {
      errors: [],
      name: document.getElementById("name").value,
      

    },
    methods:{
      checkForm: function (e) {
 
  
        this.errors = [];
  
        if (!this.name) {
          this.errors.push('El Nombre es obligatorio.');
        }
 
 
         
        
         
        if (!this.errors.length) {
            return true;
        }


        e.preventDefault();
      }
    }
  })


  