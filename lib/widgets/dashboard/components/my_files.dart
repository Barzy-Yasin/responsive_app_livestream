import 'package:flutter/material.dart';
import 'package:responsive_app_livestream/util/responsive.dart';

import '../../../constant/constants.dart';
import '../../../data/cloud_storage_data.dart';
import 'file_info_card.dart';

class MyFiles extends StatelessWidget {
  const MyFiles({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final double width = MediaQuery.of(context).size.width;
    return Column(
      children: [
        Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Text(
              "My Files",
              style: Theme.of(context).textTheme.titleMedium,
            ),
            ElevatedButton.icon(
              style: TextButton.styleFrom(
                padding: EdgeInsets.symmetric(
                  horizontal: defaultPadding * 1.5,
                  vertical:
                      defaultPadding / (Responsive.isMobile(context) ? 2 : 1),
                ),
              ),
              onPressed: () {},
              icon: const Icon(Icons.add),
              label: const Text("Add New"),
            ),
          ],
        ),
        const SizedBox(height: defaultPadding),
        // [Mobile]
        // crossAxisCount: _size.width < 650 ? 2 : 4
        // childAspectRatio: _size.width < 650 ? 1.3 : 1,
        // [Desktop]
        // childAspectRatio: _size.width < 1400 ? 1.1 : 1.4,
        // const FileInfoCardGridView()
        Responsive(
          mobile: FileInfoCardGridView(
            crossAxisCount: width > 400 ? 2 : 1,
            // crossAxisCount: width < 650
            //     ? 2
            //     : width < 400
            //         ? 1
            //         : 4,
            // crossAxisCount: false
            //     ? 2
            //     : true
            //         ? 1
            //         : 4,
            childAspectRatio: width < 650 ? 1.3 : 1,
          ),
          tablet: const FileInfoCardGridView(
            
          ),
          desktop: FileInfoCardGridView(childAspectRatio: width < 1400 ? 1.1 : 1.4,),
        )
      ],
    );
  }
}

class FileInfoCardGridView extends StatelessWidget {
  const FileInfoCardGridView({
    Key? key,
    this.crossAxisCount = 4,
    this.childAspectRatio = 1,
  }) : super(key: key);

  final int crossAxisCount;
  final double childAspectRatio;

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      physics: const NeverScrollableScrollPhysics(),
      shrinkWrap: true,
      itemCount: demoMyFiles.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: crossAxisCount,
        crossAxisSpacing: defaultPadding,
        mainAxisSpacing: defaultPadding,
        childAspectRatio: childAspectRatio,
      ),
      itemBuilder: (context, index) => FileInfoCard(info: demoMyFiles[index]),
    );
  }
}
