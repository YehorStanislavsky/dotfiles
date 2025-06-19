#!/usr/bin/env bash

# Убиваем все запущенные бары
killall -q polybar

# Ждём завершения
while pgrep -x polybar >/dev/null; do sleep 0.5; done

# Запускаем бар для каждого монитора
if type "xrandr" > /dev/null; then
  for m in $(xrandr --query | grep " connected" | cut -d" " -f1); do
    MONITOR=$m polybar main &  # замените `mybar` на название вашей секции [bar/mybar]
  done
else
  polybar mybar &
fi
