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
  - A subset of members consistently exceed due dates by significant margins
  - Late returns are concentrated in a small group of users, rather than being evenly distributed
    
### Genre Popularity Analysis
  - Historical Fiction, Fiction and Romance had more borrowing activity than others.
  - Adventure Fiction and Magical Realism is classified as "very low" class
  - Average borrowing duration is relatively similar across genres.
  - Genres in high demand don't necessarily correspond to longer borrowing periods.
    
## Insights
- Overdue severity classification helps identify problematic borrowing behavior
- Severe overdue cases indicating some borrowers may require additional return reminders or monitoring.
- Genre popularity is uneven, with a few genres accounting for most borrowing activity
- Reader preferences are concentrated in a few genres, indicating stronger demand for fiction-related content.
  
## Recommendations
- Implement automated due-date reminders to reduce overdue cases.
- Monitor borrowers with repeated late-return behavior and provide targeted notifications.
- Allocate more acquisition budget to high-demand genres such as Historical Fiction, Fiction, and Romance.
- Increase the number of copies available for popular genres to reduce waiting times.
- Promote the less frequently borrowed genres through recommendations or reading campaigns to diversify borrowing patterns.

## Tools Used
- SQL (CTE, JOIN, Aggregation)
- Window Functions (NTILE)
- CASE WHEN classification logic
- Date calculations (DATEDIFF)
