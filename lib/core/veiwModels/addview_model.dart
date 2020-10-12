import 'package:blueconnectapp/core/enum/pricing_type.dart';
import 'package:blueconnectapp/core/enum/view_state.dart';
import 'package:blueconnectapp/core/enum/visibility.dart';
import 'package:blueconnectapp/core/models/group.dart';
import 'package:blueconnectapp/core/services/authentication_service.dart';
import 'package:blueconnectapp/core/services/dialog_service.dart';
import 'package:blueconnectapp/core/services/group_service.dart';
import 'package:blueconnectapp/core/services/navigator_service.dart';
import 'package:blueconnectapp/core/utils/random_string.dart';
import 'package:blueconnectapp/locator.dart';

import 'base_model.dart';

class AddViewModel extends BaseModel{
    NavigationService _navigationService = locator<NavigationService>();
    DialogService _dialogService = locator<DialogService>();
    GroupService _groupService = locator<GroupService>();
    AuthenticationService _authenticationService = locator<AuthenticationService>();
    GenerateRandomString _gen = locator<GenerateRandomString>();

    Privacy _character = Privacy.Private;

    Pricing _pricing = Pricing.Premium;

    Privacy get character => _character;

    Pricing get pricing => _pricing;

    void navigateBack(){
      _navigationService.goBack();
    }

    void setPrivacy(Privacy privacy){
        _character = privacy;
        notifyListeners();
    }

    void setPricing(Pricing pricing){
        _pricing = pricing;
        notifyListeners();
    }

    Future addGroup({ String name, String description, String logo, }) async {
        setState(ViewState.Busy);

       var result =  await _groupService.createGroup(Group(
            id: _gen.randomString(28),
            name: name,
            description: description,
            users: [_authenticationService.currentUser.id],
            admin: _authenticationService.currentUser.id,
            public: _character == Privacy.Private ? false : true,
            premium: _pricing == Pricing.Premium? true : false,
            logo: logo,
            groupKey: '',
            groupLink: '',
        ));

       setState(ViewState.Idle);

       if(result is bool){
           _dialogService.showDialog(
               title: 'Success',
               description: 'Group created successfully.',
               buttonTitle: 'Ok',
           );
       }else{
           _dialogService.showDialog(
               title: "Error",
               description: result,
               buttonTitle: 'Ok',
           );
       }
    }


}