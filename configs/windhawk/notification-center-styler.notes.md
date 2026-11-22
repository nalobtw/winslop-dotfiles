# Notification Center Styler notes

Use Windhawk → Windows 11 Notification Center Styler. Start from a simple theme, then set the root flyout surfaces to `#D9151320` / `#D9201D2C`, border `#777C90`, 1px, corner radius 0. Inspect the actual current UI tree before adding selectors: Notification Center uses separate `ShellExperienceHost.exe` / `ShellHost.exe` surfaces from Start Menu, so Start Menu element names must not be copied blindly. Set blur off.
