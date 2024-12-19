import 'package:http/http.dart' as http;

class GithubRepo {
  Future<String> getRepos(String repoName) async {
    final readmeLink =
        "https://raw.githubusercontent.com/purveshxd/$repoName/master/README.md";
    final resp = await http.get(Uri.parse(readmeLink));

    final readmeRaw = resp.body.toString();

    final data = readmeRaw.replaceAll(
        'https://github.com/purveshxd/$repoName/blob/',
        'https://raw.githubusercontent.com/purveshxd/$repoName/');

    return data;
  }
}