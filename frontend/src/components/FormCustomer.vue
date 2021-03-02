<template>
  <div>
    <form novalidate class="md-layout" @submit.prevent="validateUser">
      <md-card class="md-layout-item">
        <md-card-header>
          <div class="md-title">Customers</div>
        </md-card-header>

        <md-card-content>
          <div class="md-layout md-gutter">
            <div class="md-layout-item md-small-size-100">

              <md-input name="id" v-model="form.id" id="id" type="hidden" />
              <md-field :class="getValidationClass('name')">
                <label for="name">Name</label>
                <md-input name="name" id="name" autocomplete="given-name" v-model="form.name" :disabled="sending" />
                <span class="md-error" v-if="!$v.form.name.required">The name is required</span>
                <span class="md-error" v-else-if="!$v.form.name.minlength">Invalid name</span>
              </md-field>
            </div>
          </div>
          <md-field :class="getValidationClass('email')">
            <label for="email">Email</label>
            <md-input type="email" name="email" id="email" autocomplete="email" v-model="form.email" :disabled="sending" />
            <span class="md-error" v-if="!$v.form.email.required">The email is required</span>
            <span class="md-error" v-else-if="!$v.form.email.email">Invalid email</span>
          </md-field>
          <md-field :class="getValidationClass('password')">
            <label for="password">Password</label>
            <md-input type="password" name="password" id="password" autocomplete="password" v-model="form.password" :disabled="sending" />
            <span class="md-error" v-if="!$v.form.password.required">The password is required</span>
            <span class="md-error" v-else-if="!$v.form.password.email">Invalid password</span>
          </md-field>

          <div class="md-layout md-gutter">
            <div class="md-layout-item md-small-size-100">
              <md-field :class="getValidationClass('gender')">
                <label for="gender">Gender</label>
                <md-select name="gender" id="gender" v-model="form.gender" md-dense :disabled="sending">
                  <md-option></md-option>
                  <md-option value="1">Male</md-option>
                  <md-option value="0">Female</md-option>
                </md-select>
                <span class="md-error">The gender is required</span>
              </md-field>
            </div>
            <div class="md-layout-item md-small-size-100">
              <md-field :class="getValidationClass('marital')">
                <label for="is_married">Marital Status</label>
                <md-select name="is_married" id="is_married" v-model="form.is_married" md-dense :disabled="sending">
                  <md-option></md-option>
                  <md-option value="1">Married</md-option>
                  <md-option value="0">Single</md-option>
                </md-select>
                <span class="md-error">The marital status is required</span>
              </md-field>
            </div>
          </div>

          <md-field :class="getValidationClass('address')">
            <label for="address">Address</label>
            <md-input type="address" name="address" id="address" autocomplete="address" v-model="form.address" :disabled="sending" />
            <span class="md-error" v-if="!$v.form.address.required">The address is required</span>
            <span class="md-error" v-else-if="!$v.form.address.address">Invalid address</span>
          </md-field>
        </md-card-content>

        <md-progress-bar md-mode="indeterminate" v-if="sending" />

        <md-card-actions>
          <md-button type="button" class="md-accent" v-on:click="deleteUser" :disabled="sending">Delete</md-button>
          <md-button type="button" v-on:click="clearForm" :disabled="sending">Clear</md-button>
          <md-button type="submit" class="md-primary" :disabled="sending">Save</md-button>
        </md-card-actions>
      </md-card>

      <md-snackbar :md-active.sync="userSaved">The customer {{ lastUser }} was saved with success!</md-snackbar>
      <md-snackbar :md-active.sync="deletedUser">The customer {{ lastUser }} deleted success!</md-snackbar>
      <!-- {{selected}} -->
    </form>
  </div>
</template>

<script>
  import axios from 'axios';
  import { validationMixin } from 'vuelidate'
  import {
    required,
    email,
    minLength,
    maxLength
  } from 'vuelidate/lib/validators'

  export default {
    props: {
      selected: {
        default: () => ({})
      },
      // getData: {
      //   default: () => ({})
      // }
    },
    name: 'FormValidation',
    mixins: [validationMixin],
    data() {
      return {
        userSaved: false,
        sending: false,
        lastUser: null,
        deletedUser: false,
      }
    },
    computed: {
      form: function(){
         return this.selected
      }
    },
    validations: {
      form: {
        name: {
          required,
          minLength: minLength(3)
        },
        password: {
          required,
          minLength: minLength(5)
        },
        address: {
          required,
          minLength: minLength(5),
          maxLength: maxLength(30)
        },
        gender: {
          required
        },
        is_married: {
          required
        },
        email: {
          required,
          email
        }
      }
    },
    methods: {
      getValidationClass (fieldName) {
        const field = this.$v.form[fieldName]
        console.log("field", field)

        if (field) {
          return {
            'md-invalid': field.$invalid && field.$dirty
          }
        }
      },
      clearForm () {
        this.$v.$reset()
        this.form.id = null
        this.form.name = null
        this.form.password = null
        this.form.address = null
        this.form.is_married = null
        this.form.gender = null
        this.form.email = null
      },
      saveUser () {
        this.sending = true
        console.log("tes", this.form)
        const data = {
          ...(this.form.id && {id: this.form.id}),
          name : this.form.name,
          password : this.form.password,
          address : this.form.address,
          is_married : this.form.is_married ,
          gender : this.form.gender,
          email : this.form.email
        }

        // Instead of this timeout, here you can call your API
        axios.post('http://localhost:8000/api/customer/save',data)
          .then(response => {
            this.customers = response.data.data
            // this.getData()
            window.setTimeout(() => {
              this.lastUser = `${this.form.name}`
              this.userSaved = true
              this.sending = false
              this.clearForm()
              window.location.reload()
            }, 1500)
          })
          .catch(error => {
            console.log(error)
            this.errored = true
          })
          .finally(() => this.loading = false)


      },
      deleteUser () {
        const id = {
          id : this.form.id
        }
        axios.post('http://localhost:8000/api/customer/delete',id)
          .then(response => {
            console.log(response.data.data)
            this.customers = response.data.data
            this.getData()
            window.location.reload()
          })
          .catch(error => {
            console.log(error)
            this.errored = true
          })
          .finally(() => this.loading = false)

        window.setTimeout(() => {
          this.lastUser = `${this.form.name}`
          this.deletedUser = true
          this.sending = false
          this.clearForm()
        }, 1500)
      },
      validateUser () {
        this.$v.$touch()

        if (!this.$v.$invalid) {
          this.saveUser()
        }
      }
    }
  }
</script>
