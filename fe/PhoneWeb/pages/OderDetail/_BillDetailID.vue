<template>
    <div class="container">
      <div class="py-1 text-center">
        <h2 class="Title">Chi tiết đơn hàng</h2>
        <p class="lead">Cảm ơn vì đã đặt hàng</p>
     </div>
   <div class="row cart">
    <div class="col-md-12 order-md-12 mb-12">
      <h4 class="d-flex justify-content-between align-items-center mb-3">
        <span class="badge badge-secondary badge-pill"></span>
      </h4>
      <table class="table">
        <thead>
          <tr >
            <th scope="col">Mã hóa đơn</th>
            <th scope="col">Tên sản phẩm</th>
            <th scope="col">Giá</th>
            <th scope="col">Số lượng</th>
            <th scope="col">Tổng</th>
          </tr>
        </thead>
        <tbody>
         <tr v-for="(BillDetail,index) in BillDetail" :key="index">
               <th> MHD00{{index + 1}}</th>
               <td>{{ BillDetail.productname}}</td>
               <td>{{ BillDetail.price.toLocaleString()  }} VNĐ</td>
               <td>{{  BillDetail.quantity }}</td>
               <td><a >{{ BillDetail.allprice.toLocaleString() }} VNĐ</a></td>
        </tr> 
        </tbody>
      </table>
      <ul class="list-group mb-3">
        <li class="list-group-item d-flex justify-content-between">
          <span>Tổng (VNĐ)</span>
          <strong style="margin-right: 42px;">{{total.toLocaleString()}} VNĐ</strong>
        </li>
      </ul>
    </div>
  </div>
 
  </div>
</template>
<script>
export default {
    layout: 'default',
      computed: {
    total()
    {
      let total = 0;
      for( let i=0; i < this.BillDetail.length; i++){
        total += this.BillDetail[i].allprice;


      }
      return total;
    },
  },

    methods: {
    },

async asyncData({ $axios,params}) {
        const BillDetail = await $axios.$get(`/api/BillDetails/BillDetail?BillId=${params.BillDetailID}`)
        console.log(BillDetail)

        return { BillDetail }
    },
}

</script>
<style scoped >
*{
  font-family: Verdana, Geneva, Tahoma, sans-serif;
}
.cart{
  height: 500px;
}
label{
  min-width: 100%;
  padding: 0 20px;
}
input{
margin: 0 16px;
min-width: 800px;
}
select{
margin: 0 16px;
max-width: 830px;
}
textarea{
  margin: 0 16px;
  max-width: 830px;
}
#scroller{
  padding: 0 50px;
}
.list-group-item {
  padding: 5px 13px;
}
</style>