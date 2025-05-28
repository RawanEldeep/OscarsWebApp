# Academy Awards Database Application

## Project Overview
This project is a **full-stack database application** for the Academy Awards (Oscars) covering all **96 iterations**. It allows users to explore detailed statistics and information about **nominated and winning movies, actors, directors**, and other staff members. The data is sourced and extracted from **Wikipedia** pages for each award year.

Unlike Wikipedia, this application provides **advanced filtering, aggregation, and user interaction** capabilities for deeper insights into the Oscars.

## Features

- Comprehensive database of all **nominations and winners** across 96 Academy Awards iterations.  
- Detailed information about movies: **name, release date, actors, directors, producers, production company, language, and runtime.**  
- Detailed profiles of actors, directors, producers including **full name, birth date and place, death date** (if applicable).  
- **User registration** with email, username, gender, age, birthdate, and country.  
- Users can add their own nominations for **any movie, category, and year.**  
- Query features include:  
  - View user nominations  
  - **Top nominated movies** by category and year  
  - Total nominations and Oscars for any **director, actor, or singer**  
  - **Top birth countries** for Best Actor winners  
  - Nominated staff by birth country with nomination and win stats  
  - **Dream Team:** best living cast members based on Oscars won  
  - Top production companies by Oscars won  
  - List of all **non-English movies** that won an Oscar  

## Technologies Used

- **Backend:** Flask (Python)  
- **Frontend:** HTML, CSS  
- **Web Scraping:** BeautifulSoup to extract data from Wikipedia Academy Awards pages  
- **Database:** MySQL for storing and querying all movie and nomination data  

### Installation & Setup

1. Clone the repository:  
   `git clone <repo-url>`  

2. Install dependencies:  
   `pip install -r requirements.txt`  

3. Change your directory to the OscarsWebApp file located in Milestone III folder.  


4. Start the Flask application:  
   `python app.py`  

5. Open your browser and go to `http://localhost:5000` to use the app.  

## Data Collection

A custom **web crawler** scrapes Wikipedia pages for all 96 iterations of the Academy Awards using BeautifulSoup. It parses nominee lists, winner details, and related actor/director profiles to populate the database.

