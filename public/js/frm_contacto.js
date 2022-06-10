const appContacto = new Vue({
    el: '#lista_contacto',
    data: {
       empresa_id:document.getElementById("empresa_id").value,
       nombre:document.getElementById("nombre").value,
       telefono:document.getElementById("telefono").value,
       email:document.getElementById("email").value,
       id:0,
       data:[],
       contacto:[],
       errors:[],
       accion:"adicionar"

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
         });
      },

 
      obtenerContactoId(contacto)
      {
        this.errors = [];
        this.accion = "editar";
        
        axios.get(url+`/obtenerContactoId`, {params: {contacto_id: contacto.id} }).then((response) => {
        this.contacto = response.data;
        
        this.nombre = this.contacto.nombre;
        this.telefono = this.contacto.telefono;
        this.email = this.contacto.email;
        this.id  = this.contacto.id;

 
        document.getElementById('exampleModalLabel').innerText = "Editar Contacto";
        
        jQuery.noConflict();
        $('#exampleModal').modal('toggle');

        
        });
      
     

      },

      showModal(){
        this.errors = [];
        this.accion = "adicionar";
        this.nombre="";
        this.telefono="";
        this.email="";
        this.id=0;
        document.getElementById('exampleModalLabel').innerText = "Nuevo Contacto";


        
      },


        grabarContacto() {
          if(this.validarFormContacto()==true)
          {
            let parametros= {contacto_id:this.id, empresa_id:this.empresa_id,telefono:this.telefono,email:this.email, nombre:this.nombre};

            if(this.accion=="adicionar")
            {
              try {
                axios.get(url+`/adicionarContacto`, {params:parametros}).then((response) => {
                this.data = response.data;
                document.getElementById('close').click();

                })
      
              } catch (error) {
                console.log(error);
              }  
            } 
          



            if(this.accion=="editar")
            {
                try {
                  axios.get(url+`/editarContactoId`, {params:parametros}).then((response) => {
                  this.data = response.data;
                  document.getElementById('close').click();

                  })
        
                } catch (error) {
                  console.log(error);
                }  
            } 
            
  
          }//validaicon 
      

    
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