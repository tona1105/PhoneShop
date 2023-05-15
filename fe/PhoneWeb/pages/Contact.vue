<template>
  <div class="container">
    <div class="container bootstrap snippets bootdeys">
      <div class="row text-center">
        <div class="col-sm-4">
          <div class="contact-detail-box">
            <i class="fa fa-th fa-3x text-colored"></i>
            <h4>Liên Hệ</h4>
            <abbr title="Phone">P:</abbr> 013 562 6260<br>
            Fb <a href="https://hoanghamobile.com/" class="text-muted">Tona Shop </a>
          </div>
        </div><!-- end col -->

        <div class="col-sm-4">
          <div class="contact-detail-box">
            <i class="fa fa-map-marker fa-3x text-colored"></i>
            <h4>Địa Điểm</h4>
            <address>
              353 Nguyễn Lương Bằng <br>
              Hòa Khánh Liên Chiểu, Đà Nẵng<br>
            </address>
          </div>
        </div><!-- end col -->

        <div class="col-sm-4">
          <div class="contact-detail-box">
            <i class="fa fa-book fa-3x text-colored"></i>
            <h4 style="margin-bottom: 0px;">Hỗ Trợ 24/7</h4>
            <p style="margin-bottom: 0px;">Đường dây nóng</p>
            <p class="text-muted"> 079 097 5263 - 086 495 2349</p>
          </div>
        </div><!-- end col -->

      </div>
      <!-- end row -->


      <div class="row">
        <div class="col-sm-6">
          <div class="contact-map">
            <img
              src="https://missi.com.vn/wp-content/uploads/2020/06/Ban-sao-cua-Ban-sao-cua-Ban-sao-cua-Khong-co-tieu-de-15.jpg"
              style="width: -webkit-fill-available;">
          </div>
        </div><!-- end col -->

        <!-- Contact form -->
        <div class="col-sm-6">
          <form role="form" name="ajax-form" id="ajax-form" @submit.prevent="AddCustomerSP(listCustomer.customeremail)" method="post"
            class="form-main"
            v-for="(listCustomer, index) in listCustomer" :key="index">

            <div class="form-group">
              <label for="name2">Tên</label>
              <input class="form-control" id="name2" name="name" type="text" value="Name"
                v-model="dataSubmit.customerSPname">

            </div> <!-- /Form-name -->

            <div class="form-group">
              <label for="email2">Email</label>
              <input class="form-control" v-model="listCustomer.customeremail" id="email2" name="email" type="text"
              value="email" readonly>

            </div> <!-- /Form-email -->

            <div class="form-group">
              <label for="message2">Lời nhắn</label>
              <textarea v-model="dataSubmit.customerSPDescriptions" class="form-control" id="message2" name="message"
                rows="5">Lời nhắn</textarea>


            </div> <!-- /col -->

            <div class="row">
              <div class="col-xs-12">
                <div id="ajaxsuccess" class="text-success">E-mail was successfully sent.</div>
                <div class="error" id="err-form" style="display: none;">There was a problem validating the form please
                  check!</div>
                <div class="error" id="err-timedout">The connection to the server timed out!</div>
                <div class="error" id="err-state"></div>
                <button type="submit" class="btn btn-primary btn-shadow btn-rounded w-md" style="margin: 0px 24px 3px 13px;
    padding: 10px 30px;" id="send">Gửi</button>
              </div> <!-- /col -->
            </div> <!-- /row -->

          </form> <!-- /form -->
        </div> <!-- end col -->

      </div> <!-- end row -->

    </div>

  </div>
</template>
<script>
import Apidata from '@/api/Apidata'
export default {
  data() {
    return {
      listCustomer: [],
      dataSubmit: {
        customerSPname: '',
        customerSPemail: '',
        customerSPDescriptions: '',
      },
     
    }
  },
  async created() {
    await this.getCustomer()
  },
  methods: {
    async AddCustomerSP(email) {
      try {
        await Apidata.addCustomerSP(this.$axios, this.dataSubmit,this.dataSubmit.customerSPemail = email)
        alert("Phản hổi của bạn được ghi nhận !")
        window.location.reload()
      } catch (err) {
        alert('Có lỗi xảy ra, vui lòng thử lại.' + JSON.stringify(err))
      }
    },
    async getCustomer() {
      try {
        const { data } = await Apidata.getCustomer(this.$axios)
        console.log(data)
        this.listCustomer = data
      } catch (err) {
        console.log(err)
      }
    }
  }

}
</script>
<style>
.container {
  padding: 0;
  background: #fff;
}

