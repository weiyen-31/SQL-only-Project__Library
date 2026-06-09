# Library Data Analysis (EDA Project)

## Project Overview
This project analyzes library borrowing behavior to understand member return pattern and borrowing pattern by genre.
The objective is identify high-risk borrowers with late-return behavior and evaluate most popular and frequently borrowed book genres in this library.

Note: This project focuses on Exploratory Data Analysis (EDA) only, and does not include dedicated data cleaning phase, as the dataset was assumed to be pre-cleaned for analytical purposes.

## Bussines Questions
  1. Which members tend to return books late, especially with significant delays?
  2. Which book genres are the most popular in terms of borrowing activity?
  3. How long do users typically keep books by genre?

## Dataset
  - Members
  - Books
  - Borrowings

## SQL Workflow
### Analysis 1: Overdue Borrowing Behavior
  - Identified overdue borrowings where return date exceeded due date
  - Calculated number of overdue days per transaction
  - Classified delay severity (Minor Delay, Short Delay, Moderate Delay, Significant Delay, Severe Delay, Critical Delay)
  - Filtered members with severe delay (5 days overdue)

### Analysis 2: Genre Popularity Analysis
  - Calculated total borrowings per genre
  - Measured average borrowing duration per genre
  - Ranked genres using quartile scoring (NTILE)
  - Classified genres into popularity levels (Very Low → High)

## Key Result
### Overdue Borrowing Behavior
### Genre Popularity Analysis

## Insights

## Recommendations
