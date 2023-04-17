import csv

def write(data, fieldnames):
    # Write the data to a CSV file
    with open('output.csv', mode='w', newline='') as csv_file:
        writer = csv.DictWriter(csv_file, fieldnames=fieldnames)
        writer.writeheader()
        for row in data:
            writer.writerow(row)

if __name__ == '__main__':
    # Define the headers for the CSV file
    fieldnames = ['highschool-gpa', 'test-score', 'extracurricular-quality', 'award-quality', 'recommendation-quality',
                  'competitive-score']

    # Define a list of dictionaries representing the data
    data = [
        {'highschool-gpa': 3.8, 'test-score': 1350, 'extracurricular-quality': 4, 'award-quality': 3,
         'recommendation-quality': 4, 'competitive-score': 87},
        {'highschool-gpa': 4.0, 'test-score': 1420, 'extracurricular-quality': 5, 'award-quality': 4,
         'recommendation-quality': 5, 'competitive-score': 93},
        {'highschool-gpa': 3.5, 'test-score': 1200, 'extracurricular-quality': 3, 'award-quality': 2,
         'recommendation-quality': 3, 'competitive-score': 75},
        {'highschool-gpa': 3.2, 'test-score': 1150, 'extracurricular-quality': 2, 'award-quality': 1,
         'recommendation-quality': 2, 'competitive-score': 60},
        {'highschool-gpa': 3.9, 'test-score': 1390, 'extracurricular-quality': 5, 'award-quality': 4,
         'recommendation-quality': 5, 'competitive-score': 91},
    ]

    write(data, fieldnames)




