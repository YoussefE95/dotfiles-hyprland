import os
import json
import curses
from curses import wrapper
import subprocess

def load_json(path):
    with open(f'{os.path.dirname(__file__)}/{path}', 'r') as file:
        data = json.load(file)
    return data

def get_current():
    current = load_json('info/current.json')
    return [
        current['theme'],
        current['mode'],
        current['tone']
    ]

def main(stdscr):
    themes = load_json('info/themes.json')
    current = get_current()
    hover = [0, 0]

    curses.init_pair(1, curses.COLOR_WHITE, curses.COLOR_BLACK)
    curses.init_pair(2, curses.COLOR_GREEN, curses.COLOR_BLACK)
    curses.init_pair(3, curses.COLOR_MAGENTA, curses.COLOR_BLACK)

    curses.curs_set(0)

    while True:
        supported = [
            list(themes.keys()),
            list(themes[current[0]]['palette'].keys()),
            list(themes[current[0]]['palette'][current[1]].keys())
        ]

        stdscr.clear()

        row_pos = (curses.LINES // 2) - len(supported)

        for i in range(len(supported)):
            col_pos = (curses.COLS // 2) - (sum(map(len, supported[i])) // 2)

            for j in range(len(supported[i])):
                text_color = curses.color_pair(1)

                if supported[i][j] == current[i]:
                    text_color = curses.color_pair(2)

                if i == hover[0] and j == hover[1]:
                    text_color = curses.color_pair(3)# | curses.A_UNDERLINE

                stdscr.addstr(row_pos+i, col_pos, supported[i][j], text_color)
                col_pos += len(supported[i][j]) + 1

        stdscr.refresh()

        key = stdscr.getkey()

        if key == 'h':
            if hover[1] > 0:
                hover[1] -= 1
        elif key == 'l':
            if hover[1] < len(supported[hover[0]]) - 1:
                hover[1] += 1
        elif key == 'j':
            if hover[0] < len(supported) - 1:
                hover[0] += 1
                hover[1] = 0
        elif key == 'k':
            if hover[0] > 0:
                hover[0] -= 1
                hover[1] = 0
        elif key == ' ':
            current[hover[0]] = supported[hover[0]][hover[1]]
        elif key == '\n':
            subprocess.run(['set-theme', current[0], current[1], current[2]])
        elif key == 'q':
            break

wrapper(main)
