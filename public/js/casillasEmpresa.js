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
 
          if(this.casillas_empresa.length>0)
          {  
            response = await axios.put(url+`/admin/empresas/adicionar_casillas/`+this.id_empresa,{'casillas':this.casillas_empresa} );
            console.log('se registro correctamente'+url);
            window.location.href = url +'/admin/empresas/casillas/'+this.id_empresa;

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
              if(response.data.length==0)
            {
              alert('No existe celdas en este Rack')
              console.log(response.data.length)
            }

            });
        
   
    },


 

    asignarCasilla (data) {
      let existeElemento = false;

         const newArray = this.casillas_empresa.filter((elemento, index) => {
        console.log('casilla_id :' + elemento.rc_id+ ' = '+data.rc_id);
        console.log('index =>'+index);
        if (elemento.rc_id === data.rc_id) 
        {   existeElemento = true;
        }

    });

      if(existeElemento ==false)
         this.casillas_empresa.push({'rack_nombre':data.rack_nombre ,'rc_id': data.rc_id, 'rc_nombre': data.rc_nombre })
    
      console.log(this.casillas_empresa);

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