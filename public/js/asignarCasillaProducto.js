const app2 = new Vue({
    el: '#frm_formulario',
    data: {
      errors: [],
        empresa_id: document.getElementById("empresa_id").value,
        acta_id: document.getElementById("acta_id").value,
        producto:document.getElementsByName("producto").value,

        data:[],
     },

     mounted() {
        axios.get(url+`/obtenerCasillasEmpresaId`, {params: {empresa_id: this.empresa_id} }).then((response) => {
        this.data = response.data;
        console.log(this.data);
        });      

      },
      
      created ()
      {
        console.log('cantidad =>'+document.getElementsByName("producto_id").length);

        //validar_asignacion();
        //console.log("hhhhhhhhhhh");

      },

      
    methods:{
       validar_asignacion()
       {
        let array = document.frm_formulario.producto_id;
 
 
        /*for (let index = 0; index < array.length; index++) {
          const element = array[index];
          console.log(array[index].options[array[index].selectedIndex].casilla.rack_nombre);
          
        }
*/

console.log(this.producto);
    
       },

      
    }
  })