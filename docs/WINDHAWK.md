# Windhawk setup checklist

1. Install Windhawk from its official release.
2. In Explore, install Windows 11 Start Menu Styler, Windows 11 Notification Center Styler, Resource Redirect, Shell Flyout Positions, Windows 11 File Explorer Styler and Custom Window Corner Radius.
3. In Custom Window Corner Radius, set normal, small and tooltip radius values to `0`. This affects DWM-managed window corners; it does not guarantee every application's internal controls are square.
4. In Shell Flyout Positions, align the Start menu to the left. Adjust Notification Center/Action Center horizontal alignment only if wanted.
5. Start Menu Styler: inspect the current Start menu XAML tree and apply the starter from `start-menu-styler.template.yaml` only if selectors exist. Set the main background to the Winslop indigo tint, border to `#777C90`, width 1, radius 0.
6. Notification Center and File Explorer: inspect their own XAML trees. Use `notification-center-styler.notes.md` and `file-explorer-styler.notes.md`; do not assume Start Menu selectors transfer.
7. Resource Redirect: choose a verified Catppuccin icon theme/package from the mod or its community theme source.
8. Keep all other Windows UI opaque; avoid the global Translucent Windows effect.

Windhawk's own mod pages warn that compatibility depends on the active Windows build. Keep a restore point or be ready to disable a mod from Windhawk Safe Mode if Explorer or Start becomes unstable.
