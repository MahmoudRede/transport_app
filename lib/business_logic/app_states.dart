abstract class AppStates{}

class InitialState extends AppStates{}

class ChangeUserSexState extends AppStates{}
class SetCurrentIndexStates extends AppStates{}
class ChangeHomeIndexState extends AppStates{}

class GetOrdersLoadingState extends AppStates{}
class GetOrdersSuccessState extends AppStates{}
class GetOrdersErrorState extends AppStates{}

class UpdateOrderStateLoadingState extends AppStates{}
class UpdateOrderStateSuccessState extends AppStates{}
class UpdateOrderStateErrorState extends AppStates{}

class PickOrderImageSuccessState extends AppStates{}
class PickOrderImageErrorState extends AppStates{}

class UploadReceivedOrderLoadingState extends AppStates{}
class UploadReceivedOrderSuccessState extends AppStates{}
class UploadReceivedOrderErrorState extends AppStates{}

class LunchToWhatsAppSuccessState extends AppStates{}

class VerifyPhoneLoadingState extends AppStates{}
class VerifyPhoneSuccessState extends AppStates{}
class LoginWithPhoneErrorState extends AppStates{}

class UploadUserInfoLoadingState extends AppStates{}
class UploadUserInfoSuccessState extends AppStates{}
class UploadUserInfoErrorState extends AppStates{}

class GetUserLoadingState extends AppStates{}
class GetUserSuccessState extends AppStates{}
class GetUserErrorState extends AppStates{}

class SignInPhoneLoadingState extends AppStates{}
class SignInPhoneSuccessState extends AppStates{}
class SignInPhoneErrorState extends AppStates{}

class ResendCodeLoadingState extends AppStates{}
class ResendCodeSuccessState extends AppStates{}
class ResendCodeErrorState extends AppStates{}

class ResendCodeTimerState extends AppStates{}
class ResendCodeTimerFinishedState extends AppStates{}

class CheckUserIdLoadingState extends AppStates{}
class CheckUserIdSuccessState extends AppStates{}
class CheckUserIdErrorState extends AppStates{}


class ScanQRCodeSuccessState extends AppStates{}

class SetOrderSelectedCityStates extends AppStates{}

class UploadCarImageSuccessState extends AppStates{}
class UploadCarImageErrorState extends AppStates{}
class UploadCarImageLoadingState extends AppStates{}

class UploadPersonalImageSuccessState extends AppStates{}
class UploadPersonalImageErrorState extends AppStates{}
class UploadPersonalImageLoadingState extends AppStates{}

class DeleteUserLoadingState extends AppStates{}
class DeleteUserSuccessState extends AppStates{}
class DeleteUserErrorState extends AppStates{}