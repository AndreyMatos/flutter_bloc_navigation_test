import 'package:flutter_bloc/flutter_bloc.dart';

enum Page {firstPage, secondPage}

class SampleBloc extends Bloc<int, Page>{
  @override
  // TODO: implement initialState
  Page get initialState => Page.firstPage;

  @override
  Stream<Page> mapEventToState(int event) async* {
    switch (event) {
      case 0:
        yield Page.firstPage;
        break;
      case 1:
        yield Page.secondPage;
        break;
    }
  }

}