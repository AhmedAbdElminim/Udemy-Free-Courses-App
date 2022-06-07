import 'package:conditional_builder_null_safety/conditional_builder_null_safety.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:flutter_spinkit/flutter_spinkit.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:udemu_free/Shared/bloc/cubit.dart';
import 'package:udemu_free/Shared/bloc/states.dart';
import 'package:udemu_free/modules/webview.dart';

class HomeScreen extends StatelessWidget {
  // const HomeScreen({Key? key}) : super(key: key);
  List<Color> colors = const [
    Color(0XFF99CAE1),
    Color(0XFFE19999),
    Color(0XFF9EE199),
    Color(0XFF99CAE1),
    Color(0XFFE19999),
    Color(0XFF9EE199),
    Color(0XFF99CAE1),
    Color(0XFFE19999),
    Color(0XFF9EE199),
  ];
  List<String> CategoriesTitels = [
    'Development',
    'IT-Software',
    'Business',
    'Office-Productivity',
    'Personal-Development',
    'Design',
    'Marketing',
    'Language',
    'Test-Prep'
  ];
  List<String> imagepath = [
    'assets/images/devolpment.png',
    'assets/images/network.png',
    'assets/images/web.png',
    'assets/images/devolpment.png',
    'assets/images/network.png',
    'assets/images/web.png',
    'assets/images/devolpment.png',
    'assets/images/network.png',
    'assets/images/web.png',
  ];

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => AppCubit(),
      child: BlocConsumer<AppCubit, AppState>(
        listener: (context, state) {},
        builder: (context, state) {
          var cubit = AppCubit.get(context).GetCourses();
          return Scaffold(
            appBar: AppBar(
              backgroundColor: Colors.white,
              elevation: 0,
              flexibleSpace: SafeArea(
                child: Padding(
                  padding: const EdgeInsets.symmetric(horizontal: 20),
                  child: Row(
                    children: [
                      Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            'Hello',
                            style: GoogleFonts.notoSans(
                                fontWeight: FontWeight.bold,
                                fontSize: 16,
                                color: Color(0XFF747474)),
                          ),
                          Text(
                            'Find your Free Courses',
                            style: GoogleFonts.poppins(
                                fontSize: 20,
                                fontWeight: FontWeight.bold,
                                color: Color(0XFF232323)),
                          )
                        ],
                      ),
                      Spacer(),
                      Container(
                        height: 48,
                        width: 48,
                        decoration: const BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage('assets/images/profile.png'),
                            //fit: BoxFit.fill,
                          ),
                          shape: BoxShape.circle,
                        ),
                      )
                    ],
                  ),
                ),
              ),
            ),
            body: ConditionalBuilder(
              condition: AppCubit.get(context).response.length > 0,
              builder: (BuildContext context) => SingleChildScrollView(
                physics: BouncingScrollPhysics(),
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      Text(
                        'Category',
                        style: GoogleFonts.poppins(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: const Color(0XFF232323)),
                      ),
                      const SizedBox(
                        height: 8,
                      ),
                      Container(
                        height: 157,
                        width: double.infinity,
                        child: ListView.separated(
                            physics: BouncingScrollPhysics(),
                            scrollDirection: Axis.horizontal,
                            itemBuilder: (context, index) =>
                                BuildCatigoriesItem(index),
                            separatorBuilder: (context, index) => SizedBox(
                                  width: 10,
                                ),
                            itemCount: 9),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      Text(
                        'Courses',
                        style: GoogleFonts.notoSans(
                            fontWeight: FontWeight.bold,
                            fontSize: 18,
                            color: Color(0XFF232323)),
                      ),
                      const SizedBox(
                        height: 20,
                      ),
                      ListView.separated(
                          physics: ClampingScrollPhysics(),
                          shrinkWrap: true,
                          itemBuilder: (context, index) => BuildCourseItem(
                              AppCubit.get(context).response, index, context),
                          separatorBuilder: (context, index) => const SizedBox(
                                height: 10,
                              ),
                          itemCount: AppCubit.get(context).response.length),
                    ],
                  ),
                ),
              ),
              fallback: (BuildContext context) => const Center(
                child: SpinKitWave(
                  color: Colors.deepOrange,
                  size: 30.0,
                ),
              ),
            ),
          );
        },
      ),
    );
  }

  Widget BuildCatigoriesItem(int index) => Container(
        height: 157,
        width: 128,
        decoration: BoxDecoration(
            color: colors[index], borderRadius: BorderRadius.circular(16.0)),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          crossAxisAlignment: CrossAxisAlignment.center,
          children: [
            Container(
              height: 59.71,
              width: 62.65,
              decoration: BoxDecoration(
                //color: Colors.white,
                image: DecorationImage(
                  image: AssetImage(imagepath[index]),
                  // fit: BoxFit.fill,
                ),
                //shape: BoxShape.circle,
              ),
            ),
            SizedBox(
              height: 15,
            ),
            Text(
              CategoriesTitels[index],
              style: GoogleFonts.poppins(
                  fontWeight: FontWeight.bold,
                  fontSize: 16,
                  color: Color(0XFFFFFFFF)),
            )
          ],
        ),
      );
  Widget BuildCourseItem(List<dynamic> item, int index, context) =>
      GestureDetector(
        onTap: () {
          Navigator.push(
            context,
            MaterialPageRoute(
                builder: (context) => WebViewScreen(item[index]['link'])),
          );
        },
        child: Stack(
          alignment: AlignmentDirectional.topEnd,
          children: [
            Container(
              height: 210,
              width: double.infinity,
              decoration: BoxDecoration(
                borderRadius: BorderRadius.circular(20),
                image: DecorationImage(
                  image: NetworkImage(item[index]['image']),
                  fit: BoxFit.fill,
                ),
                //shape: BoxShape.circle,
              ),
            ),
            const Padding(
              padding: EdgeInsets.only(top: 18, right: 18),
              child: Image(image: AssetImage('assets/images/heart.png')),
            ),
            Positioned(
              top: 110,
              right: 0,
              left: 11,
              bottom: 10,
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    item[index]['title'],
                    maxLines: 2,
                    style: GoogleFonts.notoSans(
                        fontSize: 16,
                        fontWeight: FontWeight.bold,
                        color: Color(0XFFFFFFFF)),
                  ),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.end,
                    children: [
                      const Padding(
                        padding: EdgeInsets.only(top: 18, right: 18),
                        child:
                            Image(image: AssetImage('assets/images/free.png')),
                      ),
                      Text(
                        'FREE',
                        style: GoogleFonts.notoSans(
                          fontSize: 16,
                          color: Color(0XFFFFFFFF),
                        ),
                      )
                    ],
                  ),
                ],
              ),
            )
          ],
        ),
      );
}
