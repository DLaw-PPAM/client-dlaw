import 'package:client_dlaw/common/navigation.dart';
import 'package:client_dlaw/provider/case_provider.dart';
import 'package:client_dlaw/ui/search_page.dart';
import 'package:client_dlaw/utils/result_state.dart';
import 'package:client_dlaw/widgets/card_case.dart';
import 'package:client_dlaw/widgets/platform_widget.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CasePage extends StatelessWidget {
  static const String routeName = '/case';

  const CasePage({super.key});

  Widget _buildList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 20.0,),
      child: Consumer<CasesProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.state == ResultState.hasData) {
            return ListView.builder(
              itemCount: state.result.cases.length,
              itemBuilder: (context, index) {
                return Padding(
                    padding: const EdgeInsets.only(top: 10),
                    child: CardCase(
                      cases: state.result.cases[index],
                    ));
              },
            );
          } else if (state.state == ResultState.noData) {
            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Material(
                child: Text(state.message),
              ),
            );
          } else if (state.state == ResultState.error) {
            return Padding(
              padding: const EdgeInsets.only(top: 16),
              child: Material(
                child: Text(state.message),
              ),
            );
          } else {
            return const Center(child: Text(''));
          }
        },
      ),
    );
  }

  Widget _buildAndroid(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        leading: null,
        automaticallyImplyLeading: false,
        actions: [
          IconButton(
              onPressed: () {}, icon: const Icon(Icons.person_2_outlined)),
          IconButton(
            onPressed: () {},
            icon: const Icon(Icons.notifications_none_outlined),
          )
        ],
      ),
      body: SafeArea(
        child: Expanded(
          child: _buildList(),
        ),
      ),
    );
  }

  Widget _buildIos(BuildContext context) {
    return CupertinoPageScaffold(
      navigationBar: CupertinoNavigationBar(
        transitionBetweenRoutes: false,
        border: const Border(bottom: BorderSide(color: Colors.transparent)),
        backgroundColor: Theme.of(context).scaffoldBackgroundColor,
        leading: Row(
          children: [
            CupertinoNavigationBarBackButton(
              color: Theme.of(context).primaryColor,
              onPressed: () => Navigation.back(),
            ),
            Text(
              SearchPage.searchTitle,
              style: Theme.of(context).textTheme.headline6,
            ),
          ],
        ),
      ),
      child: SafeArea(
        child: Expanded(
          child: _buildList(),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return PlatformWidget(
      androidBuilder: _buildAndroid,
      iosBuilder: _buildIos,
    );
  }
}
