import 'dart:developer';

import 'package:http/http.dart' as http;

class GithubRepo {
  Future<String> getRepos(String repoName) async {
    final readmeLink =
        "https://raw.githubusercontent.com/purveshxd/$repoName/master/README.md";
    final resp = await http.get(Uri.parse(readmeLink));

    final readmeRaw = resp.body.toString();

    // actual file
    // https://raw.githubusercontent.com/purveshxd/KAIZEN-thehabitapp/refs/heads/main/media/homepage.png

    // link im getting
    // https://github.com/purveshxd/thehabitapp/blob/main/media/add_habit.png

    final data = readmeRaw.replaceAll(
        'https://github.com/purveshxd/$repoName/blob/',
        'https://raw.githubusercontent.com/purveshxd/$repoName/');
    log("data => ${data}");
    return data;
  }
}
