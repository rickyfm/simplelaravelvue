<template>
  <div>
    <div class="md-layout md-gutter md-alignment-top-center">
      <div class="md-layout-item md-size-30 md-small-size-100">
        <!-- <Form/> -->
        <form-customer v-bind:selected="selected"></form-customer>
      </div>
      <div class="md-layout-item md-medium-size-60 md-small-size-100">
        <md-table v-model="customers" md-card @md-selected="onSelect">
          <md-table-row slot="md-table-row" slot-scope="{ item }" :class="getClass(item)" md-selectable="single">
            <md-table-cell md-label="ID" md-sort-by="id" md-numeric>{{ item.id }}</md-table-cell>
            <md-table-cell md-label="Name" md-sort-by="name">{{ item.name }}</md-table-cell>
            <md-table-cell md-label="Email" md-sort-by="email">{{ item.email }}</md-table-cell>
            <md-table-cell md-label="Gender" md-sort-by="gender">{{ item.gender == 1 ? 'Male' : 'Female' }}</md-table-cell>
            <md-table-cell md-label="Marital Status" md-sort-by="is_married">{{ item.is_married == 1 ? 'Married' : 'Single' }}</md-table-cell>
            <md-table-cell md-label="Address" md-sort-by="address">{{ item.address }}</md-table-cell>
          </md-table-row>
        </md-table>
        <br/>
      </div>
    </div>
  </div>
</template>

<script>
  import axios from 'axios';
  import FormCustomer from './FormCustomer.vue'
  export default {
    name: 'TableSingle',
    components: {
      FormCustomer
    },
    data: () => ({
      selected: {},
      customers: null,
    }),
    mounted () {
      axios.get('http://localhost:8000/api/customer/get')
        .then(response => {
          console.log(response.data.data)
          this.customers = response.data.data
        })
        .catch(error => {
          console.log(error)
          this.errored = true
        })
        .finally(() => this.loading = false)
    },
    methods: {
      getClass: ({ id }) => ({
        'md-primary': id === 2,
        'md-accent': id === 3
      }),
      onSelect (item) {
        this.selected = item
      },
      // getData: () => {
      //   axios.get('http://localhost:8000/api/customer/get')
      //     .then(response => {
      //       console.log("getdata",response.data.data)
      //       this.customers = response.data.data
      //     })
      //     .catch(error => {
      //       console.log(error)
      //       this.errored = true
      //     })
      //     .finally(() => this.loading = false)
      // }

    }
  }
</script>
