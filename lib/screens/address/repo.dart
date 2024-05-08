import '../../api/api_client.dart';

class AddressRepo {
  final ApiClient apiClient;

  AddressRepo({required this.apiClient});

  getData() async {
    return await apiClient.getData('address');
    
  }
}
