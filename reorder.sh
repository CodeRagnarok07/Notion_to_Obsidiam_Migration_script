# sh
#
# TODO


# echo "hola mundo"

# Leer archivos de la carpeta actual
for archivo in ./*; do
  #archivo="archivo.txt"

  # Obtener el nombre del archivo sin la extensión
  nombre_archivo="${archivo%.*}"

  # Buscar la carpeta con el mismo nombre
  if [ -d "$nombre_archivo" ]; then
    echo "Carpeta encontrada: $nombre_archivo"

    # Mover el archivo a la carpeta
    mv "$archivo" "$nombre_archivo"
    echo "Archivo movido a $nombre_archivo"
  else
    echo "No se encontró ninguna carpeta llamada $nombre_archivo"
  fi
done
