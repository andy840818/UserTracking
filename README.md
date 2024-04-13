# User Activity Tracking and Analysis Platform
## Objective: 
Build a Ruby on Rails application that is capable of handling user activity tracking data, analyzing, generate report, and provide a dashboard.
## Features and Functionalities:
**Receive Activity Tracking data :**  
Develop a RESTful API to receive user activity tracking data.
**The tracking data includes:**
- user id, 
- user name, 
- timestamp,
- action,
- action parameters.
**Actions includes:** 
- user sign in,
- user sign out ,
- user sign up,
- user reset password,
- visit homepage,
- visit new booking page,
- submit new booking, 
- click booking item,
- visit booking detail page,
- cancel booking.

**Dashboard: the dashboard will shows**
Daily
* Daily active users number
* Daily booking number
* Daily Average user booking period (user booking period = the time between user entering new booking page and submit a new booking)
* Daily 99th percentile user booking period
* Daily maximum user booking period
Weekly
* Weekly active users number
* Weekly booking number

## Tech Stack
![TailwindCSS](https://img.shields.io/badge/-TailwindCSS-06B6D4?logo=tailwindcss&logoColor=white&style=for-the-badge)
![Ruby](https://img.shields.io/badge/-Ruby-CC342D?logo=ruby&logoColor=white&style=for-the-badge)
![Rails](https://img.shields.io/badge/-Rails-D30001?logo=rubyonrails&logoColor=white&style=for-the-badge)
![PostgreSQL](https://img.shields.io/badge/-PostgreSQL-4169E1?logo=postgresql&logoColor=white&style=for-the-badge)

## Libraries
- Devise: Used for authentication. It handles user registration, logging in and out, and password recovery.
- Whenever: A Ruby gem that provides a clear syntax for writing and deploying cron jobs.

## System Operation
### Architecture & Workflow
The User Activity Tracking and Analysis Platform is designed to efficiently capture, process, and analyze user activity data, providing actionable insights through a user-friendly dashboard. Here’s a breakdown of how the system operates:

**Data Collection:** Utilizing a RESTful API, the platform receives activity data from users. This data includes essential information such as user ID, name, actions performed (e.g., sign in, sign out, page visits), and the corresponding timestamps.

**Data Processing:** Once collected, the data undergoes processing where it is analyzed for patterns, trends, and other metrics critical for understanding user behavior. This includes calculating daily and weekly active user numbers, booking numbers, and various other performance metrics.

**Dashboard Display:** The processed data is then visualized on a dashboard, providing a comprehensive overview of user activities. The dashboard highlights key metrics such as daily and weekly active users, booking numbers, and user engagement durations. It serves as a central place for administrators to monitor and understand user interactions with the platform.

**Reporting:** The platform also includes functionality to automatically generate and send out daily and weekly summaries via email to administrators. These reports include all the metrics displayed on the dashboard, ensuring that key stakeholders are always informed of the latest trends and user behaviors.

### Scheduled Tasks
To ensure timely data processing and report generation, the platform leverages the Whenever gem to manage scheduled tasks. This includes:

- Daily tasks for processing the previous day's data and updating the dashboard.
  **Daily Statistics** Generation runs every day at 12:00 AM, preparing data for the day-ahead.
- Weekly tasks for summarizing weekly activities and updating relevant metrics.
  **Weekly Statistics** Generation kicks off every Monday at 12:00 AM, summarizing the past week's data.
- Automated email dispatches that send out the daily and weekly summaries to administrators.
  **Daily Summary** Reports are dispatched every day at 8:00 AM, offering insights into the previous day's activities.
  **Weekly Summary** Reports are sent every Monday at 8:00 AM, providing a weekly overview to administrators.

### Security & Authentication
With Devise handling user authentication, the platform ensures secure access controls and data protection. It manages user sessions, registrations, and password recoveries, maintaining a secure environment for both users and administrators.