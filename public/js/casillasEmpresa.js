const app = new Vue({
  el: "#frm_formulario",
  data: {
    data: [],
    errors: [],
  
    exists: null
  },
  methods: {
     obtenerCasillas(id) {
         //alert(id+2)
        var url = "create";
      
            axios.get(`http://laravel/racks/obtenerCasillas`, {params: {rack_id: id} }).then((response) => {
            //axios.get(`http://sistema.almagri.com/productos/empresa`, {params: {empresa_id: this.selected_empresa} }).then((response) => {
            this.data = response.data;

            });
        
        
    },


    addItem () {
      this.checkIfExists(4)
      if (!this.exists) {
      	this.items.push({'id': 4, 'text': 'Item 4' })
      }
    },
    checkIfExists(itemId) {
      this.exists = this.items.some((item) => {
      	return item.id === itemId
      })
    }
  }
})