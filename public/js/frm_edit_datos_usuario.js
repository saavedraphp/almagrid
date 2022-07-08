const app2 = new Vue({
    el: '#frm_formulario',
    data: {
      errors: [],
      nombre: document.getElementById("nombre").value,
      correo: document.getElementById("correo").value,
      

    },
    methods:{
      checkForm: function (e) {
 
  
        this.errors = [];
  
        if (!this.nombre) {
          this.errors.push('El Nombre es obligatorio.');
        }
 
        if (!this.correo) {
            this.errors.push('El correo electrónico es obligatorio.');
        } else if (!this.validEmail(this.correo)) {
            this.errors.push('El correo electrónico debe ser válido.');
        }
 
          
         
        if (!this.errors.length) {
            return true;
        }


        e.preventDefault();
      },


      validEmail: function (email) {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
      },



    }
  })


  