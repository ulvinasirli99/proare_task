import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:proarea_task/presentation/cubits/cats/cats_cubit.dart';
import 'package:proarea_task/presentation/screens/fact_history_screen.dart';

import '../../domain/model/cat_fact_model.dart';
import '../widgets/cat_img_component.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({Key? key}) : super(key: key);

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  void initState() {
    super.initState();
    context.read<CatsCubit>().getRandomCatImage();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
        child: catsCubitView(),
      ),
    );
  }

  BlocBuilder<CatsCubit, CatsState> catsCubitView() {
    return BlocBuilder<CatsCubit, CatsState>(
      builder: (context, state) {
        if (state is CatsLoadingState) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        if (state is CatsErrorState) {
          return Text(
            state.errorResponse ?? "",
          );
        }
        if (state is CatsSuccessState) {
          var catFactResponseModel = state.catFactResponseModel;
          return factViewOfCats(catFactResponseModel, context);
        }
        return const SizedBox();
      },
    );
  }

  Padding factViewOfCats(
      CatFactResponseModel catFactResponseModel, BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(12.0),
      child: Column(
        mainAxisAlignment: MainAxisAlignment.center,
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          SizedBox(
            height: generateAppSize(context).height / 3.3,
            width: double.infinity,
            child: factHeader(catFactResponseModel),
          ),
          catImageAndTime(catFactResponseModel, context),
        ],
      ),
    );
  }

  Expanded catImageAndTime(
      CatFactResponseModel catFactResponseModel, BuildContext context) {
    return Expanded(
      child: Column(
        children: [
          const Text(
            "Created Time : ",
            style: TextStyle(
              fontSize: 18,
              color: Colors.black,
              fontWeight: FontWeight.w500,
            ),
          ),
          const SizedBox(
            height: 8,
          ),
          Text(
            catFactResponseModel.createdAt.toString(),
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
          const SizedBox(
            height: 12,
          ),
          Center(
            child: CatImageComponent(
              imgUrl: '${catFactResponseModel.imageUrl}',
            ),
          ),
          const SizedBox(
            height: 30,
          ),
          screenButton(
            context,
            callback: () {
              context.read<CatsCubit>().getRandomCatImage();
            },
            text: "Another fact",
          ),
          const SizedBox(
            height: 15,
          ),
          screenButton(
            context,
            callback: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (context) => const FactHistoryScreen(),
                ),
              );
            },
            text: "Fact history",
          ),
        ],
      ),
    );
  }

  Column factHeader(CatFactResponseModel catFactResponseModel) {
    return Column(
      children: [
        const Text(
          "Fact : ",
          style: TextStyle(
            fontSize: 18,
            color: Colors.black,
            fontWeight: FontWeight.w500,
          ),
        ),
        const SizedBox(
          height: 8,
        ),
        Flexible(
          child: Text(
            catFactResponseModel.text ?? "",
            style: const TextStyle(
              fontSize: 15,
              fontWeight: FontWeight.w400,
            ),
          ),
        ),
        const SizedBox(
          height: 8,
        ),
      ],
    );
  }

  Widget screenButton(BuildContext context,
      {VoidCallback? callback, String? text}) {
    return Center(
      child: ElevatedButton(
        onPressed: callback,
        child: Text(text ?? ""),
      ),
    );
  }

  Size generateAppSize(BuildContext context) {
    Size size = MediaQuery.of(context).size;
    return size;
  }
}
