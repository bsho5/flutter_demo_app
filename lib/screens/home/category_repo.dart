import '../../api/api_client.dart';

class CategoryRepo {
  final ApiClient apiClient;

  CategoryRepo({required this.apiClient});

  getData() async {
   return await apiClient.get('categories');
  }


}
