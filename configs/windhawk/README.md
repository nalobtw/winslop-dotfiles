# Windhawk mod set

Install these from Windhawk’s own Explore catalogue and review each mod’s compatibility warning for your exact Windows 11 build before enabling it. Windhawk mods are community extensions; updates to Windows shell XAML can change selectors.

| Mod | Intended setting | Notes |
|---|---|---|
| Windows 11 Start Menu Styler | custom Winslop template; square, 85%-opaque indigo surface | Apply the starter file only after checking element names in your build. |
| Windows 11 Notification Center Styler | match the same frame, border and surface | Start from a simple built-in theme, then adjust the live XAML selectors; avoid a global blur theme. |
| Resource Redirect | choose a Catppuccin / muted shell icon pack | The mod redirects resource assets; verify icon pack compatibility and source. |
| Shell Flyout Positions | Start menu aligned left | This mod can reposition the Start menu and notification/action flyouts. |
| Windows 11 File Explorer Styler | square corners, palette-matched navigation and surface | Selector changes are Windows-build sensitive; test before daily use. |
| Custom Window Corner Radius | window radius = 0; small/tooltip radius = 0 | This targets DWM window corner radii; it does not remove every control-level radius. |

## Opacity and blur policy

The request’s “85% transparency” is implemented as **85% opaque** (15% transparent tint) in the shell style concept. This is the more readable interpretation for Start and Notification Center. Keep blur off unless the user intentionally enables a specific effect. Do not use a global Translucent Windows mod; Komorebi should leave application windows fully opaque.

## Start Menu Styler starter

`start-menu-styler.template.yaml` is an illustrative selector starter. It is not automatically applied: confirm that `Border#AcrylicBorder` and `Border#AppBorder` exist in the current Start Menu visual tree on your exact Windows build. Windhawk’s docs recommend inspecting XAML resources / live visual tree and reviewing compatibility.

## Notification Center and Explorer

No blanket selector file is included for these surfaces because the current UI element names are build-dependent. Use the mod’s Advanced settings with the same palette values after inspecting the current visual tree; do not assume Start Menu selectors transfer to Notification Center or Explorer.
