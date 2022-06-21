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
        //console.log(this.data);
        });      

      },
      
      created ()
      {
        console.log('cantidad =>'+document.getElementsByName("producto_id").length);

        //validar_asignacion();
        //console.log("hhhhhhhhhhh");

      },

      
    methods:{
       validar_asignacion(e)
       {
         let array = document.getElementsByName('casilla_id[]');
        
 
        for (let index = 0; index < array.length; index++) {
          const element = array[index];
          element.style.backgroundColor = "";
          if(array[index].options[array[index].selectedIndex].value=="0")
          {
            //console.log("Por favor seleccione una casilla para su asignacion");
            alert("Por favor seleccione una casilla para su asignacion");
            element.style.backgroundColor = "#D6EEEE";
            grabar =  false;
             e.preventDefault();
            return false;
          }
          


        }
         
         console.log("Grabar datos");

     

        


    
       },

      
    }
  })