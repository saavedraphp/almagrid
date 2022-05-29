const app2 = new Vue({
    el: '#frm_formulario',
    data: {
      errors: [],
      nombre_id: document.getElementById("nombre_id").value,
      ruc_id: document.getElementById("ruc_id").value,
      correo_id: document.getElementById("correo_id").value,
      celular_id:  document.getElementById("celular_id").value,
      contacto:  document.getElementById("contacto").value,
      empresa_id:document.getElementById("empresa_id").value,
      msg:[],
      data:[],
      encontroEmail: false,
    },
    methods:{
 

      checkForm: function (e) {
 
        this.errors = [];
  
        if (!this.nombre_id) {
         
          this.errors.push('El Nombre / Ruc es obligatorio.');
        }

        
        if (!this.ruc_id) {
          
          this.errors.push('El DNI / RUC es obligatorio.');
        }        
  
        

        if (!this.correo_id) {
            this.errors.push('El correo electrónico es obligatorio.');
        } else if (!this.validEmail(this.correo_id)) {
            this.errors.push('El correo electrónico debe ser válido.');
        }

        

        if (!this.celular_id) {
            this.errors.push('La Celular es obligatoria.');
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


      existeEmail() {
 
         this.msg['email']="El correo existe en nuestra base de datos";
         this.encontroEmail = false;
      //  axios.get(url+`/existeEmail`, {params: {email: email} }).then((response) => {
      //  if(response.data==1)
      //  {

      //  }

        //});
      },


      esNumerico: function(evt) {
        evt = (evt) ? evt : window.event;
        var charCode = (evt.which) ? evt.which : evt.keyCode;
        if ((charCode > 31 && (charCode < 48 || charCode > 57)) && charCode !== 46) {
          evt.preventDefault();;
        } else {
          return true;
        }
      },

      obtenerContactosEmpresaId() {
            
          
        axios.get(url+`/obtenerContactosEmpresaId`, {params: {empresa_id: this.empresa_id} }).then((response) => {
        this.data = response.data;

        });
      }




  
    }//fin method

  
  })