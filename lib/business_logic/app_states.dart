abstract class AppStates{}

class InitialState extends AppStates{}

class ChangeUserSexState extends AppStates{}
class SetCurrentIndexStates extends AppStates{}
class ChangeHomeIndexState extends AppStates{}

class GetOrdersLoadingState extends AppStates{}
class GetOrdersSuccessState extends AppStates{}
class GetOrdersErrorState extends AppStates{}

class PickOrderImageSuccessState extends AppStates{}
class PickOrderImageErrorState extends AppStates{}

class UploadOrderImageLoadingState extends AppStates{}
class UploadOrderImageSuccessState extends AppStates{}
class UploadOrderImageErrorState extends AppStates{}

class LunchToWhatsAppSuccessState extends AppStates{}
