import 'package:dart_ng_forms/widgets/control_value_acessor.dart';
import 'package:flutter/material.dart';
import 'package:result_dart/result_dart.dart';
import 'package:smaservicos/app/domain/entities/core/lov_entity.dart';
import 'package:smaservicos/app/ui/core/widgets/form_fields/form_fields.d.dart';

class ReactiveFormSearch<T> extends ControlValueAcessor<T, T> {

  final String labelText;
  final String hintText;
  late final TextEditingController _searchController;
  late final TextEditingController _fieldController;
  final int? maxLines;
  final String? modalTitle;
  final int? minLines;
  final TextInputType type;
  final ValueChanged<LovEntity>? onSelected;
  final AsyncResult<List<LovEntity>> Function(String) onSearch;
  final bool findOnInit;

  ReactiveFormSearch({
    super.key,
    super.control,
    required this.labelText,
    this.maxLines,
    this.hintText = '',
    this.modalTitle,
    this.minLines,
    this.type = TextInputType.text,
    this.onSelected,
    required this.onSearch,
    this.findOnInit = false,
    super.enabled,
    super.formGroup,
    super.name,
    super.required,
    super.validator,
    TextEditingController? searchController,
    TextEditingController? fieldController,
  }){
    _searchController = searchController ?? TextEditingController();
    _fieldController = fieldController ?? TextEditingController();
  }

  @override
  Widget build(BuildContext context) {
    return ListenableBuilder(
      listenable: changeNotifier,
      builder: (context, _){
        return StyledFormSearchWidget(
          labelText: labelText,
          fieldController: _fieldController,
          onSearch: onSearch,
          onSelected: (entity){
            try{ value = entity.value; }catch(e,s){ debugPrint('$e\n$s'); }
            onSelected?.call(entity);
          },
          searchController: _searchController,
          maxLines: maxLines,
          enabled: enabled,
          hintText: hintText,
          minLines: minLines,
          modalTitle: modalTitle,
          type: type,
          findOnInit: findOnInit,
          required: isRequired,
          validator: validator,
        );
      }
    );
  }

}