.form-control[readonly] {
  background-color: #fff;
}

address {
  font-size: 16px !important;
  font-weight: 500;
}

/*======= Contact ======*/

.form-control {
  box-shadow: none !important;
  outline: none !important;
  border: 2px solid #9cb0b9;
  height: 38px;
}

.form-control:hover,
.form-control:focus {
  border-color: #04060a;
}

.text-muted {
  color: black !important;
  font-size: 20px;
  font-family: 'Gill Sans', 'Gill Sans MT', Calibri, 'Trebuchet MS', sans-serif;

}


.error {
  margin: 8px 0px;
  display: none;
  color: red;
}

#ajaxsuccess {
  font-size: 16px;
  width: 100%;
  display: none;
  clear: both;
  margin: 8px 0px;
}

.con_sub_text {
  margin: 20px 0px;
  font-size: 15px;
}

.contact-detail-box {
  margin-bottom: 50px;
}

.contact-detail-box address {
  font-size: 14px;
}

.contact-map {
  background-color: #ededed;
}

.title-box .border,
.btn-primary,
.back-to-top,
.logo i,
.question-q-box,
.social-circle li a:hover {
  background-color: #f16000 !important;
}

.title-box .title-alt,
.text-colored,
.footer a:hover,
.navbar-custom .navbar-nav li a:hover,
.navbar-custom .navbar-nav li a:focus,
.navbar-custom .navbar-nav li a:active,
.navbar-custom .navbar-nav li.active a {
  color: #f16000;
}

.btn-primary {
  border: 1px solid #f16000 !important;
}

.btn-primary:hover,
.btn-primary:focus,
.btn-primary:active,
.btn-primary.active,
.btn-primary.focus,
.btn-primary:active,
.btn-primary:focus,
.btn-primary:hover,
.open>.dropdown-toggle.btn-primary,
.btn-primary.active.focus,
.btn-primary.active:focus,
.btn-primary.active:hover,
.btn-primary:active.focus,
.btn-primary:active:focus,
.btn-primary:active:hover,
.open>.dropdown-toggle.btn-primary.focus,
.open>.dropdown-toggle.btn-primary:focus,
.open>.dropdown-toggle.btn-primary:hover {
  background-color: #d85600 !important;
  border: 1px solid #d85600 !important;
}

.btn-shadow.btn-primary {
  box-shadow: 1px 5px 9px rgba(241, 96, 1, 0.32);
}



/*======= Responsive ======*/
@media (min-width: 768px) {
  .nav-custom-left {
    margin-left: 5%;
  }

  .navbar-nav>li>a {
    padding-top: 10px;
    padding-bottom: 10px;
  }

  .contact-page .col-sm-6 {
    padding-left: 30px;
    padding-right: 30px;
  }
}

@media (max-width: 768px) {
  .navbar-custom {
    -moz-box-shadow: 0 2px 2px rgba(0, 0, 0, .1);
    -webkit-box-shadow: 0 2px 2px rgba(0, 0, 0, .1);
    box-shadow: 0 2px 2px rgba(0, 0, 0, .1);
  }

  .screen-space {
    margin: 0px auto 50px auto;
  }

  .feature-detail {
    padding: 0px 0px 50px 30px !important;
  }

  .footer h5 {
    margin-top: 30px;
  }
}


@media only screen and (min-width: 768px) and (max-width: 991px) {
  .blog-wrapper .blog-item {
    width: 50%;
  }

  .navbar-custom .navbar-nav li a {
    font-size: 12px;
  }

  .blog-detail-box {
    padding-right: 0px;
  }
}

@media only screen and (min-width: 767px) and (max-width: 991px) {}

@media (max-width: 767px) {
  .blog-wrapper .blog-item {
    width: 100%;
  }

  .logo {
    margin-top: 7px;
  }

  .blog-detail-box {
    padding-right: 0px;
  }
}
</style>