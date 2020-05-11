const app = new Vue({
    el: '#app',
    data: {
        selected_estado: '',
        selected_ciudad: '',
        ciudades: [],
    },

    mounted(){

        //document.getElementById('ciudad').disabled = true;
        this.selected_estado = document.getElementById('estado').getAttribute('data-old');
        
      
        if(this.selected_estado !='')
        {
            this.cargarCiudades();
        }
        
        this.selected_ciudad2 = document.getElementById('ciudad').getAttribute('data-old');
        
    },

     method: {
        cargarCiudades() {

            this.selected_ciudad2 ='';
            document.getElementById('ciudad').disabled =true;

            if (this.selected_estado !="") {
                axios.get(`http://127.0.0.1:80/ciudades/estado`, {params: {estado_id: this.selected_estado} }).then((response) => {
                this.ciudades = response.data;
                document.getElementById('ciudad').disabled =false;

                });
            }
            
        }
    }


});