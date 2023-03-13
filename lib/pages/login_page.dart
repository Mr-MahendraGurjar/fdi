import 'package:FdisTesting/pages/home_page.dart';
import 'package:FdisTesting/providers/login_provider.dart';
import 'package:FdisTesting/widgets/flutter_flow_theme.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

class LoginPage extends StatelessWidget {
  final _formKey = GlobalKey<FormState>();
  final _usernameController = TextEditingController();
  final _passwordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    final loginProvider = Provider.of<LoginProvider>(context);
    return Scaffold(
      body: Stack(
        children: [
          Container(
            height: double.infinity,
            width: double.infinity,
            color: FlutterFlowTheme.of(context).lineColor,
            child: Padding(
              padding: const EdgeInsets.all(16.0),
              child: Form(
                key: _formKey,
                autovalidateMode: AutovalidateMode.onUserInteraction,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 110, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          height: MediaQuery.of(context).size.height * 0.26,
                          decoration: const BoxDecoration(),
                          child: Column(
                            mainAxisSize: MainAxisSize.max,
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Row(
                                mainAxisSize: MainAxisSize.max,
                                mainAxisAlignment: MainAxisAlignment.center,
                                children: [
                                  SelectionArea(
                                      child: Text(
                                    'Q',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Roboto',
                                          color: const Color(0xFF936CC8),
                                          fontSize: 40,
                                          fontWeight: FontWeight.w500,
                                          decoration: TextDecoration.underline,
                                        ),
                                  )),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            0, 0, 2, 0),
                                    child: SelectionArea(
                                        child: Text(
                                      'UALITY',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Nunito',
                                            color: const Color(0xFF113747),
                                            fontSize: 30,
                                          ),
                                    )),
                                  ),
                                  Padding(
                                    padding:
                                        const EdgeInsetsDirectional.fromSTEB(
                                            6, 0, 0, 0),
                                    child: SelectionArea(
                                        child: Text(
                                      'C',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Roboto',
                                            color: const Color(0xFF936CC8),
                                            fontSize: 40,
                                            fontWeight: FontWeight.w500,
                                            decoration:
                                                TextDecoration.underline,
                                          ),
                                    )),
                                  ),
                                  SelectionArea(
                                      child: Text(
                                    'HECK',
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Nunito',
                                          color: const Color(0xFF113747),
                                          fontSize: 30,
                                        ),
                                  )),
                                ],
                              ),
                              ClipRRect(
                                borderRadius: BorderRadius.circular(15),
                                child: Image.network(
                                  'https://getfive.com/wp-content/uploads/2015/11/Blog-Positive-Office-Politics.jpg',
                                  width:
                                      MediaQuery.of(context).size.width * 0.6,
                                  height: 140,
                                  fit: BoxFit.cover,
                                ),
                              ),
                            ],
                          ),
                        ),
                      ),
                      Padding(
                        padding:
                            const EdgeInsetsDirectional.fromSTEB(0, 40, 0, 0),
                        child: Container(
                          width: MediaQuery.of(context).size.width,
                          decoration: BoxDecoration(
                            color: FlutterFlowTheme.of(context).lineColor,
                          ),
                          child: Align(
                            alignment: const AlignmentDirectional(0, 0.25),
                            child: Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 10, 0, 0),
                              child: Column(
                                mainAxisSize: MainAxisSize.max,
                                crossAxisAlignment: CrossAxisAlignment.start,
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceEvenly,
                                children: [
                                  Text(
                                    "User Name",
                                    style:
                                        FlutterFlowTheme.of(context).bodyText2,
                                  ),
                                  TextFormField(
                                    controller: _usernameController,
                                    obscureText: false,
                                    textInputAction: TextInputAction.next,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter UserName";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      filled: true,
                                      hintText: 'Enter username',
                                      hintStyle: const TextStyle(fontSize: 12),
                                      enabledBorder: UnderlineInputBorder(
                                          borderSide: const BorderSide(
                                            color: Color(0x00000000),
                                            width: 1,
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(10)),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder:
                                          const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: const Color(0xFF6D7375),
                                        ),
                                    keyboardType: TextInputType.name,
                                  ),
                                  const SizedBox(height: 20),
                                  Text(
                                    "Password",
                                    style:
                                        FlutterFlowTheme.of(context).bodyText2,
                                  ),
                                  TextFormField(
                                    controller: _passwordController,
                                    textInputAction: TextInputAction.done,
                                    onFieldSubmitted: (_) => FocusScope.of(context).unfocus(),
                                    obscureText: false,
                                    validator: (value) {
                                      if (value!.isEmpty) {
                                        return "Please Enter Password";
                                      }
                                      return null;
                                    },
                                    decoration: InputDecoration(
                                      fillColor: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      filled: true,
                                      hintText: 'Enter password',
                                      hintStyle: const TextStyle(fontSize: 12),
                                      enabledBorder: UnderlineInputBorder(
                                        borderSide: const BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.circular(10),
                                      ),
                                      focusedBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      errorBorder: const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                      focusedErrorBorder:
                                          const UnderlineInputBorder(
                                        borderSide: BorderSide(
                                          color: Color(0x00000000),
                                          width: 1,
                                        ),
                                        borderRadius: BorderRadius.only(
                                          topLeft: Radius.circular(4.0),
                                          topRight: Radius.circular(4.0),
                                        ),
                                      ),
                                    ),
                                    style: FlutterFlowTheme.of(context)
                                        .bodyText1
                                        .override(
                                          fontFamily: 'Poppins',
                                          color: const Color(0xFF4F5254),
                                        ),
                                    keyboardType: TextInputType.visiblePassword,
                                  ),
                                ],
                              ),
                            ),
                          ),
                        ),
                      ),
                      const SizedBox(height: 26.0),
                      MaterialButton(
                        minWidth: double.infinity,
                        height: 50,
                        color: const Color(0xFF936CC8),
                        onPressed: () async {
                          if (_formKey.currentState!.validate()) {
                            final success = await loginProvider.login(
                              username: _usernameController.text,
                              password: _passwordController.text,
                              onLoginStateChanged: (LoginState state) {
                                if (state == LoginState.error) {
                                  showTopSnackBar(
                                    Overlay.of(context)!,
                                    CustomSnackBar.error(
                                      message: loginProvider.errorMessage,
                                    ),
                                  );
                                }
                              },
                            );
                            if (success) {
                              // showTopSnackBar(
                              //   Overlay.of(context)!,
                              //   const CustomSnackBar.success(
                              //     message: 'Login Successfully',
                              //   ),
                              // );
                              Navigator.pushReplacement(
                                  context,
                                  MaterialPageRoute(
                                      builder: (context) => HomePage()));
                            }
                          }
                        },
                        child: const Text('Login',
                            style: TextStyle(color: Colors.white)),
                      )
                    ],
                  ),
                ),
              ),
            ),
          ),
          if (loginProvider.isLoading)
            Container(
              color: Colors.black45,
              child: const Center(
                child: CircularProgressIndicator(
                  color: CupertinoColors.activeBlue,
                ),
              ),
            )
        ],
      ),
    );
  }
}
