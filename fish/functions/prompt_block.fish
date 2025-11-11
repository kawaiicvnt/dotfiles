function prompt_block --description "returns a block with the text provided and it's color" -a color text
  
  if test -n "$text"
    echo -ns (set_color $color) "" (set_color -b $color \#000) " $text "
  end
end
