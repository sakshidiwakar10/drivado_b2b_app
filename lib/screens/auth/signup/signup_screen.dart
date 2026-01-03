
import 'package:drivado_b2b_app/screens/common_widgets/custom_buttons.dart';
import 'package:drivado_b2b_app/screens/common_widgets/custom_decoration.dart';
import 'package:drivado_b2b_app/screens/common_widgets/custom_text.dart';
import 'package:drivado_b2b_app/screens/common_widgets/custom_textfield.dart';
import 'package:drivado_b2b_app/utils/theme/colors.dart';
import 'package:email_validator/email_validator.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:google_fonts/google_fonts.dart';

class SignupPage extends StatefulWidget {
  const SignupPage({super.key});

  @override
  State<SignupPage> createState() => _SignupPageState();
}

class _SignupPageState extends State<SignupPage> {
  //signup-------------------------
  TextEditingController firstName = TextEditingController();
  TextEditingController lastName = TextEditingController();
  TextEditingController email = TextEditingController();
  TextEditingController confirmEmail = TextEditingController();
  TextEditingController companyName = TextEditingController();
  TextEditingController conatactNumber = TextEditingController();
  TextEditingController address = TextEditingController();

  bool isFirstValidator = false;
  bool isLastValidator = false;
  bool isEmailValidator = false;
  bool isConfirmEmailValidator = false;
  bool isContactValidator = false;
  bool isCompanyNameValidator = false;
  bool isAddressValidator = false;
  bool isEmailValid = true;
  bool isEmailValidShow = true;

  bool isLoad = false;
  bool isAgree = false;

  @override
  void initState() {
    SystemChrome.setSystemUIOverlayStyle(SystemUiOverlayStyle.light);
    super.initState();
  }

