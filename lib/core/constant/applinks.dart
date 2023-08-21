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

  //fav
  static const addfav = "$server/fav/addfav.php";
  static const deletefav = "$server/fav/deletefav.php";
  static const myfav = "$server/fav/myfav.php";
  static const deletefavfromfavscreen = "$server/fav/deletefromfavscreen.php";
}
