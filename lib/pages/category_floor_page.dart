import 'package:FdisTesting/database_helper/database_helper.dart';
import 'package:FdisTesting/models/area_by_category_model.dart';
import 'package:FdisTesting/models/category_by_id_model.dart';
import 'package:FdisTesting/models/floor_model.dart';
import 'package:FdisTesting/models/store_data_model.dart';
import 'package:FdisTesting/pages/list_of_error_page.dart';
import 'package:FdisTesting/providers/category_floor_provider.dart';
import 'package:FdisTesting/widgets/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:provider/provider.dart';
import 'package:sqflite/sqlite_api.dart';
import 'package:top_snackbar_flutter/custom_snack_bar.dart';
import 'package:top_snackbar_flutter/top_snack_bar.dart';
import 'package:FdisTesting/database_helper/database_helper.dart';

class CategoryFloorPage extends StatefulWidget {
  final String auditId;
  final String companyName;
  final String clientId;

  const CategoryFloorPage(
      {Key? key,
      required this.auditId,
      required this.companyName,
      required this.clientId})
      : super(key: key);

  @override
  State<CategoryFloorPage> createState() => _CategoryFloorPageState();
}

class _CategoryFloorPageState extends State<CategoryFloorPage> {
  late CategoryFloorProvider categoryFloorProvider;
  Future<List<CategoryData>>? _future;
  Future<List<FloorData>>? _floorFuture;
  final roomiteNumberController = TextEditingController();
  final telElementController = TextEditingController();
  final remarkController = TextEditingController();

  @override
  void initState() {
    categoryFloorProvider = CategoryFloorProvider();
    callAPI();
    super.initState();
  }

