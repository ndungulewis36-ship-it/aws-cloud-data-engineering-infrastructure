#!/usr/bin/env bash
OCTAL="${1:-755}"
translate_digit() {
    local digit="$1"
    local res=""
    [[ $((digit & 4)) -gt 0 ]] && res+="r" || res+="-"
    [[ $((digit & 2)) -gt 0 ]] && res+="w" || res+="-"
    [[ $((digit & 1)) -gt 0 ]] && res+="x" || res+="-"
    echo -n "$res"
}
u="${OCTAL:0:1}"
g="${OCTAL:1:1}"
o="${OCTAL:2:1}"
echo "Octal Mode: $OCTAL"
echo -n "Symbolic:   "
translate_digit "$u"
translate_digit "$g"
translate_digit "$o"
echo ""
