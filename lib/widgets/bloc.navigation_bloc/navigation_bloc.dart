import 'package:bloc/bloc.dart';
import '../pages/grades.dart';
import '../pages/examschedule.dart';
import '../pages/myprofile.dart';
import '../pages/aboutgracket.dart';
import '../pages/changepassed.dart';

enum NavigationEvents {
  MyGradesClickedEvent,
  ExamScheduleClickedEvent,
  MyProfileClickedEvent,
  AboutgracketClickedEvent,
  ChangePassClickedEvent,
}

abstract class NavigationStates {}

class NavigationBloc extends Bloc<NavigationEvents, NavigationStates> {
  @override
  NavigationStates get initialState => MyProfile();

  @override
  Stream<NavigationStates> mapEventToState(NavigationEvents event) async* {
    switch (event) {
      case NavigationEvents.MyGradesClickedEvent:
        yield MyGrades();
        break;
      case NavigationEvents.ExamScheduleClickedEvent:
        yield ExamSched();
        break;
      case NavigationEvents.MyProfileClickedEvent:
        yield MyProfile();
        break;
      case NavigationEvents.AboutgracketClickedEvent:
        yield Aboutgracket();
        break;
      case NavigationEvents.ChangePassClickedEvent:
        yield ChangePassed();
        break;
    }
  }
}
