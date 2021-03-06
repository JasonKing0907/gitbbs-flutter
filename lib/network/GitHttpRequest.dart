import 'package:gitbbs/model/GitIssue.dart';
import 'package:gitbbs/model/GitUser.dart';
import 'package:gitbbs/model/PagingData.dart';
import 'package:gitbbs/model/git_comment.dart';
import 'package:gitbbs/model/git_content_file.dart';
import 'package:gitbbs/network/IssueState.dart';
import 'package:gitbbs/network/github/GithubHttpRequest.dart';
import 'package:gitbbs/network/github/model/github_gist.dart';
import 'package:gitbbs/network/github/model/github_gist_file.dart';
import 'package:gitbbs/network/github/model/github_message.dart';
import 'package:gitbbs/network/github/model/label_info.dart';

abstract class GitHttpRequest {
  Future<PagingData<GitIssue>> getMoreIssues(
      {List<String> label,
      String creator,
      IssueState state,
      String before,
      String after});

  Future<PagingData<GitComment>> getComments(int number, String before);

  Future<GitIssue> getIssue(int number);

  Future createIssue(String title, String body, List<String> label);

  Future deleteIssue(String issueId);

  Future<GitUser> doAuthenticated(String token, String username);

  Future<bool> signIn(String username, String password);

  Future starRepo(String owner, String repoName);

  Future<GitComment> addComment(String issueId, String body);

  Future<bool> modifyComment(String commentId, String body);

  Future<bool> deleteComment(String commentId);

  Future<GithubGist> getFavoriteGist();

  Future<GithubGist> forkConfigGist();

  Future<bool> saveConfigGist(Map<String, GithubGistFile> map);

  Future<LabelInfo> getLabelsConfig();

  Future getOfficialMessageList();

  Future<String> getOfficialMessage(String path);

  Future<int> getUserIssuesCount(String login);

  factory GitHttpRequest.getInstance() => GithubHttpRequest.getInstance();
}
