<template>
  <div id="app">
    <TableCustomer/>
  </div>
</template>

<script>
import TableCustomer from './components/TableCustomer.vue'

export default {
  name: 'App',
  components: {
    TableCustomer
  }
}
</script>

<style>
#app {
  font-family: Avenir, Helvetica, Arial, sans-serif;
  -webkit-font-smoothing: antialiased;
  -moz-osx-font-smoothing: grayscale;
  text-align: center;
  color: #2c3e50;
  margin-top: 60px;
}
</style>
