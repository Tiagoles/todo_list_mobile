import 'package:mobx/mobx.dart';
import 'package:smaservicos/app/domain/entities/apontamento_hora/apontamento_hora.dart';
import 'package:smaservicos/app/ui/apontamento_hora/data/apontamento_completos.dart';
import 'package:smaservicos/app/utils/extensions/date_time_extensions.dart';

part 'apontamento_hora_viewmodel.g.dart';

class ApontamentoHoraViewModel = ApontamentoHoraViewModelBase with _$ApontamentoHoraViewModel;

abstract class ApontamentoHoraViewModelBase with Store{

  @observable
  ObservableList<ApontamentoCompleto> apontamentos = ObservableList.of(apontamentosMock);

  @computed
  Map<DateTime, List<ApontamentoCompleto>> get perDay{
    final days = <DateTime, List<ApontamentoCompleto>>{};

    for(final apontamento in apontamentos){
      final dtApontamento = apontamento.dtHoraInicioApontamento ?? apontamento.dtApontamento;
      final day = DateTime(dtApontamento.year, dtApontamento.month, dtApontamento.day);
      if(!days.containsKey(day)) days[day] = [];
      days[day]!.add(apontamento);
    }

    final sortedDays = days.entries.toList()
      ..sort((a, b) => b.key.compareTo(a.key));

    return Map.fromEntries(sortedDays);

  }

  @computed
  Map<int, Map<DateTime, List<ApontamentoCompleto>>> get perWeek{

    final weeks = <int, Map<DateTime, List<ApontamentoCompleto>>>{};

    for(final day in perDay.entries){
      final weekOfYear = day.key.weekOfYear;
      if(!weeks.containsKey(weekOfYear)) weeks[weekOfYear] = {};
      weeks[weekOfYear]![day.key] = day.value;
    }

    final sortedWeeks = weeks.entries.toList()
      ..sort((a, b) => b.key.compareTo(a.key));

    return Map.fromEntries(sortedWeeks);

  }

}