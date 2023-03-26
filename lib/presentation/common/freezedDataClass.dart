import 'package:freezed_annotation/freezed_annotation.dart';

part 'freezedDataClass.freezed.dart';

@freezed
class LoginObject with _$LoginObject{//freezed data class
factory LoginObject(String userName,String password)=_LoginOblect;


}