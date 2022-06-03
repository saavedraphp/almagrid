const appContacto = new Vue({
    el: '#lista_contacto',
    data: {
       empresa_id:document.getElementById("empresa_id").value,
       nombre:document.getElementById("nombre").value,
       telefono:document.getElementById("telefono").value,
       email:document.getElementById("email").value,
       data:[],
       errors:[],

     },

     mounted(){
        this.obtenerContactosEmpresaId();

        
    },

    
    methods:{

      validarFormContacto(){
        this.errors = [];
         if (!this.nombre) {
         
          this.errors.push('Ingrese el nombre Contacto');
          
        }

        if (!this.telefono) {
          this.errors.push('Ingrese el número de teléfono Contacto');
          
        }

        console.log(this.errors); 
        if(this.errors.length==false)
        return true;

      },


      obtenerContactosEmpresaId()
      {
       axios.get(url+`/obtenerContactosEmpresaId`, {params: {empresa_id: this.empresa_id} }).then((response) => {
        this.data = response.data;
        //alert(this.empresa_id);
        });
      },



        adicionarContacto() {
          if(this.validarFormContacto()==true)
          {

              try {
                let parametros= {empresa_id:this.empresa_id,telefono:this.telefono,email:this.email, nombre:this.nombre};
                console.log("entro");
                axios.get(url+`/adicionarContacto`, {params:parametros}).then((response) => {
                this.data = response.data;
                document.getElementById('close').click();

                })
      
              } catch (error) {
                console.log(error);
              }
  
          } 
      

    
      },




      eliminar_contacto: function(contacto){

        try {


          if(confirm('Estas Seguro de Borrar el Registro Id: '+contacto.id)==true)
          {
            let parametros= {contacto_id:contacto.id,empresa_id:this.empresa_id};
            axios.get(url+`/eliminar_contacto_id`, {params:parametros}).then((response) => {
            this.data = response.data;
            });
            document.getElementById('close').click();

            //this.data.splice(this.data.indexOf(contacto), 1);
          }
          else
             return false;
  

          

        } catch (error) {
           console.log(error);
        }



      },
      

    }//fin method
  })