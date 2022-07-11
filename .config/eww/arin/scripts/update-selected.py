import sys
from pathlib import Path

def set_theme(theme):
    with open(f"{Path.home()}/.config/eww/arin/sidebar/eww.yuck" ,"r") as file:
        with open(f"{Path.home()}/.config/eww/arin/sidebar/eww.yuck.new", "w") as updated_file:
            for line in file:
                if ("selected-theme" in line and theme not in line):
                    new_line = "\t\t\t"
                    for word in line.split():
                        if ('selected-theme' not in word and 'theme-text' not in word):
                            new_line += f'{word} '
                        elif ('theme-text' in word):
                            new_line += '"theme-text" '
                    new_line += '\n'
                    updated_file.write(new_line)
                elif ("selected-theme" not in line and theme in line):
                    new_line = "\t\t\t"
                    for word in line.split():
                        if ('theme-text' not in word):
                            new_line += f'{word} '
                        else:
                            new_line += '"theme-text selected-theme" '
                    new_line += '\n'
                    updated_file.write(new_line)
                else:
                    updated_file.write(line)
            updated_file.close()
        file.close()

def set_mode(mode):
    with open(f"{Path.home()}/.config/eww/arin/sidebar/eww.yuck" ,"r") as file:
        with open(f"{Path.home()}/.config/eww/arin/sidebar/eww.yuck.new", "w") as updated_file:
            for line in file:
                if ("selected-mode" in line and mode not in line):
                    new_line = "\t\t\t\t"
                    for word in line.split():
                        if ('selected-mode' not in word and 'theme-text' not in word):
                            new_line += f'{word} '
                        elif ('theme-text' in word):
                            new_line += '"theme-text" '
                    new_line += '\n'
                    updated_file.write(new_line)
                elif ("selected-mode" not in line and mode in line):
                    new_line = "\t\t\t\t"
                    for word in line.split():
                        if ('theme-text' not in word):
                            new_line += f'{word} '
                        else:
                            new_line += '"theme-text selected-mode" '
                    new_line += '\n'
                    updated_file.write(new_line)
                else:
                    updated_file.write(line)
            updated_file.close()
        file.close()

if __name__ == "__main__":
    if (sys.argv[1] == 'theme'):
        set_theme(sys.argv[2])
    elif (sys.argv[1] == 'mode'):
        set_mode(sys.argv[2])