#!/bin/bash

# Получаем загрузку CPU
cpu_load=$(top -bn1 | grep "Cpu(s)" | sed "s/.*, *\([0-9.]*\)%* id.*/\1/" | awk '{print 100 - $1}')

# Форматируем вывод в HTML
echo "Content-type: text/html"
echo ""
echo "<html><head><title>CPU Load</title></head>"
echo "<body><h1>CPU Load: ${cpu_load}%</h1></body></html>"
