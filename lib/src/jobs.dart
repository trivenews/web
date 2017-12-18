import 'package:angular/angular.dart';
import 'backend_service.dart';
import 'models.dart';

@Component(
    selector: 'trive-jobs',
    styleUrls: const ['jobs.css'],
    templateUrl: 'jobs.html',
    directives: const [CORE_DIRECTIVES],
)
class JobsComponent extends OnInit {

    BackendService _backend;
    JobsComponent(this._backend);

    List<Job> jobs;

    @Input()
    String job_type;

    ngOnInit() {
        jobs = _backend.getJobsForType(job_type);
    }

}
