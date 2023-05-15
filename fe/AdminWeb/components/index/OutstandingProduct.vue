<template>
    <!-- Food Item -->
    <div class="product-item">
        <div class="image">
            <a :href="geturl(listProductnew.productid)"><img :src="listProductnew.imghp" alt=""></a>
        </div>
        <div class="caption">
            <div class="name text-center">
                <a><b>{{ listProductnew.productname }}</b></a>
            </div>
            <div class="price">
                <span class="price-new"><b>{{ listProductnew.price.toLocaleString() }} VNĐ</b></span>
            </div>
            <div class="instock">
                <h6>Số lượng: {{ listProductnew.inStock }}</h6>
            </div>
            <div class="cart">
                <button type="button" class="btn btn-primary"><a :href="geturl(listProductnew.productid)"> Xem
                        ngay</a></button>
            </div>
        </div>
        <button type="button" class="btn btn-default wishlist" data-toggle="tooltip" data-placement="right"
            title="Wishlist"><i class="fa fa-heart"></i></button>
        <button type="button" class="btn btn-default compare" data-toggle="tooltip" data-placement="right"
            title="Compare"><i class="fa fa-circle-o"></i></button>
    </div>
    <!--/ Food Item -->
</template>
<script>
export default {
    props: {
        listProductnew: {
            type: Object,
            requred: true,
            default() {
                return {}
            },
        },
    },
    methods: {
        geturl(detaiproduct) {
            const url = 'detail/' + detaiproduct;
            return url;
        }
    },


}
</script>
<style  >
body {

    background: #fff;
}

.image {
    border: 1px solid;
    border-radius: 5px;
    max-height: 300px;
}

product-item a {
    display: block;
    color: #434a54;
    font-weight: 700
}

.product-item a:hover {
    color: #37bc9b
}

.product-item .price {
    color: #aab2bd;
    font-weight: 700
}

.product-item .price .price-new {
    color: #000000
}

.product-grid .product-item {
    position: relative;
    width: 100%;
    border: none;
    padding-bottom: 4pc;
    border-radius: 3px;
    box-shadow: 0 1px 2px 0 #ccd1d9;
    overflow: hidden;
    z-index: 1;
    margin-bottom: 30px;
    margin-left: 20px;
    background-color: white;
}


.product-grid .product-item img {
    width: 100%;
    padding: 20px;
}

.product-grid .product-item .item-overlay {
    position: absolute;
    top: 0;
    left: 0;
    width: 100%;
    height: 100%;
    background: 0 0;
    border-radius: 3px;
    -webkit-transition: background .3s ease-in-out;
    transition: background .3s ease-in-out
}

.product-grid .product-item:hover .item-overlay {
    background: rgba(170, 178, 189, .42)
}
.product-grid .product-item:hover .caption::after {
    background-color: white;
 
}


.product-grid .product-item .clickable a {
    display: block;
    padding: 100%;
    z-index: 9
}

.product-grid .product-item .caption {
    border-left: 1px solid;
    border-right: 1px solid;
    position: absolute;
    bottom: -87pt;
    display: block;
    min-width: 100%;
    min-height: 200px;
    padding: 6px 14px;
    margin: 0px;
    background: #fff;
    transition: all .3s ease-in-out;
    z-index: 1;
}
.product-grid .product-item .caption::after {
    content: '';
    position: absolute;
    height: 1px;
    width: 262px;
    background-color: black;
    right: 0px;
    top: 83px;
    z-index: 2;
    transition: 0.5s
}



.product-grid .product-item .caption .cart {
    position: relative;
    display: block;
    clear: both;
}

.product-grid .product-item .caption .btn-primary {
    width: 100%;
    color: #fff;
    background: #37bc9b;
    border: 1px solid #37bc9b;
    -webkit-transition: all .2s ease-in-out 0s;
    transition: all .2s ease-in-out 0s
}

.product-grid .product-item .caption .btn-primary:hover {
    color: #434a54;
    background: 0 0;
    border: 1px solid #656d78
}

.product-grid .product-item .caption .name a,
.product-grid .product-item .caption .price {
    text-align: center
}

.product-grid .product-item .caption .name a {
    line-height: 1pc;
    margin: 9px 0 0
}

.product-grid .product-item:hover .caption {
    -webkit-transform: translatey(-83px);
    transform: translatey(-83px)
}

.product-grid .product-item .compare,
.product-grid .product-item .wishlist {
    color: #fff;
    display: none;
    margin-bottom: 3px;
    height: 30px;
    width: 30px;
    line-height: 30px;
    text-align: center;
    padding: 0;
    border: none;
    -webkit-transition: .3s;
    transition: .3s
}

.product-grid .product-item .compare a,
.product-grid .product-item .wishlist a {
    display: block;
    color: #fff;
    font-size: 14px
}

.product-grid .product-item .wishlist {
    position: absolute;
    top: 15px;
    left: 15px;
    background: #37bc9b
}

.product-grid .product-item .wishlist:hover {
    background: #33b091
}

.product-grid .product-item .compare {
    position: absolute;
    top: 3pc;
    left: 15px;
    background: #434a54
}

.product-grid .product-item .compare:hover {
    background: #393f47
}

.product-grid .product-item:hover .compare,
.product-grid .product-item:hover .wishlist {
    display: block
}

.product-grid .product-item .sale-tag {
    width: 50px;
    height: 75pt;
    background: #37bc9b;
    position: absolute;
    top: -45px;
    right: -10px;
    -webkit-transform: rotate(-45deg);
    transform: rotate(-45deg)
}

.product-grid .product-item .sale-tag span {
    color: #fff;
    font-size: 11px;
    font-weight: 700;
    left: 2px;
    position: absolute;
    top: 3pc;
    -webkit-transform: rotate(45deg);
    transform: rotate(45deg)
}

@media (min-width:992px) {
    .product-grid .product-item {
        width: 213px
    }
}

@media (min-width:1200px) {
    .product-grid .product-item {
        width: 263px
    }

@keyframes fadeIn {
    from {
        opacity: 0;
    }
    to {
        opacity: 1;
    }
}
}</style>