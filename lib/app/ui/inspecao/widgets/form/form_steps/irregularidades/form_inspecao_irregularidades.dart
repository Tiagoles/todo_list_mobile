import 'package:dart_ng_forms/dart_ng_forms.dart';
import 'package:flutter/material.dart';
import 'package:flutter_tabler_icons/flutter_tabler_icons.dart';
import 'package:smaservicos/app/domain/entities/tipo_irregularidade/tipo_irregularidade.dart';
import 'package:smaservicos/app/domain/models/tipo_irregularidade/forms/tipo_irregularidade_form_group.dart';
import 'package:smaservicos/app/ui/core/widgets/empty_widget.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/form_fields.d.dart';
import 'package:smaservicos/app/utils/extensions/context_extensions.dart';

class FormInspecaoIrregularidades extends StatefulWidget {
  final TipoIrregularidadeFormGroup formGroup;

  const FormInspecaoIrregularidades({super.key, required this.formGroup});

  @override
  State<FormInspecaoIrregularidades> createState() =>
      _FormInspecaoIrregularidadesState();
}

class _FormInspecaoIrregularidadesState extends State<FormInspecaoIrregularidades>
    with AutomaticKeepAliveClientMixin {
  @override
  bool get wantKeepAlive => true;

  final _controller = FormControl.text(initialValue: null);
  final _filtro = ValueNotifier<String>('');

  @override
  void initState() {
    super.initState();
    _controller.valueNotifier.addListener(setFiltro);
  }

  void setFiltro() {
    _filtro.value = _controller.value.toLowerCase();
  }

  @override
  void dispose() {
    _controller.dispose();
    _filtro.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    super.build(context);

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        spacing: 8,
        children: [
          StyledFormField(
            control: _controller,
            prefixIcon: TablerIcons.search,
            hintText: 'Procurar irregularidade',
          ),
          Divider(color: context.colors.surfaceContainerHigh),
          Expanded(
            child: ValueListenableBuilder<String>(
              valueListenable: _filtro,
              builder: (context, filtro, _) {
                final filtrados = getItemsByFilter(filtro);

                if (filtrados.isEmpty) return const SingleChildScrollView(child:EmptyWidget());

                filtrados.sort((a, b) => a.dsTipoIrregularidade.compareTo(b.dsTipoIrregularidade));

                return ListView.separated(
                  itemCount: filtrados.length,
                  separatorBuilder: (_, _) => const SizedBox(height: 8),
                  itemBuilder: (context, index) {
                    final e = filtrados[index];
                    return CheckboxCollapse(
                      label: formatedDescription(e),
                      formGroup: widget.formGroup,
                      name: e.cdTipoIrregularidade.toString(),
                      content: StyledFormField(
                        formGroup: widget.formGroup,
                        name: '${e.cdTipoIrregularidade}_obs',
                        labelText: 'Observação',
                        maxLines: 4,
                      ),
                    );
                  },
                );
              },
            ),
          ),
        ],
      ),
    );
  }

  String formatedDescription(TipoIrregularidade item) {
    return '${item.cdTipoIrregularidade} - ${item.dsTipoIrregularidade}';
  }

  List<TipoIrregularidade> getItemsByFilter(String filter) {
    if (filter.isEmpty) {
      return widget.formGroup.items;
    }
    return widget.formGroup.items.where((item) {
      return item.dsTipoIrregularidade.toLowerCase().contains(filter.toLowerCase()) ||
          item.cdTipoIrregularidade.toString().contains(filter);
    }).toList();
  }

}
