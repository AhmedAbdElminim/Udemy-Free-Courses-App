import 'package:dio/dio.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:udemu_free/Shared/Network/Remotly/DioHelper.dart';
import 'package:udemu_free/Shared/bloc/states.dart';

class AppCubit extends Cubit<AppState> {
  AppCubit() : super(AppInitialState());
  static AppCubit get(context) => BlocProvider.of(context);

  List<dynamic> response = [];
  void GetCourses() {
    emit(AppGetCoursesLoadingState());
    DioHelper.GetData().then((value) async {
      // print(value.data);
      // courseModel=CourseModel.fromJson(value.data);
      response = value.data;

      //print(response);
      emit(AppGetCoursesSuccessesState());
    }).catchError((error) {
      print('the error is ${error.toString()}');
      emit(AppGetCoursesErrorState(error.toString()));
    });
  }
}
