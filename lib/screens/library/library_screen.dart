import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:photos_app/blocs/blocs.dart';

import 'package:photos_app/widgets/widgets.dart';

class LibraryScreen extends StatelessWidget {
  const LibraryScreen({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Stack(
        children: [
          BlocBuilder<LibraryBloc, LibraryState>(
            builder: (context, state) {
              if (state.isLoading) {
                return const Center(
                  child: CircularProgressIndicator(),
                );
              }
              if (!state.isPermisionGranted) {
                return const Center(
                  child: Text(
                    'isPermisionGranted: false',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 30.0
                    ),
                  ),
                );
              }
              return CustomGridViewBuilder(
                allMedia: state.allMedia,
              );
            },
          ),
          const Positioned(
            top: 40.0,
            child: TopButtons(),
          ),
        ],
      )
    );
  }
}

class TopButtons extends StatelessWidget {
  const TopButtons({
    Key? key,
  }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Container(
      width: size.width,
      padding: const EdgeInsets.symmetric(horizontal: 20.0),
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisAlignment: MainAxisAlignment.spaceBetween,
        children: [
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: const [
              Text(
                '8 May 2022',
                style: TextStyle(
                    fontWeight: FontWeight.bold,
                    color: Colors.white,
                    fontSize: 20.0),
              ),
              SizedBox(
                height: 8.0,
              ),
              Text(
                'Home',
                style: TextStyle(
                    fontWeight: FontWeight.w500,
                    fontSize: 15.0,
                    color: Colors.white),
              ),
            ],
          ),
          Row(
            children: [
              GestureDetector(
                onTap: () {},
                child: Container(
                  decoration: BoxDecoration(
                    color: Colors.grey[800],
                    borderRadius: BorderRadius.circular(14.0),
                  ),
                  padding: const EdgeInsets.symmetric(
                      horizontal: 12.0, vertical: 6.0),
                  child: const Text(
                    'Select',
                    style: TextStyle(
                        color: Colors.white,
                        fontWeight: FontWeight.w600,
                        fontSize: 13.0),
                  ),
                ),
              ),
              const SizedBox(
                width: 8.0,
              ),
              GestureDetector(
                onTap: () {},
                child: Container(
                    decoration: BoxDecoration(
                        color: Colors.grey[800], shape: BoxShape.circle),
                    padding: const EdgeInsets.all(2.0),
                    child: const Icon(
                      Icons.more_horiz,
                    )),
              ),
            ],
          ),
        ],
      ),
    );
  }
}
