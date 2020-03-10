DButton {
    readonly property url enabledsource: containsPress ? "assets/btn/btn_next-pressed.png" : "assets/btn/btn_next-active.png"
    source: enabled ? enabledSource : "assets/btn/btn_next-disable.png"
}
