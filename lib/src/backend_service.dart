import 'dart:html';
import 'dart:convert';
import 'package:angular/angular.dart';
import 'models.dart';

@Injectable()
class BackendService {

    WebSocket socket;

    Map<String,List<Job>> jobs = {
        'curating': []
    };

    BackendService() {
        var protocol = (window.location.protocol == 'https:') ? 'wss:' : 'ws:';
        socket = new WebSocket("${protocol}//localhost:8000");
        socket.onMessage.listen((event) => onMessage(JSON.decode(event.data)));
    }

    onMessage(Map json) {
        var job_type = json['stream'];
        if (json['payload']['action'] == 'list') {
            jobs[job_type].clear();
            for (var data in json['payload']['data']) {
                jobs[job_type].add(new Job.fromJson(data));
            }
        } else {
            for (var job in jobs[job_type]) {
                if (job.id == json['payload']['data']['id']) {
                    jobs[job_type].remove(job);
                    break;
                }
            }
            jobs[job_type].add(new Job.fromJson(json['payload']['data']));
        }
    }

    List<Job> getJobsForType(String job_type) => jobs[job_type];

}