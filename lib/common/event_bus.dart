import 'package:event_bus/event_bus.dart';
import 'package:smh_tv/models/resources.dart';

//Bus初始化
EventBus eventBus = EventBus();

class UserLoggedInEvent {
  UserLoggedInEvent();
}

class ToLogin {
  ToLogin();
}

class UserLoggedOutEvent {
  UserLoggedOutEvent();
}

class ShowMovie {
  ShowMovie();
}

class PlayMoieEvent {
  MovieResources resources;
  PlayMoieEvent(this.resources);
}
