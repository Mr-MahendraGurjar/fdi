import 'dart:developer';

import 'package:FdisTesting/models/toon_audit_model.dart';
import 'package:FdisTesting/pages/category_floor_page.dart';
import 'package:FdisTesting/widgets/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';
import 'package:signature/signature.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';

import '../providers/toon_audit_provider.dart';

class ToonAuditPage extends StatefulWidget {
  final String companyName;
  final String clientId;
  final String auditId;

  const ToonAuditPage(
      {Key? key,
      required this.companyName,
      required this.clientId,
      required this.auditId})
      : super(key: key);

  @override
  State<ToonAuditPage> createState() => _ToonAuditPageState();
}

class _ToonAuditPageState extends State<ToonAuditPage> {
  late Future<List<CategoryList>> _future;

  @override
  void initState() {
    _future = Provider.of<ToonAuditProvider>(context, listen: false)
        .fetchToonAuditList();
    Provider.of<ToonAuditProvider>(context, listen: false)
        .signatureController
        .addListener(() => log('Value changed'));
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
      appBar: AppBar(
        elevation: 0,
        backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
        centerTitle: true,
        actions: const [
          Center(
            child: Icon(Icons.upload),
          ),
          SizedBox(width: 10)
        ],
        title: Text(
          'Toon Audit',
          style: FlutterFlowTheme.of(context).bodyText1.override(
                fontFamily: 'Nunito',
                fontSize: 20,
                fontWeight: FontWeight.normal,
              ),
        ),
        leadingWidth: 150,
        leading: InkWell(
          onTap: () => Navigator.pop(context),
          child: Row(
            children: [
              const Icon(
                Icons.keyboard_arrow_left,
                color: Color(0xFF162A7B),
                size: 30,
              ),
              const SizedBox(width: 5),
              Text(
                'Audits',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Poppins',
                      color: const Color(0xFF162A7B),
                      fontSize: 18,
                      fontWeight: FontWeight.normal,
                    ),
              ),
            ],
          ),
        ),
      ),
      body: Consumer<ToonAuditProvider>(builder: (context, model, child) {
        return SingleChildScrollView(
          child: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Container(
                width: MediaQuery.of(context).size.width,
                height: 60,
                decoration: const BoxDecoration(
                  color: Color(0xFFBCC5E6),
                ),
                child: Row(
                  mainAxisSize: MainAxisSize.max,
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding:
                          const EdgeInsetsDirectional.fromSTEB(0, 0, 10, 0),
                      child: Text(
                        'KLANT',
                        style: FlutterFlowTheme.of(context).bodyText1.override(
                              fontFamily: 'Nunito',
                              fontSize: 20,
                            ),
                      ),
                    ),
                    const Icon(
                      Icons.keyboard_arrow_right,
                      color: Colors.black,
                      size: 24,
                    ),
                  ],
                ),
              ),
              Align(
                alignment: Alignment.topLeft,
                child: Padding(
                  padding: const EdgeInsets.only(left: 30, top: 10, bottom: 10),
                  child: Text(
                    widget.companyName,
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Nunito',
                          fontSize: 22,
                          fontWeight: FontWeight.w500,
                        ),
                  ),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 44,
                decoration: const BoxDecoration(
                  color: Color(0xFFE9EFF6),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(0),
                    bottomRight: Radius.circular(0),
                    topLeft: Radius.circular(8),
                    topRight: Radius.circular(8),
                  ),
                ),
                child: Align(
                  alignment: const AlignmentDirectional(-0.05, 0),
                  child: SelectionArea(
                      child: Text(
                    'INFORMATIE',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Roboto',
                          color: const Color(0xFF222628),
                          fontSize: 16,
                          fontWeight: FontWeight.w500,
                        ),
                  )),
                ),
              ),
              Container(
                width: MediaQuery.of(context).size.width * 0.85,
                height: 65,
                decoration: const BoxDecoration(
                  color: Color(0xFFC6CADB),
                  borderRadius: BorderRadius.only(
                    bottomLeft: Radius.circular(8),
                    bottomRight: Radius.circular(8),
                    topLeft: Radius.circular(0),
                    topRight: Radius.circular(0),
                  ),
                ),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            'Code ',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Nunito',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          Text(
                            'Audit Soort',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Nunito',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                          Text(
                            'Locatie',
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Nunito',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                          ),
                        ],
                      ),
                    ),
                    Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 5),
                      child: Row(
                        mainAxisSize: MainAxisSize.max,
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          Text(
                            model.toonAuditModel.data?.first.auditCode ?? "",
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: const Color(0xFF22492F),
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          Text(
                            model.toonAuditModel.data?.first.type ?? "",
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: const Color(0xFF22492F),
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                          Text(
                            model.toonAuditModel.data?.first.locationName ?? "",
                            style:
                                FlutterFlowTheme.of(context).bodyText1.override(
                                      fontFamily: 'Poppins',
                                      color: const Color(0xFF22492F),
                                      fontSize: 13,
                                      fontWeight: FontWeight.normal,
                                    ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 10),
              Container(
                height: MediaQuery.of(context).size.height * 0.3,
                margin: const EdgeInsets.symmetric(horizontal: 30),
                decoration: BoxDecoration(
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x33000000),
                      offset: Offset(0, 2),
                    )
                  ],
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Column(
                  children: [
                    const SizedBox(height: 10),
                    Text(
                      "CATEGORIEEN",
                      style: FlutterFlowTheme.of(context).bodyText1,
                    ),
                    const SizedBox(height: 15),
                    FutureBuilder<List<CategoryList>>(
                      future: _future,
                      builder: (context, snapshot) {
                        if (snapshot.hasData) {
                          if (snapshot.data!.isEmpty) {
                            return const Center(
                              child: Text("No data found"),
                            );
                          }
                          return Expanded(
                            child: ListView.builder(
                              shrinkWrap: true,
                              itemCount: snapshot.data!.length - 1,
                              itemBuilder: (context, index) {
                                final categoryData = snapshot.data![index + 1];
                                return Padding(
                                  padding: const EdgeInsets.only(bottom: 5),
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        horizontal: 5),
                                    child: ListTile(
                                      trailing: Text(
                                        "0/${categoryData.maximunSizeRange ?? 0}",
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1,
                                      ),
                                      minLeadingWidth:
                                          MediaQuery.of(context).size.width *
                                              0.43,
                                      leading: Container(
                                        height: 45,
                                        width:
                                            MediaQuery.of(context).size.width *
                                                0.43,
                                        padding: const EdgeInsets.only(left: 5),
                                        margin: const EdgeInsets.only(top: 5),
                                        decoration: BoxDecoration(
                                          color: Colors.green,
                                          boxShadow: const [
                                            BoxShadow(
                                              blurRadius: 4,
                                              color: Color(0x33000000),
                                              offset: Offset(0, 2),
                                            )
                                          ],
                                          gradient: const LinearGradient(
                                            begin: Alignment.topLeft,
                                            end: Alignment.bottomRight,
                                            stops: [0.8, 1],
                                            colors: [
                                              Colors.white,
                                              Color(0xffdb3636)
                                            ],
                                          ),
                                          borderRadius:
                                              BorderRadius.circular(7),
                                        ),
                                        child: Align(
                                          alignment: Alignment.centerLeft,
                                          child: Text(
                                            snapshot.data?[index + 1]
                                                    .categoryName ??
                                                "",
                                            style: FlutterFlowTheme.of(context)
                                                .bodyText1,
                                          ),
                                        ),
                                      ),
                                    ),
                                  ),
                                );
                              },
                            ),
                          );
                        } else if (snapshot.hasError) {
                          return Center(
                            child: Text("${snapshot.error}"),
                          );
                        } else {
                          return const Center(
                            child: CircularProgressIndicator(),
                          );
                        }
                      },
                    )
                  ],
                ),
              ),

              Container(
                margin:
                    const EdgeInsets.symmetric(horizontal: 30, vertical: 10),
                height: 50,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                  color: FlutterFlowTheme.of(context).primaryBtnText,
                  boxShadow: const [
                    BoxShadow(
                      blurRadius: 4,
                      color: Color(0x33000000),
                      offset: Offset(0, 2),
                    )
                  ],
                ),
                child: Center(
                  child: DropdownButtonHideUnderline(
                    child: DropdownButton<CustomDropdown>(
                      items: model.dropdown.map((CustomDropdown person) {
                        return DropdownMenuItem<CustomDropdown>(
                          value: person,
                          child: Text(person.name),
                        );
                      }).toList(),
                      onChanged: (CustomDropdown? value) {
                        setState(() {
                          model.selectedDropdownValue = value!;
                        });
                        if (value?.name == "O") {
                          final TextEditingController feedbackController =
                              TextEditingController();
                          final _formKey = GlobalKey<FormState>();
                          String _text;
                          showDialog(
                            context: context,
                            barrierDismissible: false,
                            builder: (context) {
                              return AlertDialog(
                                title: const Text('Feedback'),
                                content: Form(
                                  key: _formKey,
                                  child: Container(
                                    decoration: BoxDecoration(
                                      borderRadius: BorderRadius.circular(5),
                                      color: FlutterFlowTheme.of(context)
                                          .primaryBtnText,
                                      boxShadow: const [
                                        BoxShadow(
                                          blurRadius: 4,
                                          color: Color(0x33000000),
                                          offset: Offset(0, 2),
                                        )
                                      ],
                                    ),
                                    child: TextFormField(
                                      controller: feedbackController,
                                      decoration: const InputDecoration(
                                        border:
                                            InputBorder.none, // add this line
                                      ),
                                      validator: (value) {
                                        if (value!.isEmpty) {
                                          return 'Please enter some text';
                                        }
                                        return null;
                                      },
                                      onSaved: (value) {
                                        _text = value!;
                                      },
                                    ),
                                  ),
                                ),
                                actions: [
                                  TextButton(
                                    onPressed: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: const Text('Cancel'),
                                  ),
                                  model.isLoading
                                      ? const CircularProgressIndicator()
                                      : TextButton(
                                          onPressed: () {
                                            if (_formKey.currentState!
                                                .validate()) {
                                              _formKey.currentState!.save();
                                              model
                                                  .feedbackAPI(
                                                      feedback:
                                                          feedbackController
                                                              .text,
                                                      auditId: widget.auditId)
                                                  .then((value) {
                                                if (value.serverCode == 200) {
                                                  showTopSnackBar(
                                                    Overlay.of(context)!,
                                                    const CustomSnackBar
                                                        .success(
                                                      message: 'Feedback sent',
                                                    ),
                                                  );
                                                  Navigator.of(context).pop();
                                                }
                                              });
                                            }
                                          },
                                          child: const Text('OK'),
                                        ),
                                ],
                              );
                            },
                          );
                        }
                      },
                      value: model.selectedDropdownValue,
                      hint: const Text('KPI Element you can choose the value'),
                      isDense: true,
                    ),
                  ),
                ),
              ),

              Padding(
                padding: const EdgeInsets.symmetric(horizontal: 20),
                child: InkWell(
                  onTap: () {
                    Navigator.push(
                        context,
                        MaterialPageRoute(
                            builder: (context) => CategoryFloorPage(
                                auditId: widget.auditId,
                                companyName: widget.companyName,
                                clientId: widget.clientId)));
                  },
                  child: Container(
                    width: double.infinity,
                    height: 50,
                    decoration: BoxDecoration(
                        color: const Color(0xFF936CC8),
                        borderRadius: BorderRadius.circular(10)),
                    child: Center(
                      child: Text(
                        "START/RESUME",
                        style: FlutterFlowTheme.of(context).subtitle2.override(
                              fontFamily: 'Poppins',
                              color: Colors.white,
                              fontWeight: FontWeight.w500,
                            ),
                      ),
                    ),

                    // options: FFButtonOptions(
                    //   width: 165,
                    //   height: 40,
                    //   color: const Color(0xFF3D54B3),
                    //   textStyle:
                    //   FlutterFlowTheme.of(context).subtitle2.override(
                    //     fontFamily: 'Poppins',
                    //     color: Colors.white,
                    //     fontWeight: FontWeight.w500,
                    //   ),
                    //   borderSide: const BorderSide(
                    //     color: Colors.transparent,
                    //     width: 1,
                    //   ),
                    //   borderRadius: BorderRadius.circular(8),
                    // ),
                  ),
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: Stack(
                  children: [
                    Container(
                      decoration: BoxDecoration(
                          color: Colors.white,
                          boxShadow: const [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x33000000),
                              offset: Offset(0, 2),
                            )
                          ],
                          borderRadius: BorderRadius.circular(20)),
                      child: ClipRect(
                        child: Signature(
                          key: const Key('signature'),
                          controller: model.signatureController,
                          height: 150,
                          backgroundColor: Colors.white,
                        ),
                      ),
                    ),
                    Align(
                      alignment: Alignment.topRight,
                      child: Padding(
                        padding: const EdgeInsets.only(top: 8.0, right: 8),
                        child: CircleAvatar(
                            backgroundColor: Colors.red,
                            child: IconButton(
                              onPressed: () {
                                model.signatureController.clear();
                              },
                              icon: const Icon(Icons.cleaning_services_rounded),
                            )),
                      ),
                    )
                  ],
                ),
              ),

              Padding(
                padding:
                    const EdgeInsets.symmetric(horizontal: 20, vertical: 20),
                child: MaterialButton(
                  minWidth: double.infinity,
                  height: 50,
                  color: Colors.green,
                  onPressed: () async {},
                  child: Text('UPLOADEN'.toUpperCase(),
                      style: const TextStyle(color: Colors.white)),
                ),
              )

              // Padding(
              //   padding: const EdgeInsetsDirectional.fromSTEB(0, 10, 0, 0),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 0.85,
              //     height: 100,
              //     decoration: const BoxDecoration(
              //       color: Color(0xFFE0E3E7),
              //       boxShadow: [
              //         BoxShadow(
              //           blurRadius: 4,
              //           color: Color(0x33000000),
              //           offset: Offset(0, 2),
              //         )
              //       ],
              //       borderRadius: BorderRadius.only(
              //         bottomLeft: Radius.circular(0),
              //         bottomRight: Radius.circular(0),
              //         topLeft: Radius.circular(8),
              //         topRight: Radius.circular(8),
              //       ),
              //     ),
              //     child: Column(
              //       mainAxisSize: MainAxisSize.max,
              //       children: [
              //         ClipRect(
              //           child: Signature(
              //             controller: signatureController,
              //             backgroundColor: Colors.white,
              //             height: 100,
              //           ),
              //         ),
              //       ],
              //     ),
              //   ),
              // ),
              // Container(
              //   width: MediaQuery.of(context).size.width * 0.85,
              //   height: 60,
              //   decoration: BoxDecoration(
              //     color: FlutterFlowTheme.of(context).secondaryBackground,
              //     boxShadow: const [
              //       BoxShadow(
              //         blurRadius: 4,
              //         color: Color(0x33000000),
              //         offset: Offset(0, 2),
              //       )
              //     ],
              //     borderRadius: const BorderRadius.only(
              //       bottomLeft: Radius.circular(8),
              //       bottomRight: Radius.circular(8),
              //       topLeft: Radius.circular(0),
              //       topRight: Radius.circular(0),
              //     ),
              //   ),
              //   child: Row(
              //     mainAxisSize: MainAxisSize.max,
              //     mainAxisAlignment: MainAxisAlignment.end,
              //     children: [
              //       Padding(
              //         padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 160, 0),
              //         child: Text(
              //           'SIGNATURE',
              //           style:
              //           FlutterFlowTheme.of(context).bodyText1.override(
              //             fontFamily: 'Nunito',
              //             color: const Color(0xBE28546F),
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 13, 0),
              //         child: GestureDetector(
              //           onTap: () {
              //             signatureController.clear();
              //           },
              //           child: const Icon(
              //             Icons.delete_outline_outlined,
              //             color: Color(0xFF131313),
              //             size: 30,
              //           ),
              //         ),
              //       ),
              //       Padding(
              //         padding: const EdgeInsetsDirectional.fromSTEB(0, 0, 15, 0),
              //         child: FaIcon(
              //           FontAwesomeIcons.save,
              //           color: const Color(0xFF131313),
              //           size: 30,
              //         ),
              //       ),
              //     ],
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsetsDirectional.fromSTEB(0, 8, 0, 0),
              //   child: FFButtonWidget(
              //     onPressed: () {
              //       print('Button pressed ...');
              //     },
              //     text: 'UPLOADEN',
              //     options: FFButtonOptions(
              //       width: 210,
              //       height: 35,
              //       color: const Color(0xFF3D54B3),
              //       textStyle:
              //       FlutterFlowTheme.of(context).subtitle2.override(
              //         fontFamily: 'Nunito',
              //         color: Colors.white,
              //         fontSize: 17,
              //       ),
              //       borderSide: const BorderSide(
              //         color: Colors.transparent,
              //         width: 1,
              //       ),
              //       borderRadius: BorderRadius.circular(8),
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 0.85,
              //     height: 56,
              //     decoration: BoxDecoration(
              //       color: FlutterFlowTheme.of(context).secondaryBackground,
              //       boxShadow: const [
              //         BoxShadow(
              //           blurRadius: 4,
              //           color: Color(0x33000000),
              //           offset: Offset(0, 2),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 0.85,
              //     height: 56,
              //     decoration: BoxDecoration(
              //       color: FlutterFlowTheme.of(context).secondaryBackground,
              //       boxShadow: const [
              //         BoxShadow(
              //           blurRadius: 4,
              //           color: Color(0x33000000),
              //           offset: Offset(0, 2),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 0.85,
              //     height: 56,
              //     decoration: BoxDecoration(
              //       color: FlutterFlowTheme.of(context).secondaryBackground,
              //       boxShadow: const [
              //         BoxShadow(
              //           blurRadius: 4,
              //           color: Color(0x33000000),
              //           offset: Offset(0, 2),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
              // Padding(
              //   padding: const EdgeInsetsDirectional.fromSTEB(0, 15, 0, 0),
              //   child: Container(
              //     width: MediaQuery.of(context).size.width * 0.85,
              //     height: 56,
              //     decoration: BoxDecoration(
              //       color: FlutterFlowTheme.of(context).secondaryBackground,
              //       boxShadow: const [
              //         BoxShadow(
              //           blurRadius: 4,
              //           color: Color(0x33000000),
              //           offset: Offset(0, 2),
              //         )
              //       ],
              //     ),
              //   ),
              // ),
            ],
          ),
        );
      }),
    );
  }
}
