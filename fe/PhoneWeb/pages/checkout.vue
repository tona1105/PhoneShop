<template>
  <div class="container">
    <div class="py-1 text-center">
      <h2 class="Title">Giỏ hàng</h2>
      <p class="lead">Cảm ơn khách hàng đã tin tưởng.</p>
      <!-- <p class="lead">Current Date & Time: </p> -->
    </div>
    <div class="row cart">
      <div class="col-md-12 order-md-12 mb-12">
        <h4 class="d-flex justify-content-between align-items-center mb-3">
          <span class="text-muted">Giỏ hàng</span>
          <span class="badge badge-secondary badge-pill">{{ countCart }}</span>
        </h4>
        <table class="table">
          <thead>
            <tr>
              <th scope="col">#</th>
              <th scope="col">Tên sản phẩm</th>
              <th scope="col">Hình ảnh</th>
              <th scope="col">Giá</th>
              <th scope="col">Số lượng</th>
              <th scope="col">Tổng</th>
              <th scope="col">*</th>
            </tr>
          </thead>
          <tbody>
            <tr v-for="(listCart, index) in listCart" :key="index">
              <th scope="row">{{ index + 1 }}</th>
              <td>{{ listCart.productname }}</td>
              <td>
                <img height="100px" :src="listCart.imghp" alt="" />
              </td>
              <td>{{ listCart.price.toLocaleString() }} VNĐ</td>
              <td>{{ listCart.cartquantity }}</td>
              <td>{{ listCart.allprice.toLocaleString() }} VNĐ</td>
              <td>
                <a v-on:click="DeletaCart(listCart.cartid)" type="button" class="btn btn-danger">xóa</a>
              </td>
            </tr>
          </tbody>
        </table>
        <ul class="list-group mb-3">
          <li class="list-group-item d-flex justify-content-between">
            <span>Tổng (VNĐ)</span>
            <strong>{{ total.toLocaleString() }} VNĐ</strong>
          </li>
        </ul>
      </div>
    </div>
    <div class="row" v-if="isUser">
      <div class="col-md-8 order-md-1">
        <h4 style="text-align: center;" class="mb-3">Thông tin thanh toán</h4>
        <ValidationObserver v-slot="{ invalid }">
          <form class="needs-validation">
            <div class="mb-3">
              <label for="username">Địa chỉ:</label>
              <div class="input-group">
                <ValidationProvider v-slot="{ errors }" rules="required|" name="Địa chỉ" style="width: 100%;">
                  <input v-model="Address" type="text" class="form-control" id="Address" placeholder="Mời nhập địa chỉ"
                    required>
                  <p class="muted text-danger">
                    {{ errors[0] }}
                  </p>
                </ValidationProvider>
              </div>
            </div>
            <hr class=" mb-4">
            <div>
              <label for="select-option">Hình thức thanh toán:</label>
              <select id="select-option" v-model="selectedOption" @change="handleChange">
                <option value="not-online">Thanh toán trực tiếp</option>
                <option value="online">Thanh toán online</option>
              </select>
              <button v-if="selectedOption === 'not-online'" class="btn btn-primary btn-lg btn-block "
                @click.prevent="AddOder()" :disabled="invalid">Đặt hàng</button>
              <button v-if="selectedOption === 'online'" class="btn btn-primary btn-lg btn-block"
                @click.prevent=" addOnline(total)" :disabled="invalid">Đặt hàng</button>
            </div>
          </form>
        </ValidationObserver>
      </div>
    </div>
    <div class="row" v-else>
      <div class="col-md-8 order-md-1">
        <form class="needs-validation">
          <hr class="mb-4">
          <button class="btn btn-primary btn-lg btn-block " type="submit"
            onclick="alert(' Vui lòng Đăng nhập để thanh toán !')">Đặt hàng</button>
        </form>
      </div>
    </div>

  </div>
