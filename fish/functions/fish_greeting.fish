function fish_greeting
  set -l vroom (cat $HOME/.config/ascii/miku2-ansi.txt)
  if status is-interactive
    set -l df_res (df -hT -t btrfs -t vfat | sed 's/\/dev\///g;s/Mounted on/Mounted/g' | tail -n+2 | column -tN "Fs,Type,Size,Used,Avail,Use%,Mounted on" -H "Used,Avail" -T "Fs,Type" -o" ")
    echo

    set -l table_difference (math (count $vroom) - (count $df_res))
    for i in (seq 1 (math abs $table_difference))
      set -p table_empty_list ""
    end
    if test $table_difference -ge 0
      set df_res $table_empty_list $df_res
    else
      set vroom $table_empty_list $vroom
      # set df_res (string repeat (math abs $table_difference) "") $df_res
    end
    for i in (seq 1 (count $vroom))
      echo -e "$vroom[$i]$(set_color normal)|| $df_res[$i]"
    end
  else
    echo -e $vroom"\n"
  end
end
