# Smart Class Check-in & Learning Reflection App

## Problem Statement
The university needs a system to verify that students are physically present in class and actively engaged. The solution should capture GPS location, QR code scans, and student reflections before and after class sessions. This will improve attendance tracking, transparency, and teaching quality.

## Target Users
- **Students**: Check in to class and reflect on their learning.
- **Instructors**: Verify attendance and receive feedback.
- **Administrators**: Monitor participation and learning reflections.

## Features
1. **Class Check-in (Before Class)**
   - Press "Check-in"
   - Record GPS location and timestamp
   - Scan class QR code
   - Fill in:
     - Topic covered in the previous class
     - Expected topic for today
     - Mood before class (scale 1–5)

2. **Class Completion (After Class)**
   - Press "Finish Class"
   - Scan QR code again
   - Record GPS location
   - Fill in:
     - What was learned today
     - Feedback about the class or instructor

## User Flow
- Open app → Select **Check-in** → Scan QR → Fill form → Save data  
- End of class → Select **Finish Class** → Scan QR → Fill form → Save data  

## Data Fields
- Student ID  
- GPS Location  
- Timestamp  
- QR Code value  
- Previous Topic  
- Expected Topic  
- Mood (1–5)  
- Learned Today (short text)  
- Feedback (short text)  

## Tech Stack
- **Frontend:** Flutter (Dart)  
- **Local Storage (MVP):** SQLite / localStorage  
- **Backend/Deployment:** Firebase Hosting (Web demo)  
- **Libraries:**  
  - `geolocator` (GPS)  
  - `qr_code_scanner` (QR integration)  
  - `sqflite` (SQLite storage)  
  - `firebase_core`, `firebase_hosting` (deployment)  
