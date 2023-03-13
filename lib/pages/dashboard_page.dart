import 'package:FdisTesting/pages/audit_list_page.dart';
import 'package:FdisTesting/providers/client_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class DashboardPage extends StatefulWidget {
  const DashboardPage({super.key});

  @override
  State<DashboardPage> createState() => _DashboardPageState();
}

class _DashboardPageState extends State<DashboardPage>
    with SingleTickerProviderStateMixin {
  late AnimationController animationController;
  late Animation<double> rotationAnimation;

  @override
  void initState() {
    Provider.of<ClientProvider>(context, listen: false).fetchClientList();
    super.initState();

    animationController = AnimationController(
      vsync: this,
      duration: const Duration(milliseconds: 500),
    );

    rotationAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(animationController);
  }

  @override
  void dispose() {
    animationController.dispose();
    super.dispose();
  }

  Future<void> _handleRefresh() async {
    try {
      Provider.of<ClientProvider>(context, listen: false).changeState();
      animationController.forward(from: 0.0);
      await Provider.of<ClientProvider>(context, listen: false)
          .fetchClientList();
    } catch (error) {
      debugPrint(error.toString());
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
            backgroundColor: Colors.grey,
            leading: const Padding(
              padding: EdgeInsets.only(left: 10),
              child: CircleAvatar(
                backgroundColor: Colors.white70,
                backgroundImage: NetworkImage(
                    "https://i.pravatar.cc/150?u=a042581f4e29026704d"),
              ),
            ),
            actions: [
              IconButton(
                onPressed: _handleRefresh,
                icon: RotationTransition(
                  turns: rotationAnimation,
                  child: const Icon(Icons.refresh),
                ),
              ),
              const SizedBox(width: 8)
            ],
            leadingWidth: 55,
            centerTitle: true,
            title: const Text(
              'Opdrachtgever',
              style: TextStyle(
                color: Colors.black,
              ),
            )),
        body: FutureBuilder(
          future: Future.value(true),
          builder: (context, snapshot) {
            if (snapshot.hasData) {
              return Consumer<ClientProvider>(
                builder: (context, data, child) {
                  return data.clientModel == null
                      ? const Center(child: CircularProgressIndicator())
                      : data.clientModel!.data!.isEmpty
                      ? const Center(
                    child: Text("No data found"),
                  )
                      :
                  ListView.builder(
                    itemCount: data.clientModel?.data?.length,
                    itemBuilder: (context, index) {
                      return InkWell(
                                  onTap: () {
                                    Navigator.push(
                                        context,
                                        MaterialPageRoute(
                                            builder: (context) => AuditListPage(
                                                companyName: data.clientModel!
                                                    .data![index].companyName!,
                                                clientId: data.clientModel!
                                                        .data![index].id
                                                        .toString() ??
                                                    "")));
                                  },
                                  child: Container(
                                    margin: const EdgeInsets.symmetric(
                                        vertical: 10, horizontal: 20),
                                    decoration: BoxDecoration(
                                        color: const Color(0xffe6e8f6),
                                        borderRadius:
                                            BorderRadius.circular(10)),
                                    child: ListTile(
                                      trailing: const Icon(
                                        Icons.arrow_forward_ios_outlined,
                                        color: Color(0xff444546),
                                        size: 18,
                                      ),
                                      title: Text(data.clientModel!.data?[index]
                                              .companyName ??
                                          ""),
                                    ),
                                  ),
                                );
                    },
                  );
                },
              );
            } else {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
          },
        ));
  }
}
