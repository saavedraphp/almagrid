const app = new Vue({
    el: '#frm_formulario',

    data: {
        empresa_id: '',
        producto:document.getElementById("producto_id").value,
        v_cantidad:document.getElementById("cantidad_id").value,
        total_productos:0,
        
        f_vencimiento:document.getElementById("f_vencimiento").value,
        lote:document.getElementById("lote").value,

        data: [],
        productos_acta:[],



        errors: [],
        selected_empresa: document.getElementById("empresa_id").value,
        tipo_documento_id: document.getElementById("tipo_documento_id").value,
        acta_sub_cliente_id: document.getElementById("acta_sub_cliente_id").value,
        grabar:false,
    },
 

    methods: {

        removeItem: function(element){
            this.productos_acta.splice(this.productos_acta.indexOf(element), 1);
            console.log(element);
        },


 

        add_producto:function(){

            //console.log('valor de producto '+this.producto);
            
            if(this.producto=="")
            {
              alert("Seleccione un producto");
              this.$refs.r_producto.focus();
              return;
    
            }

            //console.log('valor cantidad '+this.v_cantidad);

            if(this.v_cantidad =="" || this.v_cantidad <= 0)
            {
              alert("Ingrese un valor valido");
              this.v_cantidad = "";
              this.$refs.r_cantidad.focus();
              return;
    
            }

    
            if(this.v_cantidad>0){

             this.productos_acta.push({prod_id:this.producto.prod_id, prod_nombre:this.producto.prod_nombre,
             prod_lote:this.lote, cantidad:this.v_cantidad, total:this.producto.prod_stock+this.cantidad});
             this.$refs.r_producto.focus();
             
             this.v_cantidad="";
             console.log(this.productos_acta);
               /*
              this.calcularTotal();
              */
   
            }
    
         
    
         //Vue.set(this.lista, this.new_item, {id:this.temp.id ,name:this.temp.name,numcode:this.temp.numcode, cantidad: this.temp.numcode})
    
         
    
         
    
       },

        checkForm: function (e) {
            console.log('valor de lista => '+this.productos_acta.length);

            this.errors = [];
      
            if (!this.selected_empresa) {
              this.errors.push('Seleccione una empresa.');
            }
    
            if (!this.acta_sub_cliente_id) {
                this.errors.push('Seleccione un sub cliente.');
              }


            if (!this.tipo_documento_id) {
                this.errors.push('Seleccione un tipo de Documento.');
              }
            
                
          

 
            if(this.verificar_cambios()==false)
            {
                this.errors.push('Por favor tiene que eleguir algún producto');
            }
    
            
            
            if (!this.errors.length) {
                document.frm_formulario.submit();
                return true;
                

            }

            //e.preventDefault();

          },      



        obtenerProductos() {
            
          
                axios.get(url+`/productos/empresa`, {params: {empresa_id: this.selected_empresa} }).then((response) => {
                this.data = response.data;

                });
            
            
        },

        modificarStock: function(producto){
          

            if(parseInt(producto.valor)>=0)
            { 
                //RESTA DESPACHO
                if(document.getElementById('operacion_id').value ==0){
                
                    if(parseInt(producto.valor) > parseInt(producto.prod_stock) )
                    {
                        alert('El valor ingresado excede la cantidad del Stock');
                        this.errors.push('Tiene que ingresar una cantidad menor al Stock.');
                         
                        return false;
                    }
                    else
                    {
                        producto.total = parseInt(producto.prod_stock) - parseInt(producto.valor);
                    }
                }    
                
            
                //ADICIONAR SUMA
                if(document.getElementById('operacion_id').value ==1){
                    
                    producto.total = parseInt(producto.prod_stock) + parseInt(producto.valor);
                }
                    
                
                
                this.total_productos +=parseInt(producto.valor);
            }// SI ES NUMERICO

            // document.getElementById('lbTotal').text = producto.total;
                //alert(producto.total);
                //console.log(producto);
        
        },//END modificarStock

        verificar_cambios(){
            
            for(i=0;i<document.getElementsByName('cantidad[]').length;i++){
                if(document.getElementsByName('cantidad[]')[i].value > 0)
                {
                    
                    return  true;

                }
                
            }
            return  false;
   
   

            
        }



        
        
    },
    

    // end method


});