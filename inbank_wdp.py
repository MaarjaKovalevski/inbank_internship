# The commented lines show another way to put the additional column into the generated file.
# This method utilises the date function of the datetime library.
# This way the file will have an accurate title and data according to the current date.
# For consistency, and I'm guessing automated testing using current files,
#   I chose to keep the baked in dates :)



# from datetime import date
# today = date.today().strftime("%Y-%m-%d")
saturday = open("data_2023-02-11.csv", "r", encoding="UTF-8")
sunday = open("data_2023-02-12.csv", "r", encoding="UTF-8")
newfile = open("data_2023-02-13.csv", "w", encoding="UTF-8")
# newfile = open("data_" + today + ".csv", "w", encoding="UTF-8")
newfile.write(saturday.readline().strip() + ';generation_date\n')
sunday.readline()
for day in [saturday, sunday]:
    for item in day:
        # newfile.write(item.strip() + ';' + today + '\n')
        newfile.write(item.strip() + ';2023-02-13\n')
    day.close()
newfile.close()