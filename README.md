# Microsoft_SQL_Interview_Question_on_Flight_Routes
## ✈️ Direct & 1-Stop Flight Route Finder: New York ↔ Tokyo
### 📦 Overview

This project demonstrates, with SQL, how to efficiently identify **all possible airline routes between New York and Tokyo** using flight and airport data. The solution covers both **direct flights** and **one-stop connections** (at most one layover), and calculates the total journey duration for each route.  
It’s a practical scenario to showcase SQL skills in querying, joining, and handling real-world travel data.

---

### 🚀 Problem Statement

Given two tables:

- **airports**: airport codes and city names.
- **flights1**: flight ID, start/end airport codes, and scheduled departure/arrival times.

**Objective:**  
List all valid flight routes from New York to Tokyo including:
- Direct flights (no layover)
- 1-stop connecting flights (at most one layover; layover arrival ≤ next departure)

For every route, show:
- The flight segment(s) (IDs)
- Origin city (`start_city`)
- Layover (`middle_city` if any)
- Destination (`end_city`)
- Total trip duration in minutes

---

### 🗂️ Sample Input

#### Airports

| port_code | city_name     |
|-----------|--------------|
| JFK       | New York     |
| LGA       | New York     |
| EWR       | New York     |
| LAX       | Los Angeles  |
| ORD       | Chicago      |
| SFO       | San Francisco|
| HND       | Tokyo        |
| NRT       | Tokyo        |
| KIX       | Osaka        |

#### Flights

| flight_id | start_port | end_port | start_time          | end_time            |
|-----------|------------|----------|---------------------|---------------------|
| 1         | JFK        | HND      | 2025-06-15 06:00    | 2025-06-15 18:00    |
| 2         | JFK        | LAX      | 2025-06-15 07:00    | 2025-06-15 10:00    |
| 3         | LAX        | NRT      | 2025-06-15 10:00    | 2025-06-15 22:00    |
| 4         | JFK        | LAX      | 2025-06-15 08:00    | 2025-06-15 11:00    |
| 5         | LAX        | KIX      | 2025-06-15 11:30    | 2025-06-15 22:00    |
| 6         | LGA        | ORD      | 2025-06-15 09:00    | 2025-06-15 12:00    |
| 7         | ORD        | HND      | 2025-06-15 11:30    | 2025-06-15 23:30    |
| 8         | EWR        | SFO      | 2025-06-15 09:00    | 2025-06-15 12:00    |
| 9         | LAX        | HND      | 2025-06-15 13:00    | 2025-06-15 23:00    |
| 10        | KIX        | NRT      | 2025-06-15 08:00    | 2025-06-15 10:00    |

---

### 🎯 Sample Output

| flight_id | start_city | middle_city   | end_city | duration (minutes) |
|-----------|------------|---------------|----------|--------------------|
| 1         | New York   |               | Tokyo    | 720                |
| 2,3       | New York   | Los Angeles   | Tokyo    | 900                |
| 4,9       | New York   | Los Angeles   | Tokyo    | 900                |
| 2,9       | New York   | Los Angeles   | Tokyo    | 900                |

- For direct flights, `middle_city` is blank.
- For 1-stop flights, `middle_city` is the layover city.
- `duration` is the total elapsed time for the trip.

---

### 🦾 Approach

1. **Expand flights with city names** using joins to `airports` for both start and end ports.
2. **Direct routes:** Find flights with `start_city = 'New York'` and `end_city = 'Tokyo'`.
3. **1-stop routes:** Self-join flights via a common `end_port`/`start_port`, ensuring `a.end_time <= b.start_time`.
4. **Output:** Combine both via `UNION`, presenting direct and 1-stop routes with IDs, city labels, and duration in minutes.

---

---

### 📁 Directory Structure

| File/Directory        | Description                                    |
|----------------------|------------------------------------------------|
| README.md            | Project instructions and overview (this file)  |
Code
| ├─ input.sql         | SQL to create and populate tables              |
| ├─ routes_query.sql  | Main route-finding SQL script                  |
Assets
| flight_route_problem.jpg | (Optional) Route or schema visualizations      |

---

### 🤔 Notes

- Easily generalizes to other origin-destination pairs by changing city filters.
- Can incorporate further filters, such as minimum or maximum layover duration.
- Demonstrates best practices for SQL querying, including joins, self-joins, unions, and date/time calculations.
- Useful for interview preparation, data analysis, and real-world airline itinerary scenarios.

---

### 📜 License

MIT License

---

## 👨‍💻 Author

Asif Khan Mohammed.

linkedIN: [Link Text](https://www.linkedin.com/in/asif-khan-mohammed-aksi/).
email: [Link Text](asif.md1805@gmail.com).
github: [Link Text](https://github.com/asifkhan1805).

---