</template>
<script>
import { mapGetters } from 'vuex'
import Apidata from '@/api/Apidata'
export default {
  data() {
    return {
      Address: '',
      Quantity: '',
      listCart: [],
      listBill: [],
      Allprice: '',
      listCustomer: [],
      param1: 'Đơn hàng',
      param3: Math.floor(Math.random() * 10000),
      selectedOption: 'online'
    }
  },
  async created() {
    await this.getCart()
    await this.getBill()
    await this.getCustomer()
  },
  mounted() {

  },
  computed: {

    ...mapGetters({
      isUser: 'user/isUser',
      isView: 'user/isView',
    }),
    total() {
      let total = 0;
      for (let i = 0; i < this.listCart.length; i++) {
        total += this.listCart[i].allprice
      }
      return total;
    },
    countCart() {
      let countCart = 0;
      for (let i = 0; i < this.listCart.length; i++) {
        countCart += 1;
      }
      return countCart;
    },
    //  DateTime(){
    //    const today = new Date()
    //    return today;
    //  }
  },
  methods: {
    async getCustomer() {
      try {
        const { data } = await Apidata.getCustomer(this.$axios)
        console.log(data)
        this.listCustomer = data
      }
      catch (err) {
        console.log(err)
      }
    },
    async getCart() {
      try {
        const { data } = await Apidata.getcart(this.$axios)
        console.log(data)
        this.listCart = data
      } catch (err) {
        console.log(err)
      }
    },

    async getBill() {
      try {
        const { data } = await Apidata.listBill(this.$axios)
        console.log(data)
        this.listBill = data
      }
      catch (err) {
        console.log(err)
      }
    },

    DeletaCart(id) {
      this.$axios.delete(`/api/Carts/` + id).then(() => {
        this.getCart()

      })
      this.$router.push(`/checkout`)
    },
    async AddOder() {

      if (this.countCart === 0) {
        alert("Giỏ hàng trống ! Vui lòng đặt Món để thanh toán!")
      }
      else {
        try {

          for (let i = 0; i < this.listCustomer.length; i++) {
            await this.$axios.post('/api/Bills', {
              customer: this.listCustomer[i].customername,
              phonenumber: this.listCustomer[i].customernumber,
              address: this.Address,
              customerid: this.listCustomer[i].customerid,
              status: 0,
            }
            )
          }
          const { data } = await Apidata.getBill(this.$axios)
          this.listBill = data
          console.log(data)
          const tmp = this.listBill[this.listBill.length - 1].billId
          for (let i = 0; i < this.listCart.length; i++) {
            await this.$axios.post('/api/BillDetails', {
              productname: this.listCart[i].productname,
              price: this.listCart[i].price,
              quantity: this.listCart[i].cartquantity,
              allprice: this.listCart[i].allprice,
              billId: tmp,
            })
            await this.$axios.delete(`/api/Carts/` + this.listCart[i].cartid)
          }
          alert("Thanh toán thành công! Vui lòng theo dõi đơn hàng để nhận!")
          this.$router.push(`/OrderSuccess`)

        }
        catch (e) {
          this.error = e.response.data.messages
        }
      }
    },
    currentDateTime() {
      const current = new Date();
      const date = current.getFullYear() + '-' + (current.getMonth() + 1) + '-' + current.getDate();
      const time = current.getHours() + ":" + current.getMinutes() + ":" + current.getSeconds();
      const dateTime = date + ' ' + time;
      return dateTime;
    },
    handleChange() {
      if (this.selectedOption !== 'not-online') {
        this.selectedOption = 'not-online';
      }
    },
    async addOnline(total, id) {
      try {
        for (let i = 0; i < this.listCustomer.length; i++) {
          await this.$axios.post('/api/Bills', {
            customer: this.listCustomer[i].customername,
            phonenumber: this.listCustomer[i].customernumber,
            address: this.Address,
            customerid: this.listCustomer[i].customerid,
            status: 0,
          }
          )
        }
        const { data } = await Apidata.getBill(this.$axios)
        this.listBill = data
        console.log(data)
        const tmp = this.listBill[this.listBill.length - 1].billId
        for (let i = 0; i < this.listCart.length; i++) {
          await this.$axios.post('/api/BillDetails', {
            productname: this.listCart[i].productname,
            price: this.listCart[i].price,
            quantity: this.listCart[i].cartquantity,
            allprice: this.listCart[i].allprice,
            billId: tmp,
          })
          await this.$axios.delete(`/api/Carts/` + this.listCart[i].cartid)
          const url = 'http://localhost:16262/vnpay_pay.aspx?param1=' + this.param1 + '&param3=' + this.param3 + '&param2=' + total;
          window.location.href = url
        }
      }
      catch (e) {
        this.error = e.response.data.messages
      }
      
    },
    
  }

}
</script>
<style  scoped>
.row {
  min-width: 800px;

}

.mb-3 {
  min-width: 150vh !important;

}

.mb-4 {
  min-width: 150vh !important;
}

button {
  width: 280px !important;
  text-align: center;
  margin: 10px 350px !important;
  border-radius: 5px;
  background-color: #002fc9;
  color: #ffffff;
  border: 1px solid rgb(62, 216, 108) !important;
}

.text-center {
  padding-top: 40px !important;
}
</style>