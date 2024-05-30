import 'package:client_dlaw/common/style.dart';
import 'package:client_dlaw/data/api/api_services.dart';
import 'package:client_dlaw/data/model/models.dart';
import 'package:client_dlaw/provider/detail_case_provider.dart';
import 'package:client_dlaw/utils/result_state.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:provider/provider.dart';

class CaseDetailPage extends StatefulWidget {
  static const routeName = '/case_detail';

  final Case kasus;

  const CaseDetailPage({super.key, required this.kasus});

  @override
  State<CaseDetailPage> createState() => _KasusDetailPageState();
}

class _KasusDetailPageState extends State<CaseDetailPage> {
  bool isExpanded = false;
  bool isHeroLoaded = false;

  @override
  void initState() {
    super.initState();
    Future.delayed(const Duration(milliseconds: 500), () {
      setState(() {
        isHeroLoaded = true;
      });
    });
  }

  Widget _buildAppBar({List<Widget>? actions}) {
    return SliverAppBar(
      pinned: false,
      automaticallyImplyLeading: false,
      expandedHeight: 200,
      backgroundColor: Theme.of(context).scaffoldBackgroundColor,
      flexibleSpace: Positioned.fill(
        child: FlexibleSpaceBar(
          background: Hero(
            tag: widget.kasus.lawyer.user.id,
            child: ClipRRect(
                child: Image.network(
              widget.kasus.lawyer.user.profilePicture ?? '',
              fit: BoxFit.cover,
              loadingBuilder: (_, child, loadingProgress) {
                if (loadingProgress == null) {
                  return child;
                }
                return const Center(
                  child: CircularProgressIndicator(
                    color: grey,
                  ),
                );
              },
              errorBuilder: (_, __, ___) {
                return const Icon(
                  Icons.broken_image,
                  color: grey,
                  size: 100,
                );
              },
            )),
          ),
        ),
      ),
      actions: actions,
    );
  }

  Widget _buildBody(Case kasus) {
    return SingleChildScrollView(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  kasus.subject,
                  style: textTheme.headlineSmall!.copyWith(
                    fontWeight: FontWeight.bold,
                  ),
                ),
                Text(
                  kasus.lawyer.user.fullname,
                ),
                SizedBox(height: 16),
                Padding(
                  padding: const EdgeInsets.only(left: 3, top: 5, right: 15),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Hourly Fee'),
                          Text(
                            '\$${(kasus.lawyer.pricePerHour * kasus.hour).toString()}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text('Additional Fee'),
                          Text(
                            '\$${kasus.additionFee.toString()}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                      const SizedBox(height: 4),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceBetween,
                        children: [
                          const Text(
                            'Total',
                            style: TextStyle(
                              fontWeight: FontWeight.bold,
                            ),
                          ),
                          Text(
                            '\$${((kasus.lawyer.pricePerHour * kasus.hour) + kasus.additionFee).toString()}',
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),
                    ],
                  ),
                ),
                const SizedBox(height: 4),
                const SizedBox(height: 8),
                Container(
                  margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: grey,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Notes',
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Text(
                  kasus.notes,
                  style: textTheme.bodyMedium,
                  maxLines: isExpanded ? 100 : 2,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 10),
                TextButton(
                  onPressed: () {
                    setState(() {
                      isExpanded = !isExpanded;
                    });
                  },
                  child: Text(
                    isExpanded ? 'Show Less' : 'Show More',
                    style: const TextStyle(
                      color: backgroundColor1,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                ),
                Container(
                  margin: const EdgeInsets.only(top: 20.0, bottom: 20.0),
                  decoration: const ShapeDecoration(
                    shape: RoundedRectangleBorder(
                      side: BorderSide(
                        width: 1,
                        strokeAlign: BorderSide.strokeAlignCenter,
                        color: grey,
                      ),
                    ),
                  ),
                ),
                Text(
                  'Media',
                  style: textTheme.titleLarge,
                ),
                const SizedBox(height: 8),
                Center(
                  child: Text(
                    'No media attached',
                    style: TextStyle(
                      color: grey,
                    ),
                  ),
                ),
                const SizedBox(height: 45),
                SizedBox(
                    width: double.infinity,
                    height: 45,
                    child: Container(
                        margin: const EdgeInsets.symmetric(
                            vertical: 0, horizontal: 50),
                        child: OutlinedButton(
                          onPressed: () {},
                          style: OutlinedButton.styleFrom(
                            side:
                                const BorderSide(width: 1.0, color: Colors.red),
                            shape: RoundedRectangleBorder(
                              borderRadius: BorderRadius.circular(10.0),
                            ),
                          ),
                          child: const Text("Hapus Kasus",
                              style: TextStyle(color: Colors.red)),
                        ))),
                const SizedBox(
                  height: 100,
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider<DetailCaseProvider>(
      create: (_) => DetailCaseProvider(
        apiServices: ApiServices(),
        id: widget.kasus.id,
      ),
      child: Stack(children: [
        Scaffold(
          floatingActionButton: FloatingActionButton(
            backgroundColor: backgroundColor1,
            onPressed: () {
              Navigator.pushNamed(context, '/contact',
                  arguments: widget.kasus.lawyer.user.phoneNumber);
            },
            child: const Icon(
              Icons.chat_rounded,
              color: white,
            ),
          ),
          body: CustomScrollView(
            slivers: [
              _buildAppBar(),
              SliverToBoxAdapter(
                child: Consumer<DetailCaseProvider>(
                  builder: (context, value, _) {
                    if (value.state == ResultState.loading) {
                      return const Center(
                        heightFactor: 10,
                        child: CircularProgressIndicator(),
                      );
                    } else if (value.state == ResultState.hasData) {
                      return _buildBody(value.result.caseDetails);
                    } else if (value.state == ResultState.noData) {
                      return Center(
                        child: Text(value.message),
                      );
                    } else if (value.state == ResultState.error) {
                      return Center(
                        child: Text(value.message),
                      );
                    } else {
                      return const Center(
                        child: Text(''),
                      );
                    }
                  },
                ),
              ),
            ],
          ),
        ),
        Positioned(
          top: 15,
          left: 15,
          child: SafeArea(
            child: Opacity(
              opacity: isHeroLoaded ? 1 : 0,
              child: CircleAvatar(
                backgroundColor: Colors.black.withOpacity(0.5),
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.white,
                  ),
                  onPressed: () {
                    Navigator.pop(context);
                  },
                ),
              ),
            ),
          ),
        ),
      ]),
    );
  }
}
