#NoEnv
#SingleInstance, Force
SetBatchLines, -1
ListLines, Off
SetKeyDelay, -1
SendMode, Input
Process, Priority, , High

; Variables to track key states
a_held := false
d_held := false
a_scrip := false
d_scrip := false

w_held := false
s_held := false
w_scrip := false
s_scrip := false

; A key down
~*a::
    a_held := true
    if (d_scrip) {
        d_scrip := false
        SendInput, {d up}
    }
    if (!a_scrip) {
        a_scrip := true
        SendInput, {a down}
    }
return

; A key up
~*a up::
    a_held := false
    if (a_scrip) {
        a_scrip := false
        SendInput, {a up}
    }
    if (d_held and !d_scrip) {
        d_scrip := true
        SendInput, {d down}
    }
return

; D key down
~*d::
    d_held := true
    if (a_scrip) {
        a_scrip := false
        SendInput, {a up}
    }
    if (!d_scrip) {
        d_scrip := true
        SendInput, {d down}
    }
return

; D key up
~*d up::
    d_held := false
    if (d_scrip) {
        d_scrip := false
        SendInput, {d up}
    }
    if (a_held and !a_scrip) {
        a_scrip := true
        SendInput, {a down}
    }
return

; W key down
~*w::
    w_held := true
    if (s_scrip) {
        s_scrip := false
        SendInput, {s up}
    }
    if (!w_scrip) {
        w_scrip := true
        SendInput, {w down}
    }
return

; W key up
~*w up::
    w_held := false
    if (w_scrip) {
        w_scrip := false
        SendInput, {w up}
    }
    if (s_held and !s_scrip) {
        s_scrip := true
        SendInput, {s down}
    }
return

; S key down
~*s::
    s_held := true
    if (w_scrip) {
        w_scrip := false
        SendInput, {w up}
    }
    if (!s_scrip) {
        s_scrip := true
        SendInput, {s down}
    }
return

; S key up
~*s up::
    s_held := false
    if (s_scrip) {
        s_scrip := false
        SendInput, {s up}
    }
    if (w_held and !w_scrip) {
        w_scrip := true
        SendInput, {w down}
    }
return

; Press Esc to exit the script
Esc::ExitApp
