<template>
    <!-- Product Item -->
      <div class="product-item">
        <div class="image">
          <a :href="geturl(product.productid)"><img :src="product.imghp"  alt=""></a>
        </div>
        <div class="caption">
          <div class="name text-center">
            <a><b>{{ product.productname }}</b></a>
          </div>
          <div class="price">
            <span class="price-new"><h6>{{ product.price.toLocaleString() }} VNĐ</h6></span>
          </div>
          <div class="instock">
                <h6>Số lượng: {{ product.inStock }}</h6>
            </div>
          <div class="cart" v-if="product.inStock > 0">
            <button type="button" class="btn btn-primary" style="margin-top: 10px;"><a :href="geturl(product.productid)" >  <h5>Xem ngay</h5></a></button>
          </div>
          <div class="cart" v-else>
            <button type="button" class="btn btn-primary"><a :href="geturl(product.productid)" >  Hết Hàng</a></button>
          </div>
        </div>
        <button type="button" class="btn btn-default wishlist" data-toggle="tooltip" data-placement="right" title="Wishlist"><i class="fa fa-heart"></i></button>
        <button type="button" class="btn btn-default compare" data-toggle="tooltip" data-placement="right" title="Compare"><i class="fa fa-circle-o"></i></button>
      </div>
    <!--/ product Item -->
</template>
<script>
export default {
  props: {
    product: {
      type: Object,
      requred: true,
      default() {
        return {}
      },
    },
  },
  methods: {
   
    geturl(detaiproduct)
    {
      const url ='/detail/' + detaiproduct;
      return url;
    }
  },
}
</script>
<style>
/* RESET RULES & HELPER CLASSES
–––––––––––––––––––––––––––––––––––––––––––––––––– */
:root {
  --lightblue: #f6f9fc;
  --red: #d64041;
}

a,
a:hover {
  color: inherit;
}

a:hover {
  text-decoration: none;
}

.bg-lightblue {
  background: var(--lightblue);
}

.bg-red {
  background: var(--red);
}

.text-red {
  color: var(--red);
}

.container-fluid-max {
  max-width: 1440px;
}

.cover {
  background: no-repeat center/cover;
}

.p-15 {
  padding: 15px;
}

/* SCROLL ANIMATIONS
–––––––––––––––––––––––––––––––––––––––––––––––––– */
.scroll .page-header {
  background: var(--red);
}

.scroll .hero {
  transform: scale(0.98);
}

/* HEADER
–––––––––––––––––––––––––––––––––––––––––––––––––– */
.page-header {
  transition: background 0.5s ease-in-out;
}

.page-header .navbar {
  padding: 1rem 0;
}

.page-header .navbar-toggler {
  /* the variable is inherited from BS4 built-in variables */
  border-color: var(--white); 
}

/* BANNER SECTION
–––––––––––––––––––––––––––––––––––––––––––––––––– */
.hero {
  background-attachment: fixed;
  transition: transform 0.5s ease-in-out;
}

.hero::after {
  content: "";
  position: absolute;
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background: linear-gradient(
    rgba(0, 0, 0, 0.5) 0,
    rgba(0, 0, 0, 0.3) 50%,
    rgba(0, 0, 0, 0.1) 100%
  );
}

.hero .container-fluid {
  z-index: 10;
}

/* POPULAR DESTINATIONS SECTION
–––––––––––––––––––––––––––––––––––––––––––––––––– */
.popular-destinations figure {
  margin-bottom: 30px;
}

.popular-destinations figcaption {
  top: 0;
  right: 0;
  bottom: 0;
  left: 0;
  background: rgba(0, 0, 0, 0.3);
}

.popular-destinations img {
  filter: grayscale(100%) blur(3px);
  transition: transform 0.5s, filter 0.75s;
}

.popular-destinations a:hover img {
  transform: scale(1.25);
  filter: none;
}

/* PAGE FOOTER
–––––––––––––––––––––––––––––––––––––––––––––––––– */
.page-footer .footer-links {
  text-align: right;
}

/* MEDIA QUERIES
–––––––––––––––––––––––––––––––––––––––––––––––––– */
/* MEDIUM SCREENS */
@media screen and (max-width: 991px) {
  .page-header {
    background: var(--red);
  }
}

/* SMALL SCREENS */
@media screen and (max-width: 767px) {
  .page-footer .footer-child {
    text-align: center;
  }
}
</style>