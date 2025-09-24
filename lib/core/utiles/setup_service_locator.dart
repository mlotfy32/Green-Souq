import 'package:get_it/get_it.dart';
import 'package:green_souq/core/utiles/services/apiService.dart';
import 'package:green_souq/core/utiles/services/dio_factory.dart';
import 'package:green_souq/features/services/data/data_source/remote_data_source.dart';
import 'package:green_souq/features/services/data/rebo/services_rebo_imp.dart';
import 'package:green_souq/features/services/domain/rebo/services_rebo.dart';
import 'package:green_souq/features/services/domain/use_case/featch_image_use_case.dart';

final sl = GetIt.instance;

void SetupServiceLocator() {
  sl.registerSingleton<Apiservice>(Apiservice(DioFactory.getDio()));

  sl.registerSingleton<ServicesRebo>(
    ServicesReboImp(
      servicesRemoteDataSource: ServicesRemoteDataSourceImp(
        apiservice: sl.get<Apiservice>(),
      ),
    ),
  );
  sl.registerSingleton<FeatchImageUseCase>(
    FeatchImageUseCase(servicesRebo: sl.get<ServicesRebo>()),
  );
}
