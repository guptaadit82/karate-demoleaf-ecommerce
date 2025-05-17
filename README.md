# 📦 Broadleaf Commerce End-to-End API Testing Framework

> A **comprehensive Karate-based testing framework** designed to automate real-world REST, SOAP, and performance scenarios for the [Broadleaf Commerce](https://demo.broadleafcommerce.org/) demo application.  
>
> 🔍 Realistic E2E API coverage | ⚙️ Data-driven tests | 🚀 CI/CD ready | 📊 Performance tested | 🔐 Auth & Security tested | 🧰 Modular & Reusable design  

---

## 🌐 Project Structure - refer to structure.txt file 
---

## ✅ Features Covered

- **🛒 Cart Functionality**: Add, update, delete items, clear offers, and perform complete checkout.
- **🏠 Customer Address and Payment**: Add/update/delete address, apply payment methods, validate customer details.
- **🔄 Order Management**: Update order attributes, quantities, items, and retrieve order summaries.
- **🧾 Tax Calculation via SOAP**: Tested CyberSource Tax Module using SOAP/XML payloads.
- **📊 Performance Testing (Gatling)**: Karate + Gatling integration for cart & checkout load simulation.
- **📁 Data-driven Testing**: External JSON/CSV files for test reusability.
- **🔐 Authentication Support**: Header tokens and session-based authentication handled.
- **💾 DB Validations** (Optional): Sample JDBC utilities setup for backend verification.
- **💻 CI/CD Integration**: Ready for Jenkins/GitHub Actions pipelines with HTML + JUnit reports.
- **🧪 Mocking & Negative Testing**: Simulate responses and test invalid requests/responses.

---

## ⚙️ Prerequisites

- Java 17+
- Maven 3.8+
- Karate 1.4.1+
- IDE (IntelliJ or VSCode)
- Optional: PostgreSQL/MySQL for DB validations
- Optional: Gatling plugin installed for perf testing

.

🧠 Learnings and Best Practices
🔁 Reusable & modular Karate tests using common steps & hooks

🧩 SOAP API automation with XML payloads and dynamic headers

🧪 Real-world E2E testing and validation flows

📈 Load & stress tests with Gatling integration

🧵 Jenkins/GitHub Actions CI/CD compatible with detailed reports

🧹 Mock testing, resilience checking, and status validations

🔄 Retry & assertion logic, parameterized testing

🗃️ Followed industry-grade folder and naming conventions


🧩 Integration Ideas
📦 Jenkins CI pipelines with HTML + JUnit reporting

📊 Push performance metrics to Grafana from Gatling

📁 External test data injection via Excel/DB

🔁 Retry logic with Karate hooks and JS

📚 Enhanced reporting with Allure integration

🧑‍💻 Expand to UI tests using Karate UI in future


🙋‍♂️ Author
Aditya Narayan
🧑‍💻 Software Engineer @ LTIMindtree | API Automation | DevOps Enthusiast
