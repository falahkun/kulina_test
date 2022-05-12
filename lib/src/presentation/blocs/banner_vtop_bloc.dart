import 'package:flutter_bloc/flutter_bloc.dart';
import 'package:kulina_testapp/src/domain/entities/banner_entity.dart';
import 'package:kulina_testapp/src/domain/usecases/banner_usecase.dart';

abstract class VTopState {}

class VTopInitial extends VTopState {}

class VTopLoading extends VTopState {}

class VTopLoaded extends VTopState {
  final List<BannerEntity> lists;

  VTopLoaded(this.lists);
}

class VTopError extends VTopState {
  final String message;

  VTopError(this.message);
}

abstract class VTopEvent {}

class FetchVTopBanner extends VTopEvent {}

class VTopBloc extends Bloc<VTopEvent, VTopState> {
  final BannerUseCase useCase;

  VTopBloc(this.useCase) : super(VTopInitial()) {
    on<FetchVTopBanner>((event, emit) async {
      final _result = await useCase.getBannerVariantTop();
      _result.fold((l) {
        emit(VTopError(l.message));
      }, (r) {
        emit(VTopLoaded(r));
      });
    });
  }
}
