# 💼 Smart Job Portal

A full-stack web-based Job Portal built using Java (Servlets & JSP) and MySQL,
designed to simulate a real-world recruitment platform where users can register,
log in, apply for jobs, and manage applications, while recruiters can post and 
manage job listings.

---

## 🚀 Live Features

### 👤 User Features

* 🔐 User Registration & Login (Session-based authentication)
* 🔍 Browse available jobs with modern UI
* 📄 View detailed job descriptions
* ✅ Apply for jobs with duplicate prevention
* 📌 View "My Applications" dashboard
* ❌ Withdraw job applications

### 🧑‍💼 Recruiter Features

* 📝 Post new jobs
* ✏️ Edit existing job postings
* 🗑️ Delete jobs (only by owner)
* 🔒 Ownership-based access control

---

## 🎨 UI/UX Highlights

* 🌈 Modern gradient-based responsive design
* 📦 Card-based job listing layout (2 jobs per row)
* 🔔 Toast notifications (real-time feedback)
* ⚡ Smooth animations and hover effects
* 📱 Mobile responsive layout

---

## 🛠️ Tech Stack

| Layer    | Technology Used            |
| -------- | -------------------------- |
| Backend  | Java Servlets (Jakarta EE) |
| Frontend | JSP, HTML, CSS, JavaScript |
| Database | MySQL                      |
| Server   | Apache Tomcat 10           |
| IDE      | Eclipse                    |

---

## 🗄️ Database Design

### Tables Used:

* **users** → Stores user details
* **jobs** → Stores job postings (with `posted_by`)
* **applications** → Stores applied jobs

### Key Features:

* 🔁 Duplicate application prevention
* 🔐 Session-based user tracking
* 🧠 Relational mapping using JOIN queries

---

## 🔑 Key Functionalities Implemented

* ✔ Session Management (Login/Logout)
* ✔ CRUD Operations (Create, Read, Update, Delete)
* ✔ Role-based Access Control (Job Owner Permissions)
* ✔ Data Validation & Error Handling
* ✔ Clean UI with real-time feedback

---

## 📂 Project Structure

``
SmartJobPortal/
│
├── src/
│   └── com.jobportal (Servlets & DB Connection)
│
├── WebContent/ or webapp/
│   ├── *.jsp (UI Pages)
│   └── WEB-INF/
│       └── web.xml
│
└── README.md
```

---

## ⚙️ How to Run the Project

1. Import project into Eclipse
2. Configure Apache Tomcat 10
3. Setup MySQL database:

   * Create database: `job_portal`
4. Update DB credentials in `DBConnection.java`
5. Run project on server
6. Open in browser:

```
http://localhost:8080/SmartJobPortal/
```

---

## 💡 Future Enhancements

* 🔍 Job search & filtering
* 📊 Admin dashboard
* 📎 Resume upload feature
* 🌐 Cloud deployment (AWS / Render)
* 📧 Email notifications

---

## 👨‍💻 Author

**Mo Jahangeer**
Aspiring Software Developer | Java & Web Technologies

---

## ⭐ Final Note

This project demonstrates strong understanding of:

* Backend development using Java
* Database integration with MySQL
* Real-world application logic
* UI/UX improvement techniques

If you like this project, consider giving it a ⭐ on GitHub!
