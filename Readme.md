# Coordinator

### Dependency

Structure with services that coordinator needs. AppDependency, TabsDependency ...

### BaseCoordinator

Class that every coordinator inherits from. 

### AppRouter

Sets view controller as a root to application  window.
Top-most coordinators use AppRouter to change app window rootViewController.
For example TabsCoordinator wants to be root view instead of being pushed onto navigation stack or presented.

### Router

Shows view controllers  (push, present, set as root on navigation controller).

Coordinators use Router to present view controllers.

### DeepLink

Describes flow through tree of coordinators to designated screen.

### LaunchFlow

Describes app launch flow. For example, gives answer whether onboarding was already shown to this user.
