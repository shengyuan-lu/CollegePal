import csv
import random

def write(data, fieldnames):
    # Write the data to a CSV file
    with open('find_my_fit_data.csv', mode='w', newline='') as csv_file:
        writer = csv.DictWriter(csv_file, fieldnames=fieldnames)
        writer.writeheader()
        for row in data:
            writer.writerow(row)

def generate_data(rows=1000):

    data = list()

    for i in range(0, rows):

        normalized_score = random.uniform(0.0, 1.0)

        admissions_rate = 1 - normalized_score

        random_factor = random.uniform(-0.05, 0.05)

        admissions_rate += random_factor

        data.append({'normalized_score': normalized_score, 'admissions_rate': admissions_rate})

    return data


if __name__ == '__main__':
    # Define the headers for the CSV file
    fieldnames = ['normalized_score', 'admissions_rate']

    data = generate_data()

    write(data, fieldnames)




