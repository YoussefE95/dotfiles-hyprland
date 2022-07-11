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
        12: "twelve"
    }

    min_text = {
        5: "five",
        10: "ten",
        15: "a quarter",
        20: "a third",
        25: "twenty five",
        30: "a half",
        35: "thirty five",
        40: "two thirds",
        45: "three quarters",
        50: "fifty",
        55: "fifty five"
    }

    now = datetime.now()
    hour = int(now.strftime("%I"))
    min = int(now.strftime("%M"))
    cycle = now.strftime("%P")
    suffix = ""

    if cycle == "am":
        suffix = "morning"
    elif cycle == "pm" and (hour == 12 or (hour >= 1 and hour <= 5)):
        suffix = "afternoon"
    elif cycle == "pm" and (hour >= 6 and hour <= 11):
        suffix = "evening"

    if (min >= 1 and min < 5) or round(min/5) == 60:
        return f"It's {hour_text[hour]} o'clock in the {suffix}"
    else:
        return f"It's {min_text[5 * round(min/5)]} past {hour_text[hour]} in the {suffix}"

if __name__ =='__main__':
    print(FuzzyTime())