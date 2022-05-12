import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kulina_testapp/src/domain/entities/banner_entity.dart';
import 'package:kulina_testapp/src/domain/usecases/banner_usecase.dart';

abstract class VsmallState {}

class VSmallInitial extends VsmallState {}

class VSmallLoading extends VsmallState {}

class VSmallLoaded extends VsmallState {
  final List<BannerEntity> lists;

  VSmallLoaded(this.lists);
}

class VSmallError extends VsmallState {
  final String message;

  VSmallError(this.message);
}

abstract class VSmallEvent {}

class FetchVSmallBanner extends VSmallEvent {}

class VSmallBloc extends Bloc<VSmallEvent, VsmallState> {
  final BannerUseCase useCase;

  VSmallBloc(this.useCase) : super(VSmallInitial()) {
    on<FetchVSmallBanner>((event, emit) async {
      final _result = await useCase.getBannerVariantSmall();
      _result.fold((l) {
        emit(VSmallError(l.message));
      }, (r) {
        emit(VSmallLoaded(r));
      });
    });
  }
}
