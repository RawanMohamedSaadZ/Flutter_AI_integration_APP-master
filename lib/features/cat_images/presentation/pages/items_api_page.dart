// features/cat_images/presentation/pages/items_api_page.dart
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:image_classification_app/core/utils/styles.dart';
import '../bloc/cat_image_bloc.dart';

class ItemsAPIPage extends StatelessWidget {
  const ItemsAPIPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        backgroundColor: const Color(0xff7E4DB5),
        leading: IconButton(
          icon: const Icon(Icons.arrow_back_ios),
          onPressed: () => Navigator.pop(context),
        ),
        centerTitle: true,
        title: const Text('Search here'),
        actions: [
          IconButton(
            onPressed: () => Navigator.pushNamed(context, "/custom-drawer"),
            icon: const Icon(Icons.more_vert),
            iconSize: 40,
            color: Colors.black,
          ),
        ],
        elevation: 4,
      ),
      backgroundColor: const Color(0xffDBCCEC),
      body: BlocBuilder<CatImageBloc, CatImageState>(
        builder: (context, state) {
          if (state is CatImageLoading) {
            return const Center(child: CircularProgressIndicator());
          } else if (state is CatImageLoaded) {
            return Column(
              children: [
                Center(
                  child: Padding(
                    padding: const EdgeInsets.only(top: 20),
                    child: Text(
                      "Found ${state.catImages.length} Results",
                      style: Styles.Style36,
                    ),
                  ),
                ),
                const SizedBox(height: 50),
                Expanded(
                  child: GridView.builder(
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 2,
                      childAspectRatio: 1,
                      crossAxisSpacing: 30,
                      mainAxisSpacing: 33,
                    ),
                    itemCount: state.catImages.length,
                    itemBuilder: (context, index) {
                      return Stack(
                        children: [
                          Positioned(
                            top: 10,
                            left: 20,
                            child: ClipRRect(
                              borderRadius: BorderRadius.circular(30),
                              child: CircleAvatar(
                                radius: 70,
                                backgroundImage: NetworkImage(state.catImages[index].url),
                              ),
                            ),
                          ),
                          Positioned(
                            top: 0,
                            child: IconButton(
                              onPressed: () {
                                // Handle favorite toggle logic
                              },
                              icon: Icon(
                                Icons.favorite_border,
                                size: 30,
                                color: Colors.black,
                              ),
                            ),
                          ),
                        ],
                      );
                    },
                  ),
                ),
              ],
            );
          } else if (state is CatImageError) {
            return Center(child: Text(state.message));
          } else {
            return const Center(child: Text('No images found'));
          }
        },
      ),
    );
  }
}
