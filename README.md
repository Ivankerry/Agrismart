# 🌾 AgriSmart – Smart Farming & Workforce Management Platform

**AgriSmart** is an AI-powered smart farming and workforce management solution designed to help farmers around the world improve productivity, transparency, and sustainability. Built with Flutter and Firebase, AgriSmart provides tools for smart scheduling, payroll automation, timesheets, and more.

---

## 🚀 Project Status

This project is under active development. So far, we have completed:

- ✅ **User Authentication** (Firebase Auth)
- ✅ **Roster Page** (`rosters_page.dart`) – featuring employee scheduling, interactive cards, and dynamic shifts
- ✅ **Firebase Integration** – Authentication, Firestore setup
- ✅ **Project Structure Setup** with modular Dart files
- ✅ **UI Prototypes** for login, dashboard, and scheduling
- 🔄 **Currently Working On:** Expanding functionality of roster, tasks, payroll, and integrating Firebase Firestore DB

---

## 🧠 Core Features

### ✅ Authentication
- Firebase Auth with email/password login
- Secured user sessions
- Email authentication 

### 📅 Rosters Module
- Employee scheduling interface
- Card-style view of work shifts
- Real-time updates (coming soon)

### 🧾 Payroll (Planned)
- Built-in payroll system tailored for agriculture
- Automatic minimum wage top-ups
- Integration with tax authorities and banks

### ⏱️ Timesheets (Planned)
- Offline and online time entry for employees
- Biometric integration (future)
- Remuneration report generation

### 🛠️ Tasks (Planned)
- Assign tasks with built-in notifications
- Task Wish-list feature
- Dashboard tracking of task completion

### 🌍 Health & Safety (Planned)
- Site induction via QR codes
- Risk and incident management
- Toolbox meeting notes logging

### 💰 Job Costing (Planned)
- Real-time job cost tracking
- Integration with accounting software (e.g. Xero)
- Supplier and machinery cost handling

---

## 🛠️ Tech Stack

| Tech | Description |
|------|-------------|
| **Flutter** | Cross-platform mobile app development |
| **Firebase** | Authentication, Firestore, Cloud Functions |
| **Dart** | Language powering the Flutter UI |
| **Firestore** | Cloud NoSQL database for real-time data |
| **GitHub Actions** *(optional)* | Future CI/CD setup for deployment/testing |

---

## 📁 Project Structure (So Far)

lib/ │ ├── auth/ │ └── login_page.dart │ ├── pages/ │ ├── home_page.dart │ └── rosters_page.dart │ ├── widgets/ │ └── roster_card.dart │ ├── services/ │ └── firebase_service.dart │ ├── main.dart


---

## 🔧 Getting Started

### 1. Clone the Repo
```bash
git clone https://github.com/Ivankerry/Agrismart.git
cd Agrismart

### 2. Install Dependencies
flutter pub get

### 3. Run the App
flutter run


## 💬 Contribution

Want to contribute? Awesome!
Fork the repo
Create a new branch (feature/your-feature-name)
Commit your changes
Push to your fork
Create a Pull Request

## 📄 License
This project is open source under the MIT License.

