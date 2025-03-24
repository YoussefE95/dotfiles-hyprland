#!/bin/bash
palette=("${@}")

dest_dir="$HOME/.config/"
dest_file="okularpartrc"

back=$(printf "%d,%d,%d\n" 0x${palette[0]:0:2} 0x${palette[0]:2:2} 0x${palette[0]:4:2})
fore=$(printf "%d,%d,%d\n" 0x${palette[2]:0:2} 0x${palette[2]:2:2} 0x${palette[2]:4:2})

output="$(cat << THEME
[$Version]
update_info=okular.upd:annotation-toolbar,okular.upd:builtin-annotations

[Dlg Accessibility]
RecolorBackground=${back}
RecolorForeground=${fore}

[Document]
ChangeColors=true
RenderMode=Recolor

[PageView]
BackgroundColor=40,40,40

[Reviews]
QuickAnnotationTools=<tool name="Yellow Highlighter" default="true" id="1" type="highlight"><engine color="#ffff00" type="TextSelector"><annotation color="#ffffff00" type="Highlight"/></engine><shortcut>1</shortcut></tool>,<tool name="Green Highlighter" default="true" id="2" type="highlight"><engine color="#00ff00" type="TextSelector"><annotation color="#ff00ff00" type="Highlight"/></engine><shortcut>2</shortcut></tool>,<tool id="3" type="underline"><engine color="#ff0000" type="TextSelector"><annotation color="#ffff0000" type="Underline"/></engine><shortcut>3</shortcut></tool>,<tool name="Insert Text" default="true" id="4" type="typewriter"><engine block="true" type="PickPoint"><annotation width="0" color="#00ffffff" textColor="#000000" type="Typewriter"/></engine><shortcut>4</shortcut></tool>,<tool id="5" type="note-inline"><engine color="#ffff00" block="true" type="PickPoint" hoverIcon="tool-note-inline"><annotation color="#ffffff00" textColor="#ff000000" type="FreeText"/></engine><shortcut>5</shortcut></tool>,<tool id="6" type="note-linked"><engine color="#ffff00" type="PickPoint" hoverIcon="tool-note"><annotation color="#ffffff00" icon="Note" type="Text"/></engine><shortcut>6</shortcut></tool>
THEME
)"

printf '%s' "$output" > "${dest_dir}${dest_file}"
