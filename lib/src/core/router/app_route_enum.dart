enum AppRouteEnum { homePage, bottomNavPage, profilePage, wellnessDetailPage }

extension AppRouteExtension on AppRouteEnum {
  String get name {
    switch (this) {
      case AppRouteEnum.homePage:
        return "/home";

      case AppRouteEnum.bottomNavPage:
        return "/bottom_nav";

      case AppRouteEnum.profilePage:
        return "/profile";

      case AppRouteEnum.wellnessDetailPage:
        return "/wellness_detail";

      default:
        return "/bottom_nav";
    }
  }
}
