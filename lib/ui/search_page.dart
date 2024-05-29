import 'package:client_dlaw/common/navigation.dart';
import 'package:client_dlaw/provider/search_lawyer_provider.dart';
import 'package:client_dlaw/ui/auth/login_screen.dart';
import 'package:client_dlaw/ui/home/home.dart';
import 'package:client_dlaw/utils/result_state.dart';
import 'package:client_dlaw/widgets/card_lawyer.dart';
import 'package:client_dlaw/widgets/platform_widget.dart';
import 'package:client_dlaw/widgets/search_text_field.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class SearchPage extends StatefulWidget {
  static const routeName = '/search';
  static const String searchTitle = 'Search';

  const SearchPage({super.key});

  @override
  State<SearchPage> createState() => _SearchPageState();
}

class _SearchPageState extends State<SearchPage> {
  var searchQuery = '';
  void onProfileButtonPressed() {
    Navigator.pushNamed(context, LoginScreen.routeName);
  }

  void onNotificationButtonPressed() {
    Navigator.pushNamed(context, Home.routeName);
  }

  Widget _buildSearchTextField() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Consumer<SearchLawyersProvider>(
        builder: (context, state, _) {
          return Hero(
            tag: SearchPage.routeName,
            child: SearchTextField(
              readOnly: false,
              autoFocus: true,
              onChanged: (text) {
                if (text.isNotEmpty) {
                  setState(() {
                    state.searchLawyers(text);
                  });
                }
              },
            ),
          );
        },
      ),
    );
  }

  Widget _buildList() {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16.0),
      child: Consumer<SearchLawyersProvider>(
        builder: (context, state, _) {
          if (state.state == ResultState.loading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state.state == ResultState.hasData) {
            return ListView.builder(
              itemCount: state.result.lawyers.length,
              itemBuilder: (context, index) {
                return Padding(
                  padding: EdgeInsets.only(top: index == 0 ? 12.0 : 0.0),
                  child: CardLawyer(lawyer: state.result.lawyers[index]),
                );
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
              onPressed: () {
                onProfileButtonPressed();
              },
              icon: const Icon(Icons.person_2_outlined)),
          IconButton(
            onPressed: () {
              onNotificationButtonPressed();
            },
            icon: const Icon(Icons.notifications_none_outlined),
          )
        ],
      ),
      body: SafeArea(
        child: Column(
          children: [
            const SizedBox(height: 12.0),
            _buildSearchTextField(),
            Expanded(
              child: _buildList(),
            ),
          ],
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
        child: Column(
          children: [
            const SizedBox(height: 12.0),
            _buildSearchTextField(),
            Expanded(
              child: _buildList(),
            ),
          ],
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
