# ! bin/sh

rute=./DiaryNotion/

reorder_files() {
  local path="${1}"

  for file in "${path}"*; do
    file_path="${file%.*}"

    if [ -d "$file" ] && find "$file" -type d -not -empty; then
      # verifica que si el archivo es un directorio y tiene subdirectorios
      reorder_files "${file}/"

    elif [ -d "$file_path" ]; then
      # Si solo es un directorio la ruta del archivo

      # mv "$file" "$file_path"
      echo "file movido a $file_path"
    else
      # Solo es un archivo
      echo "[x] file "
    fi
  done

}

#reorder_files $rute

grep ":" ./orderpath.md
