import 'package:flutter/material.dart';
import 'package:quran_finder_apps/cores/configuration/colors_manager.dart';

class CustomAppBar extends StatelessWidget {
  const CustomAppBar({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return SliverAppBar(
      expandedHeight: MediaQuery.of(context).size.height / 6,
      title: Text(
        "Quran Finder Apps",
        style: Theme.of(context).textTheme.bodyLarge!.copyWith(
              fontWeight: FontWeight.bold,
            ),
      ),
      flexibleSpace: FlexibleSpaceBar(
        centerTitle: true,
        background: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // SEARCH BAR
                SizedBox(
                  width: MediaQuery.of(context).size.width / 1.8,
                  child: TextField(
                    autofocus: false,
                    decoration: InputDecoration(
                      hintText: "Find Surah...",
                      filled: true,
                      fillColor: const Color(0xFFf6faff),
                      prefixIcon: IconButton(
                        onPressed: () {},
                        icon: const Icon(Icons.search),
                      ),
                      border: const OutlineInputBorder(
                        borderSide: BorderSide.none,
                        borderRadius: BorderRadius.all(
                          Radius.circular(10),
                        ),
                      ),
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                // FILTER
                CircleAvatar(
                  backgroundColor: const Color(0xFFf6faff),
                  radius: 30,
                  child: IconButton(
                    onPressed: () {
                      showModalBottomSheet<void>(
                        context: context,
                        builder: (context) {
                          return SizedBox(
                            height: 200,
                            child: Container(
                              margin:
                                  const EdgeInsets.symmetric(horizontal: 10),
                              child: Column(
                                mainAxisAlignment:
                                    MainAxisAlignment.spaceBetween,
                                children: [
                                  // TITLE
                                  Row(
                                    mainAxisAlignment:
                                        MainAxisAlignment.spaceBetween,
                                    children: [
                                      Text("Filter"),
                                      IconButton(
                                        onPressed: () {},
                                        icon: const Icon(Icons.close),
                                      ),
                                    ],
                                  ),
                                ],
                              ),
                            ),
                          );
                        },
                      );
                    },
                    color: ColorsManager.blackColor,
                    icon: const Icon(
                      Icons.format_list_bulleted_rounded,
                    ),
                  ),
                ),
                const SizedBox(width: 10),

                // SEARCH BUTTON
                CircleAvatar(
                  backgroundColor: const Color(0xFFf6faff),
                  radius: 30,
                  child: IconButton(
                    onPressed: () {},
                    color: ColorsManager.blackColor,
                    icon: const Icon(Icons.search),
                  ),
                ),
              ],
            ),
            const SizedBox(height: 20),
          ],
        ),
      ),
    );
  }
}
