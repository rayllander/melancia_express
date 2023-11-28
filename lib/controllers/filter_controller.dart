import 'package:parse_server_sdk_flutter/parse_server_sdk_flutter.dart';

class FilterController {
  Future<bool> saveFilter({
    required String userId,
    required String categoria,
    required String status,
  }) async {
    try {
      final queryBuilder = QueryBuilder(ParseObject('Filtros'))
        ..whereEqualTo(
            'usuario_pointer', ParseObject('_User')..set('objectId', userId));

      final response = await queryBuilder.query();

      if (response.success) {
        final List<ParseObject>? existingFilters =
            response.results as List<ParseObject>?;

        final ParseObject filterToUpdateOrCreate =
            existingFilters != null && existingFilters.isNotEmpty
                ? existingFilters.first
                : ParseObject('Filtros');

        filterToUpdateOrCreate
          ..set('categoria', categoria)
          ..set('status', status);

        final userPointer = ParseObject('_User')..set('objectId', userId);
        filterToUpdateOrCreate.set<ParseObject>('usuario_pointer', userPointer);

        await filterToUpdateOrCreate.save();
        return true;
      }
      return false;
    } catch (e) {
      print('Erro ao salvar filtro: $e');
      return false;
    }
  }

  Future<Map<String, String>?> getSavedFilter(String userId) async {
    try {
      final queryBuilder = QueryBuilder(ParseObject('Filtros'))
        ..whereEqualTo(
            'usuario_pointer', ParseObject('_User')..set('objectId', userId));

      final response = await queryBuilder.query();

      if (response.success && response.results != null) {
        final List<ParseObject> existingFilters =
            response.results as List<ParseObject>;

        if (existingFilters.isNotEmpty) {
          // Se há um filtro salvo, retorna as informações do filtro
          final ParseObject existingFilter = existingFilters.first;
          final Map<String, String> savedFilter = {
            'categoria': existingFilter.get<String>('categoria') ?? '',
            'status': existingFilter.get<String>('status') ?? '',
          };

          return savedFilter;
        }
      }

      return null;
    } catch (e) {
      print('Erro ao obter filtro salvo: $e');
      return null;
    }
  }
}
