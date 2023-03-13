import 'package:FdisTesting/models/list_of_error_provider.dart';
import 'package:FdisTesting/models/store_data_model.dart';
import 'package:FdisTesting/pages/create_error_page.dart';
import 'package:FdisTesting/widgets/flutter_flow_theme.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class ListOfErrorPage extends StatefulWidget {
  final String categoryId;
  final String floorValueId;
  final String floorName;
  final String areaId;
  final String areaName;
  final String categoryName;
  final String areaNumber;
  final String telElement;
  final String auditId;
  final List<EntryData> dataList;

  const ListOfErrorPage(
      {Key? key,
      required this.categoryId,
      required this.floorValueId,
      required this.floorName,
      required this.areaId,
      required this.areaName,
      required this.categoryName,
      required this.areaNumber,
      required this.telElement,
        required this.auditId,
        required this.dataList})
      : super(key: key);

  @override
  State<ListOfErrorPage> createState() => _ListOfErrorPageState();
}

class _ListOfErrorPageState extends State<ListOfErrorPage> {
  late ListOfErrorProvider listOfErrorProvider;

  @override
  void initState() {
    super.initState();
    listOfErrorProvider = ListOfErrorProvider();
    listOfErrorProvider.list = widget.dataList;
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<ListOfErrorProvider>(
      create: (context) => listOfErrorProvider,
      child: Consumer<ListOfErrorProvider>(builder: (context, model, _) {
        return Scaffold(
          appBar: AppBar(
            elevation: 0,
            backgroundColor: FlutterFlowTheme.of(context).secondaryBackground,
            centerTitle: true,
            actions: [
              InkWell(
                onTap: () {
                  debugPrint("check category id ----- ${widget.categoryId}");
                  Navigator.push(
                      context,
                      MaterialPageRoute(
                          builder: (context) => CreateErrorPage(
                                auditId:widget.auditId,
                                categoryId: widget.categoryId,
                                areaId: widget.areaId,
                                floorValueId: widget.floorValueId,
                                floorName: widget.floorName,
                                areaName: widget.areaName,
                                categoryName: widget.categoryName,
                                areaNumber: widget.areaNumber,
                                telElement: widget.telElement,
                              ))).then((value) {
                    if (value != null) {

                      model.addData(value);



                      for (EntryData entryData in value) {
                        print("id: ${entryData.id}");
                        print("auditId: ${entryData.auditId}");
                        print("categoryId: ${entryData.categoryId}");
                        print("category: ${entryData.category}");
                        print("floor: ${entryData.floor}");
                        print("floorId: ${entryData.floorId}");
                        print("area: ${entryData.area}");
                        print("areaId: ${entryData.areaId}");
                        print("areaNumber: ${entryData.areaNumber}");
                        print("telElement: ${entryData.telElement}");
                        print("element: ${entryData.element}");
                        print("elementId: ${entryData.elementId}");
                        print("foutSoort: ${entryData.foutSoort}");
                        print("foutSoortId: ${entryData.foutSoortId}");
                        print("aantal: ${entryData.aantal}");
                        print("logboekImage: ${entryData.logboekImage}");
                        print("logboekText: ${entryData.logboekText}");
                        print("technischeImage: ${entryData.technischeImage}");
                        print("technischeText: ${entryData.technischeText}");
                        print("errorCount: ${entryData.errorCount}");
                      }


                    }
                  });
                },
                child: const Icon(
                  Icons.add_box_outlined,
                  color: Colors.blue,
                ),
              ),
              const SizedBox(width: 10),
            ],
            title: Text(
              'Lijst fout',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Nunito',
                    fontSize: 20,
                    fontWeight: FontWeight.normal,
                  ),
            ),
            leadingWidth: 150,
            leading: InkWell(
              onTap: () async {
                if (model.list.isNotEmpty) {
                  Navigator.pop(context, model.list);
                } else {
                  Navigator.pop(context);
                }
              },
              child: Row(
                mainAxisSize: MainAxisSize.max,
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
          body: SizedBox(
            height: MediaQuery.of(context).size.height,
            width: MediaQuery.of(context).size.width,
            child: model.list.isEmpty
                ? const Center(child: Text("No error found"))
                : ListView.separated(
                    shrinkWrap: true,
                    itemCount: model.list.length,
                    itemBuilder: (context, index) => Padding(
                      padding: const EdgeInsets.symmetric(horizontal: 10),
                      child: ListTile(
                        onTap: () {
                          // Navigator.push(
                          //   context,
                          //   MaterialPageRoute(
                          //     builder: (context) => CreateErrorPage(
                          //         categoryId: widget.categoryId),
                          //   ),
                          // ).then((value) {
                          //   if (value != null) {
                          //     model.addData(value);
                          //   }
                          // });
                        },
                        title: Text(model.list[index].element ?? ""),
                        subtitle: Text(model.list[index].foutSoort ?? ""),
                        trailing: InkWell(
                            onTap: () {
                              model.removeItem(index);
                            },
                            child: const CircleAvatar(
                                radius: 13, child: Icon(Icons.close))),
                      ),
                    ),
                    separatorBuilder: (BuildContext context, int index) {
                      return const Divider(
                        height: 1,
                        color: Colors.grey,
                      );
                    },
                  ),
          ),
        );
      }),
    );
  }
}
