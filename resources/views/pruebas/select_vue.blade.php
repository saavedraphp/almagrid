<html>
<head>

<!-- include VueJS first -->
 <script src="https://unpkg.com/vue@2"></script>

<!-- use the latest vue-select release -->
<script src="https://unpkg.com/vue-select@latest"></script>
<link rel="stylesheet" href="https://unpkg.com/vue-select@latest/dist/vue-select.css">

 

</head>
<body>
<div id="app">
  <h1>Vue Select</h1>
  <v-select :options="options"></v-select>
</div>


 
<script>
    Vue.component('v-select', VueSelect.VueSelect)

new Vue({
  el: '#app',
  data: {
    options: [
      'foo',
      'bar',
      'baz'
    ]
  }
})
</script>
</body>
</html>



