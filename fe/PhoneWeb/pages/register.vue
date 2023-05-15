<template>
            <div class="container2">
            <div class="login-form" style="max-width: 500px;">
                <ValidationObserver  v-slot="{ invalid }">
                <form @submit.prevent="registers">
                    <h1 style="margin-left:42px">ĐĂNG KÝ</h1>
                    <div class="input-box">
                        <b>Tên đăng nhập</b>
                        <ValidationProvider
                        v-slot="{ errors }"
                        rules="required|alpha-num"  
                        name="Tên đăng nhập">
                        <input name="customerusername" v-model="dataSubmit.customername" type="text"  placeholder="Nhập tên đăng nhập" >
                         <p class="muted text-danger">
                        {{ errors[0] }}
                        </p>
                       </ValidationProvider>
                    </div>
                    <div class="input-box">
                        <b style="margin-right:42px">Mật khẩu</b>
                        <ValidationProvider
                        v-slot="{ errors }"
                        rules="required|min:6"
                        name="Mật khẩu ">   
                        <input   name="customerpassword" v-model="dataSubmit.customerpassword" type="password" placeholder="Nhập mật khẩu">
                        <p class="muted text-danger">
                        {{ errors[0] }}
                        </p>
                    </ValidationProvider>
                    </div>                  
                     <div class="input-box">
                        <b style="margin-right:72px">Email</b>
                        <ValidationProvider
                        v-slot="{ errors }"
                        rules="required|email"
                        name="Email "    >
                        <input   name="customerEmail" v-model="dataSubmit.customeremail" type="text"   placeholder="Nhập Email">
                         <p class="muted text-danger">
                        {{ errors[0] }}
                        </p>
                    </ValidationProvider>
                    </div>
                    <div class="input-box">
                        <b style="margin-right:14px">Số điện thoại</b>
                       <ValidationProvider
                        v-slot="{ errors }"
                        rules="required|max:10|min:9|num"
                        name="Số điện thoai "    >
                        <input   name="customernumber" v-model="dataSubmit.customernumber" type="text" placeholder="Nhập số điện thoại">
                        <p class="muted text-danger">
                        {{ errors[0] }}
                        </p>
                    </ValidationProvider>
                    </div>                     
                    <div class="btn-box">
                        <button class="btn-submit" :disabled="invalid" type="submit" >
                            Đăng ký
                        </button>
                    </div>
                </form> 
               </ValidationObserver>
            </div>
            </div>
</template>
<script>
import { extend } from 'vee-validate';
import Apidata from '@/api/Apidata'

extend('alpha', {
  validate(value) {
    const nameformat = /^[A-Za-z ]+$/i
    if(!nameformat.test(value)) {
        return 'Chỉ cho phép kí tự chữ cái'
    }
    else return true
  },
});

extend('alpha-num', {
  validate(value) {
    const usernameformat = /^[a-z0-9]+$/i
    if(!usernameformat.test(value)) {
        return 'Chỉ cho phép kí tự chữ cái và số'
    }
    else return true
  },
});


extend('num', {
  validate(value) {
    const phone = /^[0-9]+$/
    if(!phone.test(value)) {
        return 'Chỉ cho phép kí tự số'
    }
    else return true
  },
});
export default {
  layout: 'default',
 data(){
        return{
          dataSubmit:{
                customername: '',
                customeremail: '',
                customernumber: '',
                customerpassword: '',
          }
        }
    },

    methods:{
      async registers() {
      try {
      await Apidata.register(this.$axios, this.dataSubmit)
      alert("Bạn đã đăng kí thành công.")
       this.$router.push(`/login`)
      } catch (err) {
        alert('Tài khoản hoặc Email đã tồn tại, vui lòng nhập lại!')
      }

    }
}
}
</script>
<style scoped>
.main{
    background-color: #a7dfca;
    min-height: 500px;
    padding: 7.5px 15px;
}

.containerf{
    
    margin-top: 50px;
    margin-bottom: 50px;
}
.login-form{
    width: 100%;
    max-width: 400px;
    margin: 20px auto;
    background-color: #ffffff;
    padding: 15px;
    border: 2px solid #000000;
    border-radius: 10px;
    min-height: 550px;
}
h1{
    color: #000000;
    font-size: 20px;
    margin-bottom: 30px;
    text-align: center;
    font-family: sans-serif;
    font-size: 35px;
    margin-left: 100px;
}


i, span {
    display: block;
}

.input-box input{
    padding: 6px 14px;
    width: 100%;
    border: 1px solid #cccccc;
    outline: none;
}
.btn-box{
    text-align: right;
    margin-top: 30px;
}
.btn-box button {
    padding: 7.5px 15px;
    border-radius: 5px;
    background-color: #002fc9;
    color: #ffffff;
    border: none;
    outline: none;
}

.btn-submit:disabled {
    background-color: #cccccc;
}
.container2 {
    background-color: #a7dfca;
    /* background: linear-gradient(120deg, #9b59b6, #3498db); */
    padding-top: 1px;
    padding-bottom: 1px;
}
</style>