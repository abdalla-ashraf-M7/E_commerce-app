class AppLinks {
  static const server = "http://abdallam7.online/ecommerce";
  static const imagestatic = "http://abdallam7.online/ecommerce/upload";

  //images
  static const catsimages = "$imagestatic/cats";
  static const itmesimages = "$imagestatic/items";
  static const test = "$server/test.php";

  //auth
  static const signup = "$server/auth/signup.php";
  static const verifysignup = "$server/auth/verifycode.php";
  static const login = "$server/auth/login.php";
  static const resendcode = "$server/auth/resendcode.php";

  //forgetpassword
  static const forgetpassword = "$server/forgetpassword/forgetpassword.php";
  static const verifycodeforgetpass = "$server/forgetpassword/verifycodeforgetpassword.php";
  static const ressetpassword = "$server/forgetpassword/ressetpassword.php";

  //home
  static const home = "$server/home.php";

  //items
  static const items = "$server/items/items.php";
  static const search = "$server/items/search.php";

  //fav
  static const addfav = "$server/fav/addfav.php";
  static const deletefav = "$server/fav/deletefav.php";
  static const myfav = "$server/fav/myfav.php";
  static const deletefavfromfavscreen = "$server/fav/deletefromfavscreen.php";

  //cart
  static const addcart = "$server/cart/add.php";
  static const deletecart = "$server/cart/delete.php";
  static const viewcart = "$server/cart/view.php";
  static const getcartcount = "$server/cart/getcartcount.php";
  static const copoun = "$server/copoun/get.php";

  //address
  static const addressAdd = "$server/address/add.php";
  static const addressEdit = "$server/address/edit.php";
  static const addressDelete = "$server/address/delete.php";
  static const addressView = "$server/address/view.php";

  //order
  static const checkout = "$server/orders/checkout.php";
  static const myOrders = "$server/orders/myorders.php";
  static const orderdetails = "$server/orders/orderdetails.php";
  static const orderDelete = "$server/orders/delete.php";
  static const orderArchive = "$server/orders/archive.php";
  static const orderRating = "$server/orders/rating.php";

  //ntifications
  static const notifications = "$server/orders/notifications.php";

  //offer
  static const offer = "$server/offer.php";
}
