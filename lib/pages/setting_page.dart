import 'package:FdisTesting/providers/setting_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

import '../widgets/flutter_flow_theme.dart';

class SettingPage extends StatefulWidget {
  const SettingPage({Key? key}) : super(key: key);

  @override
  State<SettingPage> createState() => _SettingPageState();
}

class _SettingPageState extends State<SettingPage> {
  @override
  void initState() {
    Provider.of<SettingProvider>(context, listen: false).fetchSettingData();

    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Consumer<SettingProvider>(builder: (context, data, child) {
      return Scaffold(
          backgroundColor: const Color(0xFFe2f0fc),
          appBar: AppBar(
            backgroundColor: Colors.white,
            leadingWidth: 150,
            leading: Row(
              mainAxisSize: MainAxisSize.max,
              children: [
                const Icon(
                  Icons.arrow_back_ios_sharp,
                  color: Color(0xFF3679C6),
                  size: 24,
                ),
                Text(
                  'Back',
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: const Color(0xFF3679C6),
                        fontSize: 18,
                        fontWeight: FontWeight.w300,
                      ),
                ),
              ],
            ),
            title: Text(
              'Settings',
              style: FlutterFlowTheme.of(context).bodyText1.override(
                    fontFamily: 'Poppins',
                    fontSize: 22,
                    fontWeight: FontWeight.w600,
                  ),
            ),
            actions: [
              Row(
                mainAxisSize: MainAxisSize.max,
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  SelectionArea(
                      child: Text(
                    'LOGOUT',
                    style: FlutterFlowTheme.of(context).bodyText1.override(
                          fontFamily: 'Poppins',
                          color: const Color(0xFF3679C6),
                          fontSize: 16,
                        ),
                  )),
                  const SizedBox(width: 10),
                  const Icon(
                    Icons.logout,
                    color: Color(0xFFDB3636),
                    size: 30,
                  ),
                ],
              )
            ],
          ),
          body: Column(
            mainAxisSize: MainAxisSize.max,
            children: [
              Expanded(
                child: Column(
                  mainAxisSize: MainAxisSize.max,
                  crossAxisAlignment: CrossAxisAlignment.stretch,
                  children: [
                    Column(
                      children: [
                        const SizedBox(height: 20),
                        Stack(
                          children: [
                            Align(
                              alignment: const AlignmentDirectional(0, 0),
                              child: CircleAvatar(
                                maxRadius: 50,
                                backgroundImage: data.userProfileModel.data
                                            ?.first.profileImage ==
                                        null
                                    ? null
                                    : NetworkImage(
                                        data.userProfileModel.data?.first
                                            .profileImage,
                                      ),
                              ),
                            ),
                            const Positioned(
                              bottom: 0,
                              right: 145,
                              child: CircleAvatar(
                                  radius: 15,
                                  backgroundColor: Colors.white,
                                  child: Center(child: Icon(Icons.edit_note))),
                            ),
                          ],
                        ),
                        const SizedBox(height: 20),
                        Text(
                          data.userProfileModel.data?.first.userName ?? "",
                          style: FlutterFlowTheme.of(context)
                              .bodyText1
                              .override(
                                fontFamily: 'Poppins',
                                color:
                                    FlutterFlowTheme.of(context).secondaryText,
                                fontSize: 22,
                                fontWeight: FontWeight.w500,
                              ),
                        ),
                        const SizedBox(height: 20),
                        Padding(
                          padding: const EdgeInsets.symmetric(horizontal: 20),
                          child: Column(
                            children: [
                              customContainer(
                                  key: "AUDITS EXCECUTED", value: "12"),
                              const SizedBox(height: 10),
                              customContainer(
                                  key: "LAST CLIENT :", value: "DAVV"),
                              const SizedBox(height: 10),
                              customContainer(
                                  key: "LAST LOCATION VISITED",
                                  value: "Locatie A"),
                            ],
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
            ],
          ));
    });
  }

  Widget customContainer({required String key, required String value}) {
    return Container(
      height: 50,
      decoration: BoxDecoration(
          color: Colors.white, borderRadius: BorderRadius.circular(30)),
      child: Row(
        children: [
          Expanded(
            flex: 7,
            child: Padding(
              padding: const EdgeInsets.only(left: 20),
              child: Text(
                '$key :',
                style: FlutterFlowTheme.of(context).bodyText1.override(
                      fontFamily: 'Roboto',
                      color: FlutterFlowTheme.of(context).secondaryText,
                      fontSize: 18,
                      fontWeight: FontWeight.w500,
                    ),
              ),
            ),
          ),
          Expanded(
            flex: 3,
            child: Container(
              decoration: BoxDecoration(
                color: const Color(0xFFB1D3E8),
                borderRadius: BorderRadius.circular(25),
              ),
              child: Center(
                child: Text(
                  value,
                  style: FlutterFlowTheme.of(context).bodyText1.override(
                        fontFamily: 'Poppins',
                        color: FlutterFlowTheme.of(context).secondaryText,
                        fontSize: 20,
                        fontWeight: FontWeight.normal,
                      ),
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
