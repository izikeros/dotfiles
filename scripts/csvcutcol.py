#!/usr/bin/env python3
import argparse
import csv

def start(col_idx, fname):
    with open(fname, 'rt') as csvfile:
        reader = csv.reader(csvfile, quotechar='"')
        for row in reader:
            print(row[col_idx]) # row[-1] gives the last column

if __name__ == '__main__':
    parser = argparse.ArgumentParser(description="Cut selected column from the csv file.")

    #positional arguments
    parser.add_argument('file_name', help="Path to the file to be parsed.")

    # named parameters
    parser.add_argument('-c', "--column", help="index if the column (starting from 0)", type=int)

    args = parser.parse_args()
    start(args.column, args.file_name)
