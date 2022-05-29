const appContacto = new Vue({
    el: '#exampleModal',
    data: {
       empresa_id:document.getElementById("empresa_id").value,
       nombre:document.getElementById("nombre").value,
       telefono:document.getElementById("telefono").value,
       email:document.getElementById("email").value,
       
       data:[]
     },
    methods:{
         
        adicionarContacto() {
            console.log("entro");
        /*  axios.get(url+`/adicionarContacto`, {params: {empresa_id: this.empresa_id,telefono:this.telefono,email:this.email} }).then((response) => {
          this.data = response.data;
  
        })
*/
    
      },


    }//fin method
  })