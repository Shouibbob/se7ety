import 'package:flutter/material.dart';
import 'package:gap/gap.dart';
import 'package:se7ety/core/utils/colors.dart';
import 'package:se7ety/core/utils/text_style.dart';
import 'package:se7ety/feature/patient/search/presentation/widgets/search_list.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

class _SearchViewState extends State<SearchView> {
  //final TextEditingController _textController = TextEditingController();
  String search = '';
  //int _length = 0;

  // @override
  // void initState() {
  //   super.initState();
  //   search = _textController.text;
  //   _length = search.length;
  // }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text(
          'ابحث عن دكتور',
        ),
      ),
      body: Padding(
        padding: const EdgeInsets.all(20),
        child: Column(
          children: [
            Container(
              height: 55,
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(25)),
                boxShadow: [
                  BoxShadow(
                    color: Colors.grey.withOpacity(.3),
                    blurRadius: 15,
                    offset: const Offset(5, 5),
                  )
                ],
              ),
              child: TextFormField(
                onChanged: (searchkey) {
                  setState(() {
                    search = searchkey;
                    // _length = search.length;
                  });
                },
                decoration: InputDecoration(
                  hintText: 'البحث',
                  hintStyle: getBodyStyle(),
                  suffixIcon: const SizedBox(
                    width: 50,
                    child: Icon(
                      Icons.search,
                      color: AppColors.primaryColor,
                    ),
                  ),
                ),
              ),
            ),
            const Gap(15),
            Expanded(
              child: Container(
                child:
                    //_length == 0
                    //     ? Center(
                    //         child: SingleChildScrollView(
                    //           physics: const BouncingScrollPhysics(),
                    //           child: Column(
                    //             mainAxisAlignment: MainAxisAlignment.center,
                    //             children: [
                    //               TextButton(
                    //                 onPressed: () {
                    //                   setState(() {
                    //                     _length = 1;
                    //                   });
                    //                 },
                    //                 child: Text(
                    //                   'عرض كل الدكاترة',
                    //                   style: getTitleStyle(),
                    //                 ),
                    //               ),
                    //               SvgPicture.asset(
                    //                 'assets/images/no-search.svg',
                    //                 width: 250,
                    //               ),
                    //             ],
                    //           ),
                    //         ),
                    //       )
                    //     :
                    SearchList(
                  searchKey: search,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
