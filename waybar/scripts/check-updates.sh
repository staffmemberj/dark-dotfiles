#!/bin/bash

paru_count=$(paru -Qua 2>/dev/null | wc -l)
flatpak_count=$(flatpak remote-ls --updates 2>/dev/null | wc -l)
total=$((paru_count + flatpak_count))

if [ "$total" -gt 0 ]; then
    output="$total  "
    class="updates-pending"
else
    output="0  "
    class="updates-none"
fi

echo "{\"text\": \"$output\", \"tooltip\": \"$paru_count AUR + $flatpak_count Flatpak updates\", \"class\": \"$class\"}"
