import 'package:flutter/widgets.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../internal/repositories.dart';
import '../../internal/settings.dart';
import '../entities/news.dart';

class ScreensCubit extends Cubit<List<Widget>> {
  ScreensCubit() : super([]);
}