  Future<void> callAPI() async {
    WidgetsBinding.instance.addPostFrameCallback((timeStamp) async {
      _future = categoryFloorProvider.getCategoryById();
      _floorFuture = categoryFloorProvider.getFloorList();
    });
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<CategoryFloorProvider>(
      create: (context) => categoryFloorProvider,
      child: Consumer<CategoryFloorProvider>(
        builder: (BuildContext context, model, Widget? child) => Scaffold(
          backgroundColor: FlutterFlowTheme.of(context).primaryBtnText,
          appBar: AppBar(
            elevation: 0,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            centerTitle: true,
            title: Text(
              'TOON FORMULIER',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Nunito',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            leadingWidth: 150,
            leading: InkWell(
              onTap: () async {
                Navigator.pop(context);
              },
              child: Row(
                children: [
                  const Icon(
                    Icons.keyboard_arrow_left,
                    color: Color(0xFF162A7B),
                    size: 30,
                  ),
                  const SizedBox(width: 5),
                  Text(
                    'Back',
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
          body: Consumer<CategoryFloorProvider>(builder: (context, model, _) {
            return GestureDetector(
              onTap: () {
                FocusScope.of(context).unfocus();
              },
              child: Container(
                height: MediaQuery.of(context).size.height,
                width: MediaQuery.of(context).size.width,
                color: const Color(0x33000000),
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Container(
                        width: MediaQuery.of(context).size.width,
                        height: 70,
                        decoration: const BoxDecoration(
                          color: Color(0xFFC6CADB),
                          boxShadow: [
                            BoxShadow(
                              blurRadius: 4,
                              color: Color(0x33000000),
                              offset: Offset(0, 2),
                            )
                          ],
                        ),
                        child: Row(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.end,
                          children: [
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 50, 0),
                              child: SelectionArea(
                                  child: Text(
                                'Test Company',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                              )),
                            ),
                            Padding(
                              padding: const EdgeInsetsDirectional.fromSTEB(
                                  0, 0, 20, 0),
                              child: Container(
                                width: 100,
                                height: 100,
                                decoration: const BoxDecoration(
                                  color: Color(0xFFC6CADB),
                                ),
                                child: Column(
                                  mainAxisSize: MainAxisSize.max,
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    SelectionArea(
                                        child: Text(
                                      'CODE',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: const Color(0xFF393D3F),
                                            fontSize: 16,
                                          ),
                                    )),
                                    SelectionArea(
                                        child: Text(
                                      '10841',
                                      style: FlutterFlowTheme.of(context)
                                          .bodyText1
                                          .override(
                                            fontFamily: 'Poppins',
                                            color: const Color(0xFF393D3F),
                                          ),
                                    )),
                                  ],
                                ),
                              ),
                            ),
                          ],
                        ),
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(
                            horizontal: 20, vertical: 20),
                        child: Column(
                          mainAxisSize: MainAxisSize.max,
                          mainAxisAlignment: MainAxisAlignment.center,
                          children: [
                            FutureBuilder<List<CategoryData>>(
                              future: _future,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Category',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      const SizedBox(height: 5),
                                      Container(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                        child: DropdownButtonHideUnderline(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: DropdownButton<CategoryData>(
                                              value:
                                                  model.selectedCategoryValue,
                                              hint: const Text(
                                                  'Select a category'),
                                              items: snapshot.data?.map<
                                                      DropdownMenuItem<
                                                          CategoryData>>(
                                                  (CategoryData value) {
                                                return DropdownMenuItem<
                                                    CategoryData>(
                                                  value: value,
                                                  child: Text(
                                                      value.categoryName ?? ""),
                                                );
                                              }).toList(),
                                              onChanged:
                                                  (CategoryData? newValue) {
                                                setState(() {
                                                  model.selectedCategoryValue =
                                                      newValue!;
                                                  model.getFloorByCategoryId(
                                                      categoryId:
                                                          newValue.categoryId ??
                                                              "");
                                                });

                                                // if (model.selectedFloorValue != null &&
                                                //     model.selectedCategoryValue !=
                                                //         null &&
                                                //     model.selectedFloorValue !=
                                                //         null &&
                                                //     roomiteNumberController
                                                //         .text.isNotEmpty) {
                                                //   model.getData(
                                                //       categoryId: model
                                                //           .selectedCategoryValue!
                                                //           .categoryId
                                                //           .toString(),
                                                //       floorId: model
                                                //           .selectedFloorValue!
                                                //           .id
                                                //           .toString(),
                                                //       areaId: model
                                                //           .selectedAreaData!.id
                                                //           .toString(),
                                                //       areaNumber:
                                                //           roomiteNumberController
                                                //               .text);
                                              //  }
                                              },
                                              isDense: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                return const CircularProgressIndicator();
                              },
                            ),
                            const SizedBox(height: 15),
                            FutureBuilder<List<FloorData>>(
                              future: _floorFuture,
                              builder: (context, snapshot) {
                                if (snapshot.hasData) {
                                  return Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    children: [
                                      Text(
                                        'Floor',
                                        style: FlutterFlowTheme.of(context)
                                            .bodyText1
                                            .override(
                                              fontFamily: 'Roboto',
                                              fontSize: 18,
                                              fontWeight: FontWeight.w500,
                                            ),
                                      ),
                                      const SizedBox(height: 5),
                                      Container(
                                        height: 50,
                                        width:
                                            MediaQuery.of(context).size.width,
                                        decoration: BoxDecoration(
                                          borderRadius:
                                              BorderRadius.circular(10),
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
                                        child: DropdownButtonHideUnderline(
                                          child: Padding(
                                            padding: const EdgeInsets.symmetric(
                                                horizontal: 8.0),
                                            child: DropdownButton<FloorData>(
                                              value: model.selectedFloorValue,
                                              hint:
                                                  const Text('Select a floor'),
                                              items: snapshot.data?.map<
                                                      DropdownMenuItem<
                                                          FloorData>>(
                                                  (FloorData value) {
                                                return DropdownMenuItem<
                                                    FloorData>(
                                                  value: value,
                                                  child: Text(
                                                      value.floorName ?? ""),
                                                );
                                              }).toList(),
                                              onChanged: (FloorData? newValue) {
                                                setState(() {
                                                  model.selectedFloorValue =
                                                      newValue!;
                                                });

                                                // if (model.selectedFloorValue != null &&
                                                //     model.selectedCategoryValue !=
                                                //         null &&
                                                //     model.selectedFloorValue !=
                                                //         null &&
                                                //     roomiteNumberController
                                                //         .text.isNotEmpty) {
                                                //   model.getData(
                                                //       categoryId: model
                                                //           .selectedCategoryValue!
                                                //           .categoryId
                                                //           .toString(),
                                                //       floorId: model
                                                //           .selectedFloorValue!
                                                //           .id
                                                //           .toString(),
                                                //       areaId: model
                                                //           .selectedAreaData!.id
                                                //           .toString(),
                                                //       areaNumber:
                                                //           roomiteNumberController
                                                //               .text);
                                                // }
                                              },
                                              isDense: true,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ],
                                  );
                                } else if (snapshot.hasError) {
                                  return Text('${snapshot.error}');
                                }
                                return const CircularProgressIndicator();
                              },
                            ),
                            const SizedBox(height: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Area',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                const SizedBox(height: 5),
                                Container(
                                  height: 50,
                                  width: MediaQuery.of(context).size.width,
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(10),
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
                                  child: DropdownButtonHideUnderline(
                                    child: Padding(
                                      padding: const EdgeInsets.symmetric(
                                          horizontal: 8.0),
                                      child: DropdownButton<AreaData>(
                                        value: model.selectedAreaData,
                                        hint: const Text('Select a area'),
                                        items: model.areaDataList
                                            .map<DropdownMenuItem<AreaData>>(
                                                (AreaData value) {
                                          return DropdownMenuItem<AreaData>(
                                            value: value,
                                            child: Text(value.name ?? ""),
                                          );
                                        }).toList(),
                                        onChanged: (AreaData? newValue) {
                                          setState(() {
                                            model.selectedAreaData = newValue!;
                                          });

                                          // if (model.selectedFloorValue != null &&
                                          //     model.selectedCategoryValue !=
                                          //         null &&
                                          //     model.selectedFloorValue !=
                                          //         null &&
                                          //     roomiteNumberController
                                          //         .text.isNotEmpty) {
                                          //   model.getData(
                                          //       categoryId: model
                                          //           .selectedCategoryValue!
                                          //           .categoryId
                                          //           .toString(),
                                          //       floorId: model
                                          //           .selectedFloorValue!.id
                                          //           .toString(),
                                          //       areaId: model
                                          //           .selectedAreaData!.id
                                          //           .toString(),
                                          //       areaNumber:
                                          //           roomiteNumberController
                                          //               .text);
                                          // }
                                        },
                                        isDense: true,
                                      ),
                                    ),
                                  ),
                                ),
                              ],
                            ),
                            const SizedBox(height: 15),
                            Column(
                              crossAxisAlignment: CrossAxisAlignment.start,
                              children: [
                                Text(
                                  'Area number',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                                const SizedBox(height: 5),
                                TextFormField(
                                  controller: roomiteNumberController,
                                  textInputAction: TextInputAction.next,
                                  obscureText: false,
                                  onChanged: (value) {
                                    // if (model.selectedFloorValue != null &&
                                    //     model.selectedCategoryValue != null &&
                                    //     model.selectedFloorValue != null &&
                                    //     roomiteNumberController
                                    //         .text.isNotEmpty) {
                                    //   model.getData(
                                    //       categoryId: model
                                    //           .selectedCategoryValue!.categoryId
                                    //           .toString(),
                                    //       floorId: model.selectedFloorValue!.id
                                    //           .toString(),
                                    //       areaId: model.selectedAreaData!.id
                                    //           .toString(),
                                    //       areaNumber:
                                    //           roomiteNumberController.text);
                                    // }
                                  },
                                  // validator: (value) {
                                  //   if (value!.isEmpty) {
                                  //     return "Please Enter Password";
                                  //   }
                                  //   return null;
                                  // },
                                  decoration: InputDecoration(
                                    fillColor: FlutterFlowTheme.of(context)
                                        .primaryBtnText,
                                    filled: true,
                                    hintText: 'Enter ruimte',
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
                            const SizedBox(height: 15),
                            Align(
                              alignment: Alignment.topLeft,
                              child: Text(
                                'TEL-ELEMENTEN',
                                style: FlutterFlowTheme.of(context)
                                    .bodyText1
                                    .override(
                                      fontFamily: 'Roboto',
                                      fontSize: 18,
                                      fontWeight: FontWeight.w500,
                                    ),
                              ),
                            ),
                            const SizedBox(height: 5),
                            TextFormField(
                              controller: telElementController,
                              textInputAction: TextInputAction.next,
                              inputFormatters: [
                                FilteringTextInputFormatter.allow(
                                    RegExp(r'^[0-9]+$'))
                              ],
                              keyboardType: TextInputType.number,
                              decoration: InputDecoration(
                                fillColor:
                                    FlutterFlowTheme.of(context).primaryBtnText,
                                filled: true,
                                hintText: 'Enter telelementen',
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
                                focusedErrorBorder: const UnderlineInputBorder(
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
                            ),
                            Visibility(
                                visible: model.dataList.isNotEmpty,
                                child: const SizedBox(height: 15)),
                            Visibility(
                              visible: model.dataList.isNotEmpty,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'FOUTEN',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            Visibility(
                                visible: model.dataList.isNotEmpty,
                                child: const SizedBox(height: 5)),
                            Visibility(
                              visible: model.dataList.isNotEmpty,
                              child: TextFormField(
                                controller: model.mistakesController,
                                readOnly: true,
                                decoration: InputDecoration(
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  filled: true,
                                  hintText: 'Enter telelementen',
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
                            ),
                            Visibility(
                                visible: model.dataList.isNotEmpty,
                                child: const SizedBox(height: 15)),
                            Visibility(
                              visible: model.dataList.isNotEmpty,
                              child: Align(
                                alignment: Alignment.topLeft,
                                child: Text(
                                  'OPMERKINGEN',
                                  style: FlutterFlowTheme.of(context)
                                      .bodyText1
                                      .override(
                                        fontFamily: 'Roboto',
                                        fontSize: 18,
                                        fontWeight: FontWeight.w500,
                                      ),
                                ),
                              ),
                            ),
                            Visibility(
                                visible: model.dataList.isNotEmpty,
                                child: const SizedBox(height: 5)),
                            Visibility(
                              visible: model.dataList.isNotEmpty,
                              child: TextFormField(
                                controller: remarkController,
                                decoration: InputDecoration(
                                  fillColor: FlutterFlowTheme.of(context)
                                      .primaryBtnText,
                                  filled: true,
                                  hintText: 'Remarks',
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
                            ),
                            const SizedBox(height: 40),
                            MaterialButton(
                              minWidth: double.infinity,
                              height: 50,
                              color: const Color(0xFF936CC8),
                              onPressed: () async {
                                if (model.selectedCategoryValue == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Please select category'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                } else if (model.selectedFloorValue == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Please select floor'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                } else if (model.selectedAreaData == null) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text('Please select area'),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                } else if (roomiteNumberController
                                    .text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content:
                                          Text("area number can't be empty"),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                } else if (telElementController.text.isEmpty) {
                                  ScaffoldMessenger.of(context).showSnackBar(
                                    const SnackBar(
                                      content: Text(
                                          "tel element number can't be empty"),
                                      duration: Duration(seconds: 2),
                                    ),
                                  );
                                } else {
                                  model.getLocalData(
                                      floorId:
                                          model.selectedFloorValue?.id ?? "",
                                      categoryId: model.selectedCategoryValue
                                              ?.categoryId ??
                                          "",
                                      areaNumber: roomiteNumberController.text,
                                      areaId: model.selectedAreaData!.id
                                          .toString());

                                  Navigator.push(
                                      context,
                                      MaterialPageRoute(
                                          builder: (context) => ListOfErrorPage(
                                            dataList:model.dataList,
                                                auditId: widget.auditId,
                                                areaId: (model.selectedAreaData
                                                            ?.id ??
                                                        "")
                                                    .toString(),
                                                floorValueId: model
                                                        .selectedFloorValue
                                                        ?.id ??
                                                    "",
                                                floorName: model
                                                        .selectedFloorValue
                                                        ?.floorName ??
                                                    "",
                                                categoryId: model
                                                        .selectedCategoryValue
                                                        ?.categoryId ??
                                                    "",
                                                areaName: model.selectedAreaData
                                                        ?.name ??
                                                    "",
                                                categoryName: model
                                                        .selectedCategoryValue
                                                        ?.categoryName ??
                                                    "",
                                                areaNumber:
                                                    roomiteNumberController
                                                        .text,
                                                telElement:
                                                    telElementController.text,
                                              ))).then((value) {
                                    if (value != null) {
                                      model.updateErrorValue(value);
                                    }
                                  });
                                }
                              },
                              child: Text('Audit Formulieren'.toUpperCase(),
                                  style: const TextStyle(color: Colors.white)),
                            ),
                            Visibility(
                              visible: model.dataList.isNotEmpty,
                              child: Padding(
                                padding: const EdgeInsets.only(top: 20),
                                child: MaterialButton(
                                  minWidth: double.infinity,
                                  height: 50,
                                  color: Colors.green,
                                  onPressed: () async {
                                    if (remarkController.text.isEmpty) {
                                      ScaffoldMessenger.of(context)
                                          .showSnackBar(
                                        const SnackBar(
                                          content: Text(
                                              "remark field can't be empty"),
                                          duration: Duration(seconds: 2),
                                        ),
                                      );
                                    } else {
                                      model.saveAuditData();
                                    }

                                    // model.generateRandomString();
                                    // MyDataModel myDataModel = MyDataModel(
                                    //   id: 1,
                                    //   element: 'Example element',
                                    //   foutsoort: 'Example foutsoort',
                                    //   aantal: 5,
                                    //   logboekImage: 'Example logboek image',
                                    //   logboekText: 'Example logboek text',
                                    //   technischeImage: 'Example technische image',
                                    //   technischeText: 'Example technische text',
                                    //   categoryId: 2,
                                    //   floor: 3,
                                    //   area: 40.5,
                                    //   auditId: 10,
                                    // );

                                    // DatabaseHelper dbHelper = DatabaseHelper();
                                    //
                                    // await dbHelper.insertData(
                                    //   myDataModel.id,
                                    //   myDataModel.element,
                                    //   myDataModel.foutsoort,
                                    //   myDataModel.aantal,
                                    //   myDataModel.logboekImage,
                                    //   myDataModel.logboekText,
                                    //   myDataModel.technischeImage,
                                    //   myDataModel.technischeText,
                                    //   myDataModel.categoryId,
                                    //   myDataModel.floor,
                                    //   myDataModel.area,
                                    //   myDataModel.auditId,
                                    // );
                                  },
                                  child: Text('OPSLAAN'.toUpperCase(),
                                      style:
                                          const TextStyle(color: Colors.white)),
                                ),
                              ),
                            )
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            );
          }),
        ),
      ),
    );
  }
}
