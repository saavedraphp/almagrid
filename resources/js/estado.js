const app = new Vue({
    el: '#app',
    data: {
        selected_pais: '',
        selected_estado: '',
        selected_ciudad: '',
        estados: [],
        ciudades: [],
    },

    mounted(){

        document.getElementById('estado').disabled = true;
        this.selected_pais = document.getElementById('pais').getAttribute('data-old');
      
        if(this.selected_pais !='')
        {
            this.loadEstados();
        }
        
        this.selected_estado = document.getElementById('estado').getAttribute('data-old');
        


        document.getElementById('ciudad').disabled = true;
        this.selected_estado = document.getElementById('estado').getAttribute('data-old');
            
        
        if(this.selected_estado !='')
        {
            this.cargarCiudades();
        }
        
        this.selected_ciudad = document.getElementById('ciudad').getAttribute('data-old');
        



    },

     methods: {
        loadEstados() {

            this.selected_estado ='';
            document.getElementById('estado').disabled =true;

            if (this.selected_pais !="") {
                axios.get(`http://127.0.0.1:80/estados/pais`, {params: {pais_id: this.selected_pais} }).then((response) => {
                this.estados = response.data;
                document.getElementById('estado').disabled =false;

                });
            }
            
        },



        cargarCiudades() {

            this.selected_ciudad ='';
            document.getElementById('ciudad').disabled =true;

            if (this.selected_estado !="") {
                axios.get(`http://127.0.0.1:80/ciudades/estado`, {params: {estado_id: this.selected_estado} }).then((response) => {
                this.ciudades = response.data;
                document.getElementById('ciudad').disabled =false;

                });
            }
            
        },
        
        
    }


});