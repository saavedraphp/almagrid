const app2 = new Vue({
    el: '#frm_formulario',
    data: {
      errors: [],
      nombre_id: document.getElementById("nombre_id").value,
      ruc_id: document.getElementById("ruc_id").value,
      correo_id: document.getElementById("correo_id").value,
      celular_id:  document.getElementById("celular_id").value,
//      contacto:  document.getElementById("contacto").value,
      empresa_id:document.getElementById("empresa_id").value,
      user_id:document.getElementById("user_id").value,
      msg:[],
      //data:[],
      encontroEmail: false,
      resultado:"",

    },
    methods:{
 
      async checkForm () {

  
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

    console.log("valor empresa"+parseInt(this.user_id));

        if(parseInt(this.user_id)==0)
            await this.existeEmail();
        else
            await this.validarModificacionEmail();



        if(this.resultado>0)
        {
            this.errors.push('El Correo Existe en nuesta Base Datos');
        } 


        if (!this.celular_id) {
            this.errors.push('El Celular es obligatoria.');
          }        
  
         
          if (!this.errors.length) {
            document.frm_formulario.submit();

            return true;
        }
         
      },

      validEmail: function (email) {
        var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
        return re.test(email);
      },



      async existeEmail()
      {  
          
          try{
              let response =   await axios.get(`/existeEmail`, 
              {params: {email:this.correo_id } }).then((response) => {
                  console.log('Resultado => '+ response.data);
                  this.resultado =  response.data;
              });
              
          }
              catch(error) {
              console.log(error);
          }


      },



 
        /***********VALIDAR SI EXISTE EMAIL <> DEL EL PARA MODIFICAR   */
        async validarModificacionEmail()
        {  
            
            try{
                let response =   await axios.get(`/validarModificacionEmail`, 
                {params: {email:this.correo_id,id:this.user_id } }).then((response) => {
                    console.log('Resultado => '+ response.data);
                    this.resultado =  response.data;

                });

                
            }
                catch(error) {
                console.log(error);
            }


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




  
    }//fin method

  
  })