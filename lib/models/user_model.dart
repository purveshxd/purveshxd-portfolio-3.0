import 'dart:convert';

import 'package:flutter/material.dart';

class UserModel {
  final List<Project> projects;
  final String name;
  final String username;
  final List<Experience> experience;
  final String longDesc;
  final String shortDesc;
  final String pass;

  UserModel({
    required this.projects,
    required this.name,
    required this.username,
    required this.experience,
    required this.longDesc,
    required this.shortDesc,
    required this.pass,
  });

  UserModel copyWith({
    List<Social>? socials,
    List<Project>? projects,
    String? name,
    String? username,
    List<Experience>? experience,
    String? longDesc,
    String? shortDesc,
    String? pass,
  }) =>
      UserModel(
        projects: projects ?? this.projects,
        name: name ?? this.name,
        username: username ?? this.username,
        experience: experience ?? this.experience,
        longDesc: longDesc ?? this.longDesc,
        shortDesc: shortDesc ?? this.shortDesc,
        pass: pass ?? this.pass,
      );

  factory UserModel.fromJson(String str) => UserModel.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory UserModel.fromMap(Map<String, dynamic> json) => UserModel(
        projects:
            List<Project>.from(json["projects"].map((x) => Project.fromMap(x))),
        name: json["name"],
        username: json["username"],
        experience: List<Experience>.from(
            json["experience"].map((x) => Experience.fromMap(x))),
        longDesc: json["long_desc"],
        shortDesc: json["short_desc"],
        pass: json["pass"],
      );

  Map<String, dynamic> toMap() => {
        "projects": List<dynamic>.from(projects.map((x) => x.toMap())),
        "name": name,
        "username": username,
        "experience": List<dynamic>.from(experience.map((x) => x.toMap())),
        "long_desc": longDesc,
        "short_desc": shortDesc,
        "pass": pass,
      };
}

class Experience {
  final String links;
  final String title;
  final String time;
  final List<String> tags;
  final String desc;
  final bool isCurrent;
  final String subTitle;

  Experience({
    required this.links,
    required this.title,
    required this.time,
    required this.tags,
    required this.desc,
    required this.isCurrent,
    required this.subTitle,
  });

  Experience copyWith({
    String? links,
    String? title,
    String? time,
    List<String>? tags,
    String? desc,
    bool? isCurrent,
    String? subTitle,
  }) =>
      Experience(
        links: links ?? this.links,
        title: title ?? this.title,
        time: time ?? this.time,
        tags: tags ?? this.tags,
        desc: desc ?? this.desc,
        isCurrent: isCurrent ?? this.isCurrent,
        subTitle: subTitle ?? this.subTitle,
      );

  factory Experience.fromJson(String str) =>
      Experience.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Experience.fromMap(Map<String, dynamic> json) => Experience(
        links: json["links"],
        title: json["title"],
        time: json["time"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        desc: json["desc"],
        isCurrent: json["is_current"],
        subTitle: json["sub_title"],
      );

  Map<String, dynamic> toMap() => {
        "links": links,
        "title": title,
        "time": time,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "desc": desc,
        "is_current": isCurrent,
        "sub_title": subTitle,
      };
}

class Project {
  final String name;
  final String thumbnailLink;
  final String desc;
  final List<String> tags;
  final String githubLink;
  final String deploymentLink;

  Project({
    required this.name,
    required this.thumbnailLink,
    required this.desc,
    required this.tags,
    required this.githubLink,
    required this.deploymentLink,
  });

  Project copyWith({
    String? name,
    String? thumbnailLink,
    String? desc,
    List<String>? tags,
    String? githubLink,
    String? deploymentLink,
  }) =>
      Project(
        name: name ?? this.name,
        thumbnailLink: thumbnailLink ?? this.thumbnailLink,
        desc: desc ?? this.desc,
        tags: tags ?? this.tags,
        githubLink: githubLink ?? this.githubLink,
        deploymentLink: deploymentLink ?? this.deploymentLink,
      );

  factory Project.fromJson(String str) => Project.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Project.fromMap(Map<String, dynamic> json) => Project(
        name: json["name"],
        thumbnailLink: json["thumbnail_link"],
        desc: json["desc"],
        tags: List<String>.from(json["tags"].map((x) => x)),
        githubLink: json["github_link"],
        deploymentLink: json["deployment_link"],
      );

  Map<String, dynamic> toMap() => {
        "name": name,
        "thumbnail_link": thumbnailLink,
        "desc": desc,
        "tags": List<dynamic>.from(tags.map((x) => x)),
        "github_link": githubLink,
        "deployment_link": deploymentLink,
      };
}

class Social {
  final String link;
  final String name;
  final IconData icon;

  Social({
    required this.link,
    required this.name,
    required this.icon,
  });

  Social copyWith({
    String? link,
    String? name,
    IconData? icon,
  }) =>
      Social(
        link: link ?? this.link,
        name: link ?? this.name,
        icon: icon ?? this.icon,
      );

  factory Social.fromJson(String str) => Social.fromMap(json.decode(str));

  String toJson() => json.encode(toMap());

  factory Social.fromMap(Map<String, dynamic> json) => Social(
        link: json["link"],
        name: json["name"],
        icon: json["icon"] as IconData,
      );

  Map<String, dynamic> toMap() => {
        "link": link,
        "name": name,
        "icon": icon,
      };
}
