abstract class AppState{}
class AppInitialState extends AppState{}
class AppGetCoursesLoadingState extends AppState{}
class AppGetCoursesSuccessesState extends AppState{}
class AppGetCoursesErrorState extends AppState{
  final String error;
  AppGetCoursesErrorState(this.error);

}