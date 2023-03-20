import 'package:flutter/material.dart';
import 'package:flutter/services.dart';


import '../login_test1.dart';



class SignUp extends StatefulWidget {
  const SignUp({Key? key}) : super(key: key);

  @override
  State<SignUp> createState() => _SignUpState();
}

class _SignUpState extends State<SignUp> {

  final _formKey = GlobalKey<FormState>();
  TextEditingController emaillog = new TextEditingController();
  TextEditingController passlog = new TextEditingController();
  final TextEditingController _pass = TextEditingController();
  final TextEditingController _confirmPass = TextEditingController();
  bool _obscureText = true;
  bool _obscureText1 = true;
  @override
  Widget build(BuildContext context) {
    bool register = true;
    Size size = MediaQuery.of(context).size;
    var brightness = MediaQuery.of(context).platformBrightness;
    bool isDarkMode = brightness == Brightness.dark;
    return Scaffold(
      body: Container(
        width: double.infinity,
        decoration: const BoxDecoration(
            gradient: LinearGradient(
                begin: Alignment.topCenter,
                colors: [
                  Color.fromARGB(223, 82, 54, 43),
                  Color.fromARGB(223, 82, 54, 43),
                  Color.fromARGB(223, 82, 54, 43),
                ]
            )
        ),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: <Widget>[
            SizedBox(height: 80,),
            Padding(
              padding: EdgeInsets.all(20),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: <Widget>[
                  Text("Sign Up", style: TextStyle(color: Colors.white, fontSize: 40),),
                  SizedBox(height: 10,),
                  Text("Welcome Back", style: TextStyle(color: Colors.white, fontSize: 18),),
                ],
              ),
            ),
            SizedBox(height: 20),
            Expanded(
              child: Container(
                decoration: BoxDecoration(
                    color: Colors.white,
                    borderRadius: BorderRadius.only(topLeft: Radius.circular(60), topRight: Radius.circular(60))
                ),
                child: SingleChildScrollView(
                  child: Padding(
                    padding: EdgeInsets.all(30),
                    child: Column(
                      children: <Widget>[
                        SizedBox(height: 60,),
                        Container(
                            decoration: BoxDecoration(
                                color: Colors.white,
                                borderRadius: BorderRadius.circular(10),
                                boxShadow: [BoxShadow(
                                    color: Colors.grey,
                                    blurRadius: 20,
                                    offset: Offset(0, 10)
                                )]
                            ),
                            child: Column(
                                children: <Widget>[
                                  SingleChildScrollView(child: Form(
                                    key: _formKey,
                                    child:Column(children: [
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                        ),
                                        child: TextFormField(

                                          controller: emaillog,
                                          validator: (value) {
                                            if(value!.length<=5){
                                              return "Please Enter Name ";
                                            }

                                            return null;

                                          },

                                          decoration: InputDecoration(
                                              hintText: " Name",
                                              hintStyle: TextStyle(color: Colors.grey),
                                              border: InputBorder.none
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                        ),
                                        child: TextFormField(

                                          validator: (value){
                                            if(value!.length<=2)
                                            {
                                              return 'Please Enter Email ';
                                            }
                                            return null;
                                          },

                                          decoration: InputDecoration(

                                              hintText: "Email Address",
                                              hintStyle: TextStyle(color: Colors.grey),
                                              border: InputBorder.none
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                        ),
                                        child: TextFormField(
                                          inputFormatters: [
                                            LengthLimitingTextInputFormatter(10),
                                          ],

                                          keyboardType: TextInputType.phone,

                                          validator: (value) {
                                            if(value!.length<=8){
                                              return "Please Enter the 10 digit Number";
                                            }
                                            return null;

                                          },

                                          decoration: InputDecoration(
                                              hintText: "Mobile Number",
                                              hintStyle: TextStyle(color: Colors.grey),
                                              border: InputBorder.none
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                        ),
                                        child: TextFormField(
                                           controller: _pass,
                                          obscureText: _obscureText1,
                                          validator: (val){
                                            if(val!.isEmpty)
                                              return 'Empty';
                                            return null;
                                          },

                                          decoration: InputDecoration(
                                              suffixIcon: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _obscureText1 = !_obscureText1;
                                                  });
                                                },
                                                child: Icon(
                                                  _obscureText1 ? Icons.visibility : Icons.visibility_off,
                                                  semanticLabel:
                                                  _obscureText1 ? 'show password' : 'hide password',
                                                ),
                                              ),
                                              hintText: "Create Password",
                                              hintStyle: TextStyle(color: Colors.grey),
                                              border: InputBorder.none
                                          ),
                                        ),
                                      ),
                                      Container(
                                        padding: EdgeInsets.all(10),
                                        decoration: BoxDecoration(
                                            border: Border(bottom: BorderSide(color: Colors.grey.shade200))
                                        ),
                                        child: TextFormField(

                                          controller: _confirmPass,
                                          obscureText: _obscureText,
                                          validator:  (val){
                                            if(val!.isEmpty)
                                              return 'Empty';
                                            if(val != _pass.text)
                                              return 'Not Match';
                                            return null;
                                          },

                                          decoration: InputDecoration(
                                              suffixIcon: GestureDetector(
                                                onTap: () {
                                                  setState(() {
                                                    _obscureText = !_obscureText;
                                                  });
                                                },
                                                child: Icon(
                                                  _obscureText ? Icons.visibility : Icons.visibility_off,
                                                  semanticLabel:
                                                  _obscureText ? 'show password' : 'hide password',
                                                ),
                                              ),
                                              hintText: "Confirm Password",
                                              hintStyle: TextStyle(color: Colors.grey),
                                              border: InputBorder.none
                                          ),
                                        ),
                                      ),

                                    ],
                                    ),
                                  ))])),
                        SizedBox(height: 40,),

                        FloatingActionButton.extended(
                          isExtended: true,
                          backgroundColor:Color.fromARGB(223, 82, 54, 43) ,
                          onPressed: (){
                            if (_formKey.currentState!.validate()) {
                              print("successful");
                              return;
                            } else {
                              print("UnSuccessfull");
                            }

                          },
                          label: Text('                       Sign Up                            '),
                        ),
                        SizedBox(height: 20,),
                        RichText(
                          textAlign: TextAlign.left,
                          text: TextSpan(
                            children: [
                              TextSpan(
                                onEnter: (event) => Log1(),
                                text: register
                                    ? "Already have an account?"
                                    : '',
                                style: TextStyle(
                                  color: isDarkMode
                                      ? Colors.white
                                      : const Color(0xff1D1617),
                                  fontSize: size.height * 0.018,
                                ),
                              ),
                              WidgetSpan(

                                child: InkWell(
                                  onTap: () => setState(() {
                                    Navigator.pushNamed(context, "/log");
                                  }),
                                  child: register
                                      ? Text(
                                    "Login",

                                    style: TextStyle(
                                      foreground: Paint()
                                        ..shader = const LinearGradient(
                                          colors: <Color>[
                                            Color(0xffEEA4CE),
                                            Color(0xffC58BF2),
                                          ],
                                        ).createShader(
                                          const Rect.fromLTWH(
                                            0.0,
                                            0.0,
                                            200.0,
                                            70.0,
                                          ),
                                        ),
                                      fontSize: size.height * 0.018,
                                    ),
                                  )
                                      : Text(
                                    "Register",
                                    style: TextStyle(
                                      foreground: Paint()
                                        ..shader = const LinearGradient(
                                          colors: <Color>[
                                            Color(0xffEEA4CE),
                                            Color(0xffC58BF2),
                                          ],
                                        ).createShader(
                                          const Rect.fromLTWH(
                                              0.0, 0.0, 200.0, 70.0),
                                        ),
                                      // color: const Color(0xffC58BF2),
                                      fontSize: size.height * 0.018,
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        SizedBox(height: 50,),

                      ],
                    ),
                  ),
                ),
              ),
            )
          ],
        ),
      ),
    );
  }
}


class ValidationUtil {
  String? validateEmail(String value) {
    if (value.isEmpty) {
      return StringUtils.enterEmail;
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return StringUtils.enterValidEmail;
    }
    return null;
  }

  bool isValidEmail(String value) {
    if (value.isEmpty) {
      return false;
    } else if (!RegExp(
        r"^[a-zA-Z0-9.a-zA-Z0-9.!#$%&'*+-/=?^_`{|}~]+@[a-zA-Z0-9]+\.[a-zA-Z]+")
        .hasMatch(value)) {
      return false;
    }
    return true;
  }

  String? validatePassword(String value) {
    if (value.isEmpty) {
      return StringUtils.enterPassword;
    } else if (!RegExp("^.{6,30}").hasMatch(value)) {
      return StringUtils.enterValidPassword;
    }
    return null;
  }

  String? validateConfirmPassword(String confirmvalue, String password) {
    if (confirmvalue.isEmpty) {
      return StringUtils.enterConfirmPassword;
    } else if (confirmvalue.compareTo(password) != 0) {
      return StringUtils.enterMatchPassword;
    }
    return null;
  }

  String? validatePhoneNumberField(String value) {
    if (value.isEmpty) {
      return StringUtils.enterPhoneNumber;
    } else if (value.length < 9 && value.length > 20) {
      return StringUtils.enterValidPhoneNumber;
    }
    return null;
  }

  bool isValidPhoneNumber(String value) {
    if (value.isEmpty) {
      return false;
    } else if (value.length > 9 && value.length < 50) {
      value = value.replaceAll(new RegExp(r'[^\w\s]+'), '');
      value = value.replaceAll(' ', '');
      if (isNumeric(value)) {
        return true;
      }
      return false;
    }
    return false;
  }

  bool isNumeric(String s) {
    if (s == null) {
      return false;
    }
    return double.parse(s,null) != null;
  }

  String? validateField(String value, String errorMessage) {
    if (value.isEmpty) {
      return errorMessage;
    }
    return null;
  }

  static bool validateFieldEmpty(String value) {
    if (value.isEmpty) {
      return false;
    }
    return true;
  }
}
class StringUtils {
  static String appName = 'My Healthcare';

  // error messages
  static String enterName = 'Please enter name';
  static String enterEmail = 'Please enter email';
  static String enterValidEmail = 'Please enter valid email';
  static String enterPassword = 'Please enter password';
  static String enterValidPassword =
      'Password must be between 6 above charecter long';
  static String enterConfirmPassword = 'Please enter confirm password';
  static String enterMatchPassword = 'Password does not match';
  static String enterAddress = 'Please enter address';
  static String enterCompanyName = 'Please enter company name';
  static String enterDesignation = 'Please enter designation';
  static String enterPhoneNumber = 'Please enter phone number';
  static String enterValidPhoneNumber = 'Please enter valid phone number';
  static String enterAllDetail = 'Please enter all details';
  static String selectCategory= 'Please Select category';

  // login screen
  static String loginTitle = 'Login Screen';

  //navigation screen
  static String navDashboard = 'Dashboard';
  static String navScanEquipment = 'Scan Equipment';
  static String navProfile = 'Profile';
  static String navHelp = 'Help';
  static String navPrivacyPolicy = 'Privacy Policy';
  static String navSettings = 'Settings';
  static String navSignOut = 'Sign Out';
  static String navSharedSocialMedia = 'Shared Social Media';

  //bottom navigation screen
  static String navBottomDashboard = 'Dashboard';
  static String navBottomScan = 'Scan';
  static String navBottomFavorites = 'Favorite';
  static String navBottomChallanges = 'Challanges';

  static String category0 = 'All Categories';
  static String category1 = 'Doctor';
  static String category2 = 'Plumber';
  static String category3 = 'Mechanic';
  static String category4 = 'Medicals & Pharmacy';
  static String category5 = 'IT Support';
  static String category6 = 'Retail';
  static String category7 = 'Mobiles and Communications';
  static String category8 = 'Insurance';
  static String category9 = 'Electrician';
  static String category10 = 'Other Trades';
  static String category11 = 'Tailor';
  static String category12 = 'Business';
  static String category13 = 'Legal';
  static String category14 = 'Accounting';
  static String category15 = 'Real Estate';
  static String category16 = 'Leisure';
  static String category17 = 'Education';
  static String category18 = 'Miscellaneous';
  static String category19 = 'Others';

//  contact fields
  static String contactName = 'Contact Name';
  static String emailId= 'Email Id';
  static String phoneNumber = 'Phone Number';
  static String address = 'Address';
  static String companyName= 'Company Name';
  static String designation = 'Designation';
  static String category = 'Category';

  // Screen
  static String homeScreen = 'Country';
  static String articleScreen = 'Detail';


}


