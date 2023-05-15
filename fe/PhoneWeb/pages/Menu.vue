<template>
  <div>
<!--main page-->
    
       <div class="container">
      <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
        <h1 class="display-4">Món ăn ngon</h1>
      </div>
<div>
  <b-tabs content-class="mt-3 Listproduct" fill >
    <b-tab title="Bánh kem lớn" >

     <div class="container bootdey">
      <div class="row">
        <div
          v-for="(listmenubig, index) in listmenubig"
          :key="index"
           class="product-grid col-xs-12 col-sm-6 col-md-4"
          >
          <Productedit
            :product="listmenubig"

          />
        </div>
      </div>
     </div>
    </b-tab>
    <b-tab title="Bánh kem nhỏ">

     <div class="container bootdey">
      <div class="row">
        <div
          v-for="(listmenusmall, index) in listmenusmall"
          :key="index"
           class="product-grid col-xs-12 col-sm-6 col-md-4"
         >
          <Productedit
            :product="listmenusmall"

          />
        </div>
      </div>
     </div>
    </b-tab>
    <b-tab title="Bánh kem trái cây">

     <div class="container bootdey">
      <div class="row">
        <div
          v-for="(listmenutraicay, index) in listmenutraicay"
          :key="index"
           class="product-grid col-xs-12 col-sm-6 col-md-4"
         >
          <Productedit
            :product="listmenutraicay"

          />
        </div>
      </div>
     </div>

    </b-tab>
    <b-tab title="Tất cả"  active>

     <div class="container bootdey">
      <div class="row">
        <div
          v-for="(product, index) in listproduct"
          :key="index"
           class="product-grid col-xs-12 col-sm-6 col-md-4"
         >
          <Productedit
            :product="product"
            @add-to-cart="addCart"
            @out-of-stock="alert"
          />
        </div>
      </div>
     </div>
      
     </b-tab>
  </b-tabs>
</div>

    </div>
    
    </div>
</template>
<script>
import Productedit from '@/components/index/Productedit'

import Apidata from '@/api/Apidata'

export default {
  components: { Productedit },
   layout: 'default',
  data() {
    return {
      listproduct: [],
     listmenu: [],
     listmenubig: [],
     listmenusmall: [],
     listmenutraicay: [],
    }
  },
  async created() {
    await this.getproduct()
    await this.getmenu()
    await this.getmenubig()
    await this.getmenusmall()
    await this.getmenutraicay()

  },
  mounted() {
     const recaptchaScript = document.createElement('script')
      recaptchaScript.setAttribute('src', 'https://getbootstrap.com/docs/5.1/dist/js/bootstrap.bundle.min.js')
      document.head.appendChild(recaptchaScript)
  },
  methods: {
   
    async getproduct() {
      try {
        const { data } = await Apidata.getproduct(this.$axios)
        console.log(data)

        this.listproduct = data
      } catch (err) {
        console.log(err)
      }
    },

     async getmenu() {
      try {
        const { data } = await Apidata.getmenu(this.$axios)
        console.log(data)
        this.listmenu = data

      } catch (err) {
        console.log(err)
      }
    },
   
   
     async getmenubig() {
      try {
        const { data } = await Apidata.getproductbymenuyid(this.$axios, 1)
        console.log(data)
        this.listmenubig = data

      } catch (err) {
        console.log(err)
      }
    },

   
     async getmenusmall() {
      try {
        const { data } = await Apidata.getproductbymenuyid(this.$axios, 2)
        console.log(data)
        this.listmenusmall = data

      } catch (err) {
        console.log(err)
      }
    },   

   
     async getmenutraicay() {
      try {
        const { data } = await Apidata.getproductbymenuyid(this.$axios, 3)
        console.log(data)
        this.listmenutraicay = data

      } catch (err) {
        console.log(err)
      }
    },


  },
}
</script>
<style >
.Listproduct{
  border: 1px solid rgb(228, 221, 221);
  padding: 40px;
  border-radius: 10px;
  min-width: 80%;
  background: rgb(223, 223, 230);
}
</style>