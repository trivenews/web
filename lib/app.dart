import 'package:angular/angular.dart';
import 'package:angular_components/angular_components.dart';

import "src/jobs.dart";
import "src/backend_service.dart";

@Component(
  selector: 'trive-app',
  styleUrls: const ['app.css'],
  templateUrl: 'app.html',
  directives: const [
    JobsComponent,
  ],
  providers: const [
    BackendService,
    materialProviders,
  ],
)
class AppComponent {

}
