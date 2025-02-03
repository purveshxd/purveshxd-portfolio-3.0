class Profile {
  final String name;
  final String title;
  final String shortDesc;
  final String longDesc;
  final String resumeLink;
  final String username;
  final String pass;

  Profile({
    required this.name,
    required this.title,
    required this.shortDesc,
    required this.longDesc,
    required this.resumeLink,
    required this.username,
    required this.pass,
  });

  factory Profile.fromMap(Map<String, dynamic> map) {
    return Profile(
      name: map['name'] ?? '',
      title: map['title'] ?? '',
      shortDesc: map['short_desc'] ?? '',
      longDesc: map['long_desc'] ?? '',
      resumeLink: map['resume_link'] ?? '',
      username: map['username'] ?? '',
      pass: map['pass'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'title': title,
      'short_desc': shortDesc,
      'long_desc': longDesc,
      'resume_link': resumeLink,
      'username': username,
      'pass': pass,
    };
  }
}

class Social {
  final String link;
  final String name;

  Social({
    required this.link,
    required this.name,
  });

  factory Social.fromMap(Map<String, dynamic> map) {
    return Social(
      link: map['link'] ?? '',
      name: map['name'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'link': link,
      'name': name,
    };
  }
}

class Project {
  final int index;
  final String name;
  final String desc;
  final String githubLink;
  final List<String> techTag;
  final String thumbnailLink;
  final String deploymentLink;

  Project({
    required this.index,
    required this.name,
    required this.desc,
    required this.githubLink,
    required this.techTag,
    required this.thumbnailLink,
    required this.deploymentLink,
  });

  factory Project.fromMap(Map<String, dynamic> map) {
    return Project(
      index: map['index'],
      name: map['name'] ?? '',
      desc: map['desc'] ?? '',
      githubLink: map['github_link'] ?? '',
      techTag: List<String>.from(map['tech_tag'] ?? []),
      thumbnailLink: map['thumbnail_link'] ?? '',
      deploymentLink: map['deployment_link'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'index': index,
      'name': name,
      'desc': desc,
      'github_link': githubLink,
      'tech_tag': techTag,
      'thumbnail_link': thumbnailLink,
      'deployment_link': deploymentLink,
    };
  }
}

class Experience {
  final String title;
  final String location;
  final String companyName;
  final String desc;
  final String timeline;
  final String link;

  Experience({
    required this.title,
    required this.location,
    required this.companyName,
    required this.desc,
    required this.timeline,
    required this.link,
  });

  factory Experience.fromMap(Map<String, dynamic> map) {
    return Experience(
      title: map['title'] ?? '',
      location: map['location'] ?? '',
      companyName: map['company_name'] ?? '',
      desc: map['desc'] ?? '',
      timeline: map['timeline'] ?? '',
      link: map['link'] ?? '',
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'title': title,
      'location': location,
      'company_name': companyName,
      'desc': desc,
      'timeline': timeline,
      'link': link,
    };
  }
}

class UserModel {
  final Profile profile;
  final List<Social> socials;
  final List<Project> projects;
  final List<Experience> experiences;

  UserModel({
    required this.profile,
    required this.socials,
    required this.projects,
    required this.experiences,
  });

  factory UserModel.fromMap(Map<String, dynamic> map) {
    return UserModel(
      profile: Profile.fromMap(map['profile']),
      socials: List<Social>.from(
          map['socials']?.map((x) => Social.fromMap(x)) ?? []),
      projects: List<Project>.from(
          map['projects']?.map((x) => Project.fromMap(x)) ?? []),
      experiences: List<Experience>.from(
          map['experience']?.map((x) => Experience.fromMap(x)) ?? []),
    );
  }

  Map<String, dynamic> toMap() {
    return {
      'profile': profile.toMap(),
      'socials': socials.map((x) => x.toMap()).toList(),
      'projects': projects.map((x) => x.toMap()).toList(),
      'experience': experiences.map((x) => x.toMap()).toList(),
    };
  }
}
