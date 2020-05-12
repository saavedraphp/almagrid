const app = new Vue({
    el: '#app',
    data: {
        selected_pais: '',
        selected_estado: '',
        states: [],
        
    },

    mounted(){

        document.getElementById('estado').disabled = true;
        this.selected_pais = document.getElementById('pais').getAttribute('data-old');
      
        if(this.selected_pais !='')
        {
            this.loadStates();
        }
        
        this.selected_estado = document.getElementById('estado').getAttribute('data-old');
                    
    },

     methods: {
        loadStates() {

            this.selected_estado ='';
            document.getElementById('estado').disabled =true;

            if (this.selected_pais !="") {
                axios.get(`http://127.0.0.1:80/estados/pais`, {params: {pais_id: this.selected_pais} }).then((response) => {
                this.states = response.data;
                document.getElementById('estado').disabled =false;

                });
            }
            
        },

      
        
    }


});