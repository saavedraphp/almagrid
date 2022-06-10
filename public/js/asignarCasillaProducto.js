const app2 = new Vue({
    el: '#frm_formulario',
    data: {
      errors: [],
        empresa_id: document.getElementById("empresa_id").value,
        acta_id: document.getElementById("acta_id").value,
        producto:document.getElementById("producto_id").value,

        data:[],
     },

     mounted() {
        axios.get(url+`/obtenerCasillasEmpresaId`, {params: {empresa_id: this.empresa_id} }).then((response) => {
        this.data = response.data;
        console.log(this.data);
    
        });      

      },

      
    methods:{
        /*
       obtener()
       {
        
         axios.get(url+`/obtenerCasillasEmpresaId`, {params: {empresa_id: this.empresa_id} }).then((response) => {
         this.data = response.data;
         console.log(this.data);
         });    
            
       }
       */
    }
  })