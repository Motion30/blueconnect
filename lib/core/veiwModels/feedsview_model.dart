import 'package:blueconnectapp/core/enum/view_state.dart';
import 'package:blueconnectapp/core/models/feeds.dart';
import 'package:blueconnectapp/core/services/navigator_service.dart';
import 'package:blueconnectapp/core/services/news_service.dart';
import 'package:blueconnectapp/locator.dart';

import 'base_model.dart';

class FeedsViewModel extends BaseModel{
  // Add the navigator service
  NavigationService _navigationService = locator<NavigationService>();
  NewsService _newsService = locator<NewsService>();

  List<Feeds> _feeds;

  List<Feeds> get feeds => [..._feeds];

  Future setFeeds() async{
    //Set the state to busy
    setState(ViewState.Busy);

    _feeds = await _newsService.getNews();
    notifyListeners();
    // Set the state back to idle
    setState(ViewState.Idle);
  }

  void navigateToNewsPage(){

  }


}