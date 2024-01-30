import 'dart:async';

import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:periyarapp/keep/localstorage.dart';
import 'package:periyarapp/models/employeeloginmodel.dart';
import 'package:periyarapp/models/employeesuccessmodel.dart';
import 'package:periyarapp/models/reception/programlistmodel.dart';
import 'package:periyarapp/server/serverhelper.dart';

class MainBloc extends Bloc<MainEvent, MainState> {
  EmployeeloginModel? employeeloginModel;
  ProgramListModel? programListModel;
  EmployeeSuccessModel? employeeSuccessModel;
  MainBloc() : super(LoginInitial()) {
    on<VerifyPassword>(verifyPassword);
    on<GetListProgrm>(getListProgrm);
  }

  Future<FutureOr<void>> verifyPassword(
      VerifyPassword event, Emitter<MainState> emit) async {
    emit(Loading());
    emit(Employeelogin());

    try {
      Map map = {"phonenumber": event.name, "password": event.password};

      employeeloginModel = EmployeeloginModel.fromJson(
          await ServerHelper.post('/employee/login', map));
      if (employeeloginModel!.status == true) {
        await LocalStorage.saveToken(employeeloginModel!.token);

        employeeSuccessModel = EmployeeSuccessModel.fromJson(
            await ServerHelper.post('/employee/home', map));

        if (employeeSuccessModel!.status == true) {
          await LocalStorage.saveRole(
              employeeSuccessModel!.data!.assiginedUnitId!.type);

          if (employeeSuccessModel!.data!.assiginedUnitId!.type == "Ic") {
            emit(Employeeloginsuccess(
                employeeSuccessModel: employeeSuccessModel));
          } else if (employeeSuccessModel!.data!.assiginedUnitId!.type ==
              "Production unit") {
            emit(ProductionUnitsuccess(
                employeeSuccessModel: employeeSuccessModel));
          } else if (employeeSuccessModel!.data!.assiginedUnitId!.type ==
              "Ib") {
            emit(IBsuccess(employeeSuccessModel: employeeSuccessModel));
          } else if (employeeSuccessModel!.data!.assiginedUnitId!.type ==
              "Ecoshop") {
            emit(Ecoshopsuccess(employeeSuccessModel: employeeSuccessModel));
          } else if (employeeSuccessModel!.data!.assiginedUnitId!.type ==
              "Stays") {
            emit(Stayssuccess(employeeSuccessModel: employeeSuccessModel));
          } else if (employeeSuccessModel!.data!.assiginedUnitId!.type ==
              "Entry Point") {
            emit(CheckPostSuccess(employeeSuccessModel: employeeSuccessModel));
          } else if (employeeSuccessModel!.data!.assiginedUnitId!.type ==
              "Reception") {
            emit(ReceptionSuccess(employeeSuccessModel: employeeSuccessModel));
          }
        } else if (employeeSuccessModel!.status == false) {
          emit(EmployeeloginError(error: employeeSuccessModel!.msg));
        }
      } else if (employeeloginModel!.status == false) {
        emit(EmployeeloginError(error: employeeloginModel!.msg));
      }
    } catch (e) {
      emit(EmployeeloginError(error: e.toString()));
    }
  }

  Future<FutureOr<void>> getListProgrm(
      GetListProgrm event, Emitter<MainState> emit) async {
    emit(ProgramLoading());

    Map map = {
      "started": event.started,
      "category": event.category,
      "programmestatus": event.programmestatus,
      "isCottage": event.isCottage,
      "date": event.date,
    };
    try {
      programListModel = ProgramListModel.fromJson(
          await ServerHelper.post('/programme/getlist/appBooking', map));
      if (programListModel!.status == true) {
        emit(ProgramListSuccess(programListModel: programListModel));
      } else if (programListModel!.status == false) {
        emit(ProgramListError(error: "Something went wrong"));
      }
    } catch (e) {
      emit(ProgramListError(error: "Something went wrong"));
    }
  }
}

class MainEvent {}

class VerifyPassword extends MainEvent {
  final String? name, password;

  VerifyPassword({this.name, this.password});
}

class GetListProgrm extends MainEvent {
  final String? started, category, programmestatus, isCottage, date;

  GetListProgrm(
      {this.started,
      this.category,
      this.programmestatus,
      this.isCottage,
      this.date});
}

class MainState {}

class LoginInitial extends MainState {}

class Loading extends MainState {}

class ProgramLoading extends MainState {}

class Employeelogin extends MainState {}

class LoginError extends MainState {
  final String? error;

  LoginError({this.error});
}

class Fething extends MainState {}

class LoginSuccess extends MainState {}

class ProductionUnitsuccess extends MainState {
  final EmployeeSuccessModel? employeeSuccessModel;

  ProductionUnitsuccess({this.employeeSuccessModel});
}

class IBsuccess extends MainState {
  final EmployeeSuccessModel? employeeSuccessModel;

  IBsuccess({this.employeeSuccessModel});
}

class Ecoshopsuccess extends MainState {
  final EmployeeSuccessModel? employeeSuccessModel;

  Ecoshopsuccess({this.employeeSuccessModel});
}

class Stayssuccess extends MainState {
  final EmployeeSuccessModel? employeeSuccessModel;

  Stayssuccess({this.employeeSuccessModel});
}

class CheckPostSuccess extends MainState {
  final EmployeeSuccessModel? employeeSuccessModel;

  CheckPostSuccess({this.employeeSuccessModel});
}

class ReceptionSuccess extends MainState {
  final EmployeeSuccessModel? employeeSuccessModel;

  ReceptionSuccess({this.employeeSuccessModel});
}

class EmployeeloginError extends MainState {
  final String? error;

  EmployeeloginError({this.error});
}

class ProgramListError extends MainState {
  final String? error;

  ProgramListError({this.error});
}

class ProgramListSuccess extends MainState {
  final ProgramListModel? programListModel;

  ProgramListSuccess({this.programListModel});
}

class Employeeloginsuccess extends MainState {
  final EmployeeSuccessModel? employeeSuccessModel;

  Employeeloginsuccess({this.employeeSuccessModel});
}
