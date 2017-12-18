class Job {
    int id;
    String type;
    String title;
    String description;
    String bounty;
    String url;
    Job.fromJson(Map data) {
        id = data['id'];
        title = data['title'];
        description = data['description'];
        bounty = data['total'];
        url = data['url'];
    }
}