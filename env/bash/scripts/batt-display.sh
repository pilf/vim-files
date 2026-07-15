#!/bin/sh
# in Vim insert mode C-V to input 'u' (4 digit hex) or 'U' (8 digit hex) unicode points
# ⚡ (u26a1)
# 🔋 (U0001f50b)
#  (uf187) -- this doesn't seem to work well on my mac at least

if ! which pmset &> /dev/null; then
    exit 0
fi

batt_status="$(pmset -g batt)"
batt_timeleft=$(echo $batt_status | sed -En 's/.*[^0-9]([0-9]+:[0-9]*) .*/\1/p')
batt_percent=$(echo $batt_status | sed -En 's/.*[^0-9]([0-9]+%).*/\1/p')

if [ $(echo $batt_status | grep -c "AC Power") -eq 1 ]; then
    if [ "$batt_percent" = "100%" ]; then
        echo "⚡ $batt_percent"
    else
        echo "⚡ $batt_percent ($batt_timeleft)"
    fi
else
    echo "🔋 $batt_percent (${batt_timeleft:-no estimate})"
fi

