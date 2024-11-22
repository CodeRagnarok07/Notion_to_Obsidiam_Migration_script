dir=(./Old-Diary/Spring/*)

format_date() {
  local fecha=$1

  dia=$(echo $fecha | cut -d'/' -f1)
  mes=$(echo $fecha | cut -d'/' -f2)
  year=$(echo $fecha | cut -d'/' -f3)
  echo "$year-$mes-$dia"

}

get_day_path() {
  local fecha=$1

  nueva_fecha=$(date -d ${fecha} "+%Y/%m-%b/%V/%d-%a")
  echo $nueva_fecha
}

get_week() {
  local fecha=$1

  nueva_fecha=$(date -d ${fecha} "+%Y/%m-%b/%V")
  echo $nueva_fecha
}

# for file in ./Old-Diary/Spring/*; do
#   if [ -d "$file" ]; then
#
#     folder_name=$(basename "$file")
#     found_file=$(find "$file" -type f -name "$folder_name".md)
#
#     #echo "revisando $dir $folder_name $found_file"
#   fi
#
#   echo $found_file
#   # Busca archivos con el mismo nombre que la carpeta
#   #week_from_spring=$(grep "week" "$found_file" | cut -d':' -f2 | cut -d' ' -f2)
# done

if [ -d "$dir" ]; then

  folder_name=$(basename "$dir")
  found_file=$(find "$dir" -type f -name "$folder_name".md)

  #echo "revisando $dir $folder_name $found_file"
fi

date_formated=$(format_date $week_from_spring)
week_path=$(get_week $date_formated)
week_day=$(date -d ${date_formated} "+%V")

#cp "$found_file" "$found_file".bak
mkdir -p ./$week_path

mv -f "$found_file".bak ./$week_path/$week_day.md

#echo ./file-moved

exit 0

#get_day_path $date_formated

days_of_spring=$(grep "Dairy" "$found_file" | cut -d':' -f2 | grep -oP '\(\.\.\/Diario[^\)]+\)' | sed 's/[()]//g')

# define all days on the spring
IFS=$'\n' read -rd '' -a array_days_of_spring <<<"$days_of_spring"

for i in "${array_days_of_spring[@]}"; do

  string="$i"
  if readlink -n "$string" | test -d; then

    filepath=$(echo "$i" | sed 's/%20/ /g') #"$i"

    filename=$(echo "$filepath" | cut -d'/' -f3)

    found_file_diary=$(find ./Old-Diary/diario -type f -name "$filename")

  else
    echo "$string is a file"
  fi

done
