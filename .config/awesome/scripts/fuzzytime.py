from datetime import datetime

def FuzzyTime():
    hour_text = {
        1: "one",
        2: "two",
        3: "three",
        4: "four",
        5: "five",
        6: "six",
        7: "seven",
        8: "eight",
        9: "nine",
        10: "ten",
        11: "eleven",
        12: "twelve",
        13: "one"
    }

    min_text = {
        5: "five",
        10: "ten",
        15: "a quarter",
        20: "a third",
        25: "twenty five",
        30: "half"
    }

    now = datetime.now()
    hour = int(now.strftime("%I"))
    min = int(now.strftime("%M"))

    rounded_min = 5 * round(min/5)

    if (min >= 0 and min < 5):
        return f"It's {hour_text[hour]} o'clock"
    elif rounded_min >= 5 and rounded_min <= 30:
        return f"It's {min_text[rounded_min]} past {hour_text[hour]}"
    elif rounded_min > 30 and rounded_min <= 55:
        return f"It's {min_text[60 - rounded_min]} til {hour_text[hour + 1]}"
    elif rounded_min == 60:
        return f"It's {hour_text[hour + 1]} o'clock"

if __name__ == "__main__":
    print(FuzzyTime())