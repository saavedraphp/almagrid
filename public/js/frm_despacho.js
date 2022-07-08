const app = new Vue({
    el: '#frm_formulario',

    data: {
         producto:document.getElementById("producto_id").value,
        v_cantidad:document.getElementById("cantidad_id").value,
 
        
        total_productos:0,
        totalProductos_x_Lotes:0,
        

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


 





        async getCantidadPoductoPorLote(producto_id,lote_id) {
        try{
            let response =  await axios.get(url+`/getTotalProductosLotes`, 
            {params: {producto_id: producto_id,lote_id:lote_id} }).then((response) => {
            this.totalProductos_x_Lotes = response.data;
            //console.log('paso 1 => '+ this.totalProductos_x_Lotes);
         
            });
            
        }
           catch(error) {
            console.log(error);
        }
         

       },
      
 

       removeItem: function(element){
        this.productos_acta.splice(this.productos_acta.indexOf(element), 1);
        console.log(element);
        },


       async add_producto(){
 
         let existeProductoLote = false;
            console.log('valor de producto '+this.producto.prod_nombre);

            if(this.selected_empresa=="")
            {
              alert("Seleccione una Empresa");
              this.$refs.r_empresa.focus();
              return;
    
            }

            
            if(this.producto=="")
            {
              alert("Seleccione un producto");
              this.$refs.r_producto.focus();
              return;
    
            }

            //console.log('valor cantidad '+this.v_cantidad);

            if(this.v_cantidad =="" || this.v_cantidad <= 0)
            {
              alert("Ingrese una Cantidad");
              this.v_cantidad = "";
              this.$refs.r_cantidad.focus();
              return;
    
            }

           


            if(this.v_cantidad>0){

              
               

        
                await  this.getCantidadPoductoPorLote(this.producto.prod_id,this.lote);
                //console.log('Paso 2 => '+this.totalProductos_x_Lotes)

                //let array = response.data; array.forEach(element => console.log(element.nombre));

                const newArray = this.productos_acta.filter((elemento, index) => {
                    console.log('prod_id :' + elemento.prod_id+ ' = '+this.producto.prod_id+'   LoteID :'+elemento.prod_lote+' = '+this.lote);
                    console.log('index =>'+index);
                    if (elemento.prod_id === this.producto.prod_id && elemento.prod_lote === this.lote) 
                    {
                        elemento.cantidad = parseInt(elemento.cantidad) + parseInt(this.v_cantidad);
                        existeProductoLote =  true;
                    }
                    console.log('Existe LoteXProducto');
                });



                /*this.productos_acta.forEach((element, index) => 
                console.log(element, index)
                           
                if(element.prod_id == this.producto.prod_id && element.lote_id == this.lote)
                {
                    alert('encontro');
                }

     

                );*/

                if(existeProductoLote ==false)
                {
                    this.productos_acta.push({prod_id:this.producto.prod_id, prod_nombre:this.producto.prod_nombre,
                    prod_lote:this.lote,stock_x_lote:this.totalProductos_x_Lotes, cantidad:this.v_cantidad, 
                    total:this.producto.prod_stock+this.cantidad});
                }
                
                this.$refs.r_producto.focus();
                
                this.v_cantidad="";
                //console.log(this.productos_acta);
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
                this.errors.push('Ingrese el nombre del Usuario.');
              }


            if (!this.tipo_documento_id) {
                this.errors.push('Seleccione un tipo de Documento.');
              }
            
                
          

 
            if(this.verificar_cambios()==false)
            {
                this.errors.push('Por favor tiene adicionar  algún producto para generar la Acta');
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