const app2 = new Vue({
    el: '#frm_formulario',
    data: {
      errors: [],
      
      nombre: document.getElementById("nombre").value,
      precio: document.getElementById("precio").value,
      precio_compra: document.getElementById("precio_compra").value,
      imagen: document.getElementById("imagen").value,
      ruta_imagenDB: document.getElementById("ruta_imagenDB").value,
      
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

        if (!this.precio_compra) {
          
          this.errors.push('El precio de compra es obligatorio');
        }      

        
        if (!this.precio) {
          
          this.errors.push('El precio de venta es obligatorio.');
        }        
  
        
 

        if (this.$refs.imagen.value=="" && (!this.ruta_imagenDB)) {
          
          this.errors.push('Tiene que seleccionar una imagen.');
        }  
      
         
          if (!this.errors.length) {
            document.frm_formulario.submit();

            return true;
        }
         
      },
 


  
    }//fin method

  
  })