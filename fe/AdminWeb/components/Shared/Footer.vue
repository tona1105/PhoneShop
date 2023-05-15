<template>
  <div class="footer_new">
    <footer class="container" style="background: none">
      <div class="footer__top section">
        <div class="">
          <div class="footer__grid row">
            <div class="col-4">
              <h3>Tona Shop</h3>
              <p style="color: black">Chúng tôi biết bạn có nhiều lựa chọn</p>
              <P style="color: black">Cảm ơn bạn đã lựa chọn chúng tôi</P>
            </div>
            <div class="col-4">
              <h3>About</h3>
              <div class="footer__link">
                <a class="footer_contact" href="#">About us</a>
              </div>
              <div class="footer__link">
                <a class="footer_contact" href="#">Coporate Sale</a>
              </div>
              <div class="footer__link">
                <a class="footer_contact" href="#">Temp and Policy</a>
              </div>
            </div>
            <div class="col-4 footer__on">
              <h3>Contact Info</h3>
              <div class="footer__contact">
                <i class="fa fa-map-marker-alt"></i>
                <a class="footer_contact" href="#"
                  >Call Center</a
                >
              </div>
              <div class="footer__contact">
                <i class="far fa-envelope"></i>
                <a href="">Email us</a>
              </div>
              <div class="footer__contact">
                <i class="fas fa-phone-alt"></i>
                <a class="footer_contact" href="">012345678</a>
              </div>
            </div>
          </div>
        </div>
      </div>

      <div class="footer__bottom">
        <div>
          © All rights reserved. Thiết kế website <a class="footer__1" href="#"></a>
        </div>
      </div>
    </footer>
  </div>
</template>
<script>
export default {}
</script>
<style>
.footer__1{
  color: #fe3859;
}
.footer_new{
  padding-top: 20px;
  background: linear-gradient(to right, #0df373, #008b99)
}
.footer__bottom{ 
  color: black;
  text-align: center;
  background: linear-gradient(to right, #0df373, #008b99)
}
.row{
  color: black;
}
a{
  color: black;
}
</style>
