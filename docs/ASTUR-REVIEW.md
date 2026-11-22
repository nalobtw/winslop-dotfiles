# Astur Full vs Komorebi — migration decision

## Recommendation: retain Komorebi as the primary WM for this first release; trial Astur Full separately

Astur Full is a strong candidate if the primary objective becomes a Dwindle-first workflow with built-in transitions, per-window floating and integrated settings. Its current documentation lists Dwindle, Master, Columns, Grid and Monocle (the GitHub README also mentions Scrolling, so the layout list differs between its docs and README), up to ten default workspace shortcuts, directional focus/movement, animated behaviours, Alt-drag window movement/resizing, and a native Settings GUI.

However, Astur does not yet map cleanly to the requested “Astur only as WM + YASB only as bar/launcher UI” design:

1. Its official documented YASB integration is a workspace integration, not a general WM-control or active-layout control API. This means the current YASB `komorebi_active_layout` widget cannot simply control Astur.
2. Astur Full currently reserves several defaults that overlap your requested keys: `Alt+Space` launcher, `Alt+F` floating, `Alt+W` close, `Alt+arrows` focus, and `Alt+Shift+arrows` move. Its documented configuration allows letter bindings to be changed, but the precise supported “unbound” value for disabling its Full launcher was not sufficiently specified to pre-write a safe config.
3. The YASB widget you specifically want to click for layout switching is Komorebi-specific.

### When Astur becomes the better choice

Revisit Astur once the following are proven in a test profile: (a) the built-in launcher, power/system menu and navbar can be disabled without leaving hotkey conflicts; (b) Flow Launcher can safely own `Alt+Space`; (c) your custom `Alt+F`, `Alt+Shift+F`, `Alt+Q`, `Alt+M` and `Alt+Shift+M` bindings all work exactly; (d) YASB can show and switch layouts through a supported bridge or small maintained plugin; and (e) square focused-only borders and the requested 3px gap/6px tile spacing are configurable and stable on Windows 11.

### Safe trial procedure

1. Back up the current Komorebi/YASB/WHKD files.
2. Do not run both window managers at the same time. Stop Komorebi (`komorebic stop --whkd --masir`) before launching Astur.
3. Install Astur Full from its official installer; do not replace the repository's default config yet.
4. Configure a separate Astur profile and test only with non-critical windows.
5. Verify YASB integration, key conflicts, focus-following, workspace isolation, titlebar behaviour and multi-app movement.
6. Revert by quitting Astur, then restarting Komorebi and YASB.

**Why Komorebi stays in this repo:** its v0.1.41 schema and the existing YASB Komorebi widgets already support the exact interaction style you want: click the active-layout module to open a selectable layout menu, use the specific WHKD map, configure border offset/width, and run Masir for focus-follows-mouse.
