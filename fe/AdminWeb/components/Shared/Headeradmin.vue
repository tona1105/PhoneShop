

<template>

<div>
  <header>
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
</header>
  <b-navbar toggleable="lg" type="dark" variant="info">
    <b-navbar-brand href="/">Trang chủ</b-navbar-brand>
    <b-navbar-toggle target="nav-collapse"></b-navbar-toggle>
    <b-collapse id="nav-collapse" is-nav>
         <b-navbar-brand href="/Products/ListProduct">Sản phẩm</b-navbar-brand>
         <b-navbar-brand href="/Menu/MenuList">Danh Mục</b-navbar-brand>
         <b-navbar-brand href="/New/NewList">Tin Tức</b-navbar-brand>
         <b-navbar-brand href="/Customer/Customerlist">Khách hàng</b-navbar-brand>
         <b-navbar-brand href="/CustomerSP/CustomerSPlist">KH hỗ trợ</b-navbar-brand>
         <b-navbar-brand href="/Slider/SliderList">Trang Slider</b-navbar-brand>
      <!-- Right aligned nav items -->
      <b-navbar-nav class="ml-auto">
        <!-- <div v-for="(listAdmin,index) in listAdmin" :key="index" right> -->
          Xin chào ADMIN
          <!-- <p style="color:white"> Xin chào: {{listAdmin.userName}}</p> -->

        <!-- </div> -->
      </b-navbar-nav>
    </b-collapse>
  </b-navbar>
</div>
</template>
<script>

  export default {
     data() {
    return {
      listAdmin: [],
    }
  },
  async created() {
  },
  mounted() {

  },
  methods: {
    // async getUserAdmin() {
    //   try {
    //     const { data } = await Apidata.getUserAdmin(this.$axios)
    //     console.log(data)

    //     this.listAdmin = data
    //   } catch (err) {
    //     console.log(err)
    //   }
    // },


  },

  }
</script>

<style>
  .navbar-dark .navbar-brand {
    color: black;
  }
</style>