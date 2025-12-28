#!/bin/bash

log_dir="$1"
days="$2"

files_to_delete=$(find "$log_dir" -name "*.log" -type f -mtime +$days)

if [ -z "$files_to_delete" ]; then
    echo "Файлы для удаления не найдены."
    exit 0
fi

echo "Найдены следующие файлы для удаления:"
echo "$files_to_delete"

read -p "Удалить эти файлы? (y/n): " answer

if [ "$answer" = "y" ] || [ "$answer" = "Y" ]; then
    echo "Удаление файлов..."
    echo "$files_to_delete" | xargs rm -v
    echo "Готово! Файлы удалены."
else
    echo "Удаление отменено."
fi
