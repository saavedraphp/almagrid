const app2 = new Vue({
    el: '#frm_formulario',
    data: {
      errors: [],
       o_password: document.getElementById("o_password").value,
      new_password: document.getElementById("new_password").value,
      r_new_password: document.getElementById("r_new_password").value,

      resultado:false,
      
      

    },
    methods:{

      async validarPassword()
        { this.errors = [];
             
            try{
                let response =  await  axios.get(`/validarPassword`, 
                {params: {o_password:this.o_password } }).then((response) => {
                this.resultado = response.data;
                console.log('Resultado => '+ this.resultado);
             
                });
                
            }
               catch(error) {
                console.log(error);
            }


        },


        async passwordEsCorrecto()
        {
            await this.validarPassword();

             if(this.resultado==0)
            this.errors.push('Ingrese su contraseña actual .');
            
            if (!this.errors.length) {
                return true;
            }

        },


        async checkForm (e) {
 
        this.errors = [];
        

       this.passwordEsCorrecto();
    

  
        if (!this.o_password) {
          this.errors.push('Ingrese su contraseña Actual.');
        }

  
        if (!this.new_password) {
            this.errors.push('Ingrese su nueva contraseña.');
        }
 
        if (!this.r_new_password) {
            this.errors.push('Repita su nueva contraseña.');
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


  