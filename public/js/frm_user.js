const app2 = new Vue({
    el: '#frm_formulario',
    data: {
      errors: [],
      password:document.getElementById("password").value,
      id: document.getElementById("id").value,
      nombre:document.getElementById("nombre").value,
      email:document.getElementById("email").value,
      cbo_rol:document.getElementById("cbo_rol").value,
      
      chk_password:0,
      resultado:"",
      disabled:false,

    },
 

    methods:{
          async checkForm () {
 
            this.errors = [];
    
            if (!this.nombre) {
            this.errors.push('El Nombre es obligatorio.');
            }

            if (!this.email) {
                this.errors.push('El correo electrónico es obligatorio.');
            } else if (!this.validEmail(this.email)) {
                this.errors.push('El correo electrónico debe ser válido.');
     

            }
            
            await this.existeEmail();
        
            if(this.resultado>0)
            {
                this.errors.push('El Correo Existe');
            } 



            if (!this.password) {
                this.errors.push('El Password es Obligatorio.');
            }
            
             if (!this.cbo_rol) {
                this.errors.push('Seleccione un Rol');
            }



             if (!this.errors.length) {
                document.frm_formulario.submit();

                return true;
            }

           // e.preventDefault();
      },


      async update_user () {
 
        this.errors = [];

        if (!this.nombre) {
        this.errors.push('El Nombre es obligatorio.');
        }

        if (!this.email) {
            this.errors.push('El correo electrónico es obligatorio.');
        } else if (!this.validEmail(this.email)) {
            this.errors.push('El correo electrónico debe ser válido.');
 

        }
        
        await this.validarModificacionEmail();
        
        if(this.resultado>0)
        {
            this.errors.push('El Correo Existe en nuesta Base Datos');
        }    

        if(this.chk_password==true)
        {
            if (!this.password) {
                this.errors.push('El Password es Obligatorio.');
            }
        }
        
        
            
        if (!this.cbo_rol) {
            this.errors.push('Seleccione un Rol');
        }

        

        if (!this.errors.length) {
            document.frm_formulario.submit();

            return true;
        }
    

       // e.preventDefault();
        },
   

        validEmail: function (email) {
            var re = /^(([^<>()\[\]\\.,;:\s@"]+(\.[^<>()\[\]\\.,;:\s@"]+)*)|(".+"))@((\[[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\.[0-9]{1,3}\])|(([a-zA-Z\-0-9]+\.)+[a-zA-Z]{2,}))$/;
            return re.test(email);
        },
      
      

        async existeEmail()
        {  
            
            try{
                let response =   await axios.get(`/existeEmail`, 
                {params: {email:this.email } }).then((response) => {
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
                {params: {email:this.email,id:this.id } }).then((response) => {
                    console.log('Resultado => '+ response.data);
                    this.resultado =  response.data;

                });

                
            }
                catch(error) {
                console.log(error);
            }


        },



    }
  })


  