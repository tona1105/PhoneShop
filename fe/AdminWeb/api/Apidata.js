export default {
  getproduct(axios){
    return axios.get('/api/Products')
  },
  getmenu(axios){
    return axios.get(`/api/menus`)
  },
  getnews(axios){
    return axios.get(`/api/news`)
  },
  getcustomer(axios){
    return axios.get('/api/Customers/Admin')
  },
  getproductbymenuyid(axios, menuID){
    return axios.get('/api/Products/viaCateId?MenuyId='+ menuID)
  },
  GetOutstandingProduct(axios, typeProduct){
    return axios.get('api/Products/OutstandingProduct?typeProduct='+ typeProduct)
  },

  GetCommentAll(axios) {
    return axios.get('/api/Comments')
  },

  GetComment(axios, productid){
    return axios.get('/api/Comments/comments?productid='+ productid)
  },



  GetSliderHot(axios, slidetype){
    return axios.get('/api/Sliders/SliderHot?slidetype='+ slidetype)
  },

  GetBillDetail(axios) {
    return axios.get('/api/BillDetails')
  },

  GetBillDetailID(axios, billId){
    return axios.get('/api/BillDetails/'+ billId)
  },

  getproductByID(axios, productid){
    return axios.get('/api/Products/'+ productid)
  },
  
  getCustomerSP(axios){
    return axios.get('/api/CustomerSPs')
  },
  
  getCustomer(axios){
    return axios.get('/api/Customers')
  },
  getSlider(axios){
    return axios.get('/api/Sliders')
  },

  getAbout(axios){
    return axios.get('/api/Abouts')
  },

  getcart(axios){
    return axios.get('/api/Carts')
  },

  getBill(axios){
    return axios.get('/api/Bills/Admin')
  },

  addproduct(axios, data){

    const url = `/api/Products`
    return axios.$post(url, data)
  },  

  addMenu(axios, data){

    const url = `/api/menus`
    return axios.$post(url, data)
  },  

  addNews(axios, data){

    const url = `/api/News`
    return axios.$post(url, data)
  },  
 
  addCustomerSP(axios, data){

    const url = `/api/CustomerSPs`
    return axios.$post(url, data)
  }, 

  addComment(axios, data){

    const url = `/api/Comments`
    return axios.$post(url, data)
  },

  addBill(axios, data){

    const url = `/api/Bills`
    return axios.$post(url, data)
  }, 

  addBillDetail(axios, data){

    const url = `/api/BillDetails`
    return axios.$post(url, data)
  }, 

  addAbout (axios, data) {
    const url = `/api/Abouts`
    return axios.$post(url,data)
  },

  register(axios, data){

    const url = `/api/Customers`
    return axios.$post(url, data)
  },
  
  searchData(axios,nameData){
    return axios.get(`/api/Products/search/${nameData}`)
},
getUserAdmin(axios,id) {
  return axios.get(`/api/Accounts/admin/${id}`)
}
}