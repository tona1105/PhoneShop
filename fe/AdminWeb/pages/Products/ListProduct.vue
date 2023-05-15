<template>
  <div>
    <b-card no-body>
      <b-nav pills card-header slot="header" v-b-scrollspy:nav-scroller>
        <b-nav-item-dropdown text="Quản lý sản phẩm  " right-alignment>
          <b-dropdown-item href="/Products/AddProduct" >Thêm sản phẩm</b-dropdown-item>
          <b-dropdown-item href="/Products/ListProduct">Danh sách sản phẩm</b-dropdown-item>
          <b-dropdown-divider></b-dropdown-divider>
        </b-nav-item-dropdown>
      </b-nav>
      <b-card-body
        id="nav-scroller"
        ref="content"
        style="position:relative; overflow-y:scroll; height: 90%;"
      >
      <div class="title">
          <h5>Danh sách sản phẩm</h5>
      </div>
    <!-- <h1>Danh sách</h1> -->
    <table class="table">
    <thead>
        <tr>
        <th scope="col">#</th>
        <th scope="col">Tên sản phẩm</th>
        <th scope="col">Menu</th>
        <th scope="col">Giá </th>
        <th scope="col">Hình ảnh </th>
        <th scope="col" >Mô Tả </th>
        <th scope="col">Số lượng</th>
        <th scope="col">Loại</th>
        <th scope="col"></th>
        </tr>
    </thead>
    <tbody >  
         <tr v-for="(listProduct,index) in listProduct" :key="index">
               <th  scope="row">MA00{{ (index + 1) }}</th>
               <td>{{ listProduct.productname }}</td>
               <td >{{ listProduct.menuid }}</td>  
               <td >{{ listProduct.price.toLocaleString()}} VNĐ</td> 
               <td 
               style="  width: 270px;"
               > <img :src="listProduct.imghp" class="bd-placeholder-img card-img-top" alt="" height="200"/></td>          
               <td class="overloadtext">{{ listProduct.productDescription }}</td>
               <td>{{ listProduct.inStock }}</td>
               <td  v-if="listProduct.typeProduct > 0">Nổi bật</td>
               <td  v-else >Không nổi bật</td>
               <td>
              <a                        
                     type="button" class="btn btn-danger"
                     v-on:click="DeleteProduct(listProduct.productid)">                
                  Xóa
              </a>
                <a type="button" class="btn btn-success" :href="geturlUpdateProduct(listProduct.productid)">Edit</a>    
                </td>
        </tr>             
    </tbody>
    </table>
      </b-card-body>
    </b-card>
  </div>
</template>
<script>
import Apidata from '@/api/Apidata'
  export default {
    middleware: [
    'isAuthorize',
    // 'isAdmin'
  ],
     layout: 'LayoutsAdmin',
     data() {
    return {
      listProduct: [],
    }
  },
  async created() {
    await this.getproduct()
  },
  mounted() {

  },
  methods: {
    async getproduct() {
      try {
        const { data } = await Apidata.getproduct(this.$axios)
        console.log(data)

        this.listProduct = data
      } catch (err) {
        console.log(err)
      }
    },
 
     DeleteProduct(id)
  {
      this.$axios.delete(`/api/products/` + id).then(() =>
      {
          this.getproduct()
      })
  },
 
    geturlUpdateProduct(Producteditid)
    {
      const url ='/ProductEdit/' + Producteditid;
      return url;
    }

  },


   
  }
</script>

<style>
.btn{
    margin-bottom: 10px;
}
.title{
    text-align: center;
    font-family: Verdana, Geneva, Tahoma, sans-serif;
}
h5{
  font-weight: 700;
}

.overloadtext {
  width: 400px;
}
</style>