const app = new Vue({
  el: "#frm_formulario",
  data: {
    casillas_rack: [],
    casillas_empresa: [],
    errors: [],
    exists: null,
    id_empresa: document.getElementById('id_empresa').value
    

  },
  methods:{

    async  validar_casillas(e) {
      try {
        //{{route('save_casillas_asignadas',$empresa->empr_id)}}
          console.log(this.casillas_empresa.length);
          let ruta =  'http://127.0.0.1:8080';

          if(this.casillas_empresa.length>0)
          {  
            response = await axios.put(`http://127.0.0.1:8080/admin/empresas/adicionar_casillas/`+this.id_empresa,{'casillas':this.casillas_empresa} );
            alert(response.data.errors);
            
            window.location.href = ruta +'/admin/empresas/casillas/'+this.id_empresa;

          }
          else
          {
            alert('Elija las casillas para su asignacion');
          }
    } catch (error) {
          alert(error.response.data.errors);
          console.log('error =>'+error)
    }



     },// FIN METODO





     obtenerCasillas(rack_id) {
 
            axios.get(url+`/racks/obtenerCasillas`, {params: {rack_id: rack_id} }).then((response) => {
            this.casillas_rack = response.data;

            });
        
   
    },


 

    asignarCasilla (item) {
      this.casillas_empresa.push({'rc_id': item.rc_id, 'rc_nombre': item.rc_nombre })
     /* this.checkIfExists(item.rc_id)
      if (!this.exists) {
      	this.items.push({'id': 4, 'text': 'Item 4' })
      }
      */
    },



    quitarCasilla (index) {
      this.$delete(this.casillas_empresa, index);
 
    },
    
    

    mounted(empresa_id) {

      axios.get(`http://laravel/racks/obtenerCasillasEmpresa`, {params: {empresa_id: empresa_id} }).then((response) => {
        // axios.get(`http://sistema.almagri.com/racks/obtenerCasillasEmpresa`,{params: {empresa_id: empresa_id} }).then((response) => {
         this.casillas_empresa = response.data;

         });      

    },

    
    checkIfExists(itemId) {
      this.exists = this.items.some((item) => {
      	return item.id === itemId
      })
    }




  }
})