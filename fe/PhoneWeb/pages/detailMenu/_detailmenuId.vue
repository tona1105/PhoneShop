<template>
  <div>
    <!--main page-->
    <div class="container">
      <div class="pricing-header px-3 py-3 pt-md-5 pb-md-4 mx-auto text-center">
        <h1 class="display-4">SẢN PHẨM</h1>
        <div v-if=" this.detailmenuId == 1">Nước hoa nam</div>
      </div>
      <div>
        <b-tabs content-class="mt-3 listproduct" fill>
          <b-tab>
            <div class="container bootdey">
              <div class="row">
                <div v-for="(product, index) in product" :key="index" class="product-grid col-xs-12 col-sm-6 col-md-4">
                  <!-- product Item -->
                  <Productedit :product="product" />
                  <!-- product Item -->
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
export default {
  components: { Productedit },
  data() {
    return {
      product: []
    }
  },
  async asyncData({ $axios, params }) {
    try {
      const product = await $axios.$get(`/api/products/viaCateId?MenuId=${params.detailmenuId}`)
      console.log(product)
      return { product }
    }
    catch (err) {
      console.log(err)
    }
  },

}
</script>
<style >
.listproduct {
  text-align: center;
  border: 1px solid rgb(228, 221, 221);
  padding: 40px;
  border-radius: 10px;
  min-width: 80%;
  background-color: #e5c9ff;
}
</style>