  @override
  void dispose() {
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return PopScope(
      canPop: false,
      child: Scaffold(
        body: Stack(
          children: [
            Column(
              children: [
                Container(
                  width: MediaQuery.of(context).size.width,
                  height: 230,
                  decoration: BoxDecoration(
                      color: Color(0xff190C0C),
                      image: DecorationImage(
                          image: AssetImage(
                              'assets/auth/loginbg.png'),
                          fit: BoxFit.fill)),
                  child: Padding(
                    padding: const EdgeInsets.symmetric(horizontal: 22.0),
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const SizedBox(
                          height: 30,
                        ),
                        Row(
                          children: [
                            CustomText(
                                title:'Sign up to ',
                                color: Colors.white,
                                fontWeight: FontWeight.w700,
                                fontSize: 32),
                          ],
                        ),
                        const SizedBox(
                          height: 8,
                        ),
                        Row(
                          children: [
                            RichText(
                              text: TextSpan(
                                text: 'your ',
                                style: GoogleFonts.plusJakartaSans(
                                    fontWeight: FontWeight.w700,
                                    fontSize: 32,
                                    color: Colors.white),
                                children: <TextSpan>[
                                  TextSpan(
                                      text: 'Account',
                                      style: GoogleFonts.plusJakartaSans(
                                          fontWeight: FontWeight.w700,
                                          fontSize: 32,
                                          color: AppColors.secondary)),
                                ],
                              ),
                            )
                          ],
                        ),
                        const SizedBox(
                          height: 18,
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            Positioned.fill(
              top: 200,
              child: Container(
                  width: MediaQuery.of(context).size.width,
                  decoration: CustomDecorations().baseBackgroundDecoration(20.0, 1.0, Colors.white, Colors.transparent),
                  child: SingleChildScrollView(
                    child: Padding(
                      padding: const EdgeInsets.symmetric(
                          horizontal: 16.0, vertical: 0),
                      child: Column(
                        children: [
                          const SizedBox(height: 20,),
                          CustomTextField(
                            title: 'First',
                            hintText: 'Enter your first name',
                            controller: firstName,
                            isPassword: false,
                            icon: 'null',
                            height: 52,
                            width: MediaQuery.of(context).size.width,
                            onChanged: (val) {
                              if(firstName.text != '') {
                                isFirstValidator = false;
                              }else {
                                isFirstValidator = true;
                              }
                              setState(() {
                              });
                            },
                            onTap: () {
                              // setState(() {
                              // });
                            },
                            suffix: false,
                            readOnly: false,
                            astric: true,
                            error: isFirstValidator,),
                          const SizedBox(height: 12,),
                          CustomTextField(
                            title: 'Last Name',
                            hintText: 'Enter your last name',
                            controller: lastName,
                            isPassword: false,
                            icon: 'null',
                            height: 52,
                            width: MediaQuery.of(context).size.width,
                            onChanged: (val) {
                              if(lastName.text != '') {
                                isLastValidator = false;
                              }else {
                                isLastValidator = true;
                              }
                              setState(() {
                              });
                            },
                            onTap: () {
                            },
                            suffix: false,
                            readOnly: false,
                            astric: true,
                            error: isLastValidator,),
                          const SizedBox(height: 12,),
                          CustomTextField(
                            title: 'Email ID',
                            hintText: 'Enter your email ID',
                            controller: email,
                            isPassword: false,
                            icon: 'null',
                            height: 52,
                            width: MediaQuery.of(context).size.width,
                            onChanged: (val) {
                              isEmailValid = EmailValidator.validate(email.text);
                              if(isEmailValid && email.text != '') {
                                isEmailValidator = false;
                              }else {
                                isEmailValidator = true;
                              }
                              setState(() {
                              });
                            },
                            onTap: () {
                            },
                            suffix: false,
                            readOnly: false,
                            astric: true,
                            error: isEmailValidator,),
                          const SizedBox(height: 12,),
                          CustomTextField(
                            title: 'Confirm Email',
                            hintText: 'Enter your confirm email',
                            controller: confirmEmail,
                            isPassword: false,
                            icon: 'null',
                            height: 52,
                            width: MediaQuery.of(context).size.width,
                            onChanged: (val) {
                              if(confirmEmail.text != '') {
                                isConfirmEmailValidator = false;
                              }else {
                                isConfirmEmailValidator = true;
                              }
                              setState(() {
                              });
                            },
                            onTap: () {
                              // isTapPassword = true;
                              // setState(() {
                              // });
                            },
                            suffix: true,
                            readOnly: false,
                            astric: true,
                            error: isConfirmEmailValidator,
                          ),
                          const SizedBox(height: 12,),
                          CustomTextField(
                            title: 'Company Name',
                            hintText: 'Enter your company name',
                            controller: companyName,
                            isPassword: false,
                            icon: 'null',
                            height: 52,
                            width: MediaQuery.of(context).size.width,
                            onChanged: (val) {
                              if(companyName.text != '') {
                                isCompanyNameValidator = false;
                              }else {
                                isCompanyNameValidator = true;
                              }
                              setState(() {
                              });
                            },
                            onTap: () {
                              // isTapPassword = true;
                              // setState(() {
                              // });
                            },
                            suffix: true,
                            readOnly: false,
                            astric: true,
                            error: isCompanyNameValidator,
                          ),
                          const SizedBox(height: 12,),
                          CustomTextField(
                            title: 'Company Name',
                            hintText: 'Enter your company name',
                            controller: companyName,
                            isPassword: false,
                            icon: 'null',
                            height: 52,
                            width: MediaQuery.of(context).size.width,
                            onChanged: (val) {
                              if(companyName.text != '') {
                                isCompanyNameValidator = false;
                              }else {
                                isCompanyNameValidator = true;
                              }
                              setState(() {
                              });
                            },
                            onTap: () {
                              // isTapPassword = true;
                              // setState(() {
                              // });
                            },
                            suffix: true,
                            readOnly: false,
                            astric: true,
                            error: isCompanyNameValidator,
                          ),
                          const SizedBox(
                            height: 12,
                          ),
                          Row(
                            children: [
                              GestureDetector(
                                onTap: ( ){
                                  setState(() {
                                    isAgree = !isAgree;
                                  });
                                },
                                child: Row(
                                  children: [
                                    Icon(
                                      isAgree ? Icons.check_box :  Icons.check_box_outline_blank_rounded,
                                      color: isAgree ? AppColors.secondary : Color(0xFF606060),
                                      size: 17,
                                    ),
                                    const SizedBox(
                                      width: 7,
                                    ),
                                    SizedBox(
                                      width: MediaQuery.of(context).size.width /1.2,
                                      child: RichText(
                                        text: TextSpan(
                                          text: 'I consent to receiving digital and telephone communication from Drivado regarding its services.',
                                          style: GoogleFonts.plusJakartaSans(
                                              fontWeight: FontWeight.w500,
                                              fontSize: 12,
                                              color: Color(0xff0d0d0d)),
                                          children: <TextSpan>[
                                            TextSpan(
                                                text: 'more',
                                                style: GoogleFonts.plusJakartaSans(
                                                    fontWeight: FontWeight.w500,
                                                    fontSize: 12,
                                                    color: AppColors.secondary)),
                                          ],
                                        ),
                                      ),
                                    )
                                  ],
                                ),
                              ),
                            ],
                          ),
                          const SizedBox(
                            height: 32,
                          ),
                          CustomButtons(onTap: () {}, title: 'Sign up', color: Colors.white, fontWeight: FontWeight.w600, fontSize: 16),
                          const SizedBox(
                            height: 32,
                          ),
                          RichText(
                            text: TextSpan(
                              text: 'Don’t have an account ?  ',
                              style: GoogleFonts.plusJakartaSans(
                                  fontWeight: FontWeight.w500,
                                  fontSize: 14,
                                  color: Color(0xff606060)),
                              children: <TextSpan>[
                                TextSpan(
                                    text: 'Sign up',
                                    style: GoogleFonts.plusJakartaSans(
                                        fontWeight: FontWeight.w600,
                                        fontSize: 14,
                                        color: AppColors.secondary)),
                              ],
                            ),
                          )
                        ],
                      ),
                    ),
                  )
              ),
            ),
          ],
        ),
      ),

    );
  }
}
