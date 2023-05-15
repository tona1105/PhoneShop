<template>
  <div class="container">
    <div class="tile">
      <h4>THÔNG TIN TÀI KHOẢN</h4>
    </div>

    <table class="table">
      <tbody v-for="(listCustomer, index) in listCustomer" :key="index">
        <tr>
          <th scope="row">Tên tài khoản :</th>
          <td>{{ listCustomer.customername }}</td>
        </tr>
        <tr>
          <th scope="row">Email :</th>
          <td>{{ listCustomer.customeremail }}</td>
        </tr>
        <tr>
          <th scope="row">Số điện thoại :</th>
          <td>{{ listCustomer.customernumber }} <button class="btn-choose" @click="showDiv1 = !showDiv1">Đổi số điện thoại</button>
            <div v-if="showDiv1">
              <input type="text" v-model="newPhoneNumber" placeholder="Nhập số điện thoại mới">
              <button @click="updatePhoneNumber(listCustomer.customerid, listCustomer.customername, listCustomer.customeremail, newPhoneNumber, listCustomer.customerpassword)"
              class="btn-submit" 
              >
                Cập nhật số điện thoại</button>
            </div>
          </td> 
        </tr>
        <tr>
          <th scope="row">Mật khẩu :</th>
          <td>(********) <button  class="btn-choose" @click="showDiv = !showDiv">Đổi mật khẩu</button>
            <div v-if="showDiv">
              <form
                @submit.prevent="handleSubmit(listCustomer.customerid, listCustomer.customername, listCustomer.customeremail, listCustomer.customernumber, listCustomer.customerpassword)">
                <label>
                  <span style="padding-right: 10px; display:inline">Nhập mật khẩu hiện tại:</span>
                  <ValidationProvider
                        v-slot="{ errors }"
                        rules="required|min:6"
                        name="Mật khẩu ">   
                  <input type="password" v-model="info.currentPassword">
                  <p class="muted text-danger" style="text-align: end; padding-right: 30px;">
                        {{ errors[0] }}
                        </p>
                    </ValidationProvider>
                </label>
                <br>
                <label>
                  <span style="padding-right: 44px; display:inline">Nhập mật khẩu mới:</span>
                  <ValidationProvider
                        v-slot="{ errors }"
                        rules="required|min:6"
                        name="Mật khẩu ">   
                  <input type="password" v-model="info.newPassword" required>
                  <p class="muted text-danger" style="text-align: end; padding-right: 30px;">
                        {{ errors[0] }}
                        </p>
                    </ValidationProvider>
                </label>
                <br>
                <label>
                  <span style="padding-right: 58px; display:inline">Nhập lại mật khẩu:</span>
                  <ValidationProvider
                        v-slot="{ errors }"
                        rules="required|min:6"
                        name="Mật khẩu ">   
                  <input type="password" v-model="confirmPassword" required>
                  <p class="muted text-danger" style="text-align: end; padding-right: 30px;">
                        {{ errors[0] }}
                        </p>
                    </ValidationProvider>
                </label>
                
                <br>
                <button  class="btn-submit"  type="submit">Đổi mật khẩu</button>
              </form>
            </div>
          </td>
        </tr>
      </tbody>
    </table>

  </div>
</template>
<script>
import Apidata from '@/api/Apidata'
export default {
  data() {
    return {
      listCustomer: [],
      showDiv: false,
      showDiv1: false,
      info: {
        currentPassword: '',
        newPassword: ''
      },
      confirmPassword: '',
      newPhoneNumber:'',
    }
  },
  async created() {
    await this.getCustomer()


  },
  mounted() {

  },
  methods: {
    async getCustomer() {
      try {
        const { data } = await Apidata.getCustomer(this.$axios)
        console.log(data)
        this.listCustomer = data
      } catch (err) {
        console.log(err)
      }
    },

    handleSubmit(customerId, customername, customeremail, customernumber, customerpassword) {
      if (this.info.newPassword !== this.confirmPassword) {
        alert('Mật khẩu mới và mật khẩu xác nhận không trùng khớp');
      }
      else if (this.info.currentPassword !== customerpassword) {
        alert('Mật khẩu hiện tại không đúng')
      }
      else if (this.info.currentPassword === this.info.newPassword) {
        alert('Mật khẩu mới phải khác mật khẩu cũ')
      }
      else {
        try {
          this.$axios.put(`api/Customers/${customerId}`, {
            customerid: customerId,
            customername,
            customeremail,
            customernumber,
            customerpassword: this.info.newPassword
          })
          alert('đổi mật khẩu thành công')
          // window.location.reload()
        }
        catch(err) {
          alert(err)
        }
      }
    },
    updatePhoneNumber(customerId, customername, customeremail, newPhoneNumber, customerpassword) {
      try {
          this.$axios.put(`api/Customers/${customerId}`, {
            customerid: customerId,
            customername,
            customeremail,
            customernumber: newPhoneNumber, 
            customerpassword
          })
          alert('đổi số điện thoại thành công')
          window.location.reload()
        }
        catch(err) {
          alert(err)
        }
    } 
  },

}
</script>
<style scoped>
* {
  font-family: Verdana, Geneva, Tahoma, sans-serif;
}

.container {
  background: #fff;
  height: 650px;
}

.cart {
  height: 500px;
}

.tile {
  padding-top: 55px;
  padding-bottom: 15px;
}

.btn-choose {
    outline: none;
    border: 1px solid;
    border-radius: 4px;
    margin-bottom: 6px;
}
.btn-submit {
    padding: 5px 15px;
    border-radius: 30px;
    background-color: #2641ff;
    color: #ffffff;
    border: none;
    outline: none;
}

.table {
  border: 1px solid rgb(226, 213, 213);
  height: 250px;
}

tr:hover {
  background: rgb(195, 218, 228);
}
</style>