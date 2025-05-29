# 📘 Lesson 2: Overview of Data Source Types and Loading Scenarios

---

## 🎬 Intro (00:00–01:00)

**🎙️ Voiceover:**  
Welcome back! In this lesson, we’ll explore the various types of data sources you’ll encounter in ETL testing — and the different ways data is loaded from those sources. We’ll also walk through a real-world example to help you identify the right loading strategy.

*Slide: Lesson Title — “Data Sources and Loading Scenarios” + visual of databases, files, and APIs*

---

## 🔍 Part 1: Types of Data Sources (01:00–04:00)

*Slide: “Where Data Comes From” — icons or visuals of: file folder, database, cloud/API*

**🎙️ Voiceover:**  
In any ETL process, data can come from a variety of sources. You’ll likely come across:

- **Files** — CSV, Excel, XML, JSON files often stored on SFTP servers or in data lakes.  
- **APIs** — especially for external systems like CRMs, payment gateways, or social platforms.  
- **Databases** — internal systems like ERP or CRM applications, often with structured data in SQL databases.

Each of these has its own quirks:
- Files might arrive with inconsistent formats.  
- APIs may have rate limits or authentication flows.  
- Databases may expose only views or stored procedures for extraction.

*On screen: Small table comparing pros/cons of each source type*

---

## 🔄 Part 2: Types of Data Loads (04:00–10:00)

*Slide: “Types of ETL Loads” — visual timeline with labels: Initial, Incremental, CDC, SCD*

**🎙️ Voiceover:**  
Let’s look at the main types of data loading strategies:

1. **Full Load (One-time Load)**  
   - All data is loaded from scratch every time.  
   - Easy to implement, but not efficient for large volumes.

2. **Incremental Load**  
   - Only new or changed records are loaded based on a timestamp or key.  
   - This is the most common pattern for day-to-day ETL pipelines.

3. **CDC (Change Data Capture)**  
   - Tracks inserts, updates, and deletes using logs or triggers.  
   - More advanced, but enables high-accuracy updates.

4. **SCD (Slowly Changing Dimensions)**  
   - Applies to dimension tables where historical changes need to be tracked.  
   - **SCD Type 1**: Overwrites old data  
   - **SCD Type 2**: Keeps full history  
   - **SCD Type 3**: Keeps limited history (e.g., previous value in separate column)

**🎙️ Voiceover:**  
As a tester, you’ll often be verifying whether the right method was used — and if it behaves as expected in different scenarios.

*Slide: “How to Detect Load Type” — summary table of behavior (e.g., full = all rows every time, incremental = new rows only, etc.)*

---

## 🧠 Part 3: Practical Exercise (10:00–13:00)

*Slide: “Practice: What Load Type Is This?”*

**🎙️ Voiceover:**  
Let’s say a company has a product pricing system. Prices change often, but only current prices are relevant — history is not needed.

**Question:** What type of loading would you recommend?

**Options:**
- A) Full load  
- B) Incremental  
- C) SCD Type 2

**🎙️ Voiceover:**  
Correct answer? ✅ **B) Incremental load**  
You’d want to only pull changed prices and overwrite them in the target system.  
SCD isn’t needed because history isn’t tracked.

---

## 📌 Part 4: Summary (13:00–15:00)

*Slide: “Key Takeaways”*

**🎙️ Voiceover:**  
Here’s what we covered today:

- Data can come from files, APIs, and databases — each with its own testing considerations.  
- There are multiple load strategies:  
  - Full load  
  - Incremental load  
  - CDC  
  - Slowly Changing Dimensions (SCD)  
- Choosing the right one depends on the business requirement — and as a tester, you’ll need to know how to identify and validate them.

Next time, we’ll dive into staging layer testing and how to check if transformations are working as expected.

*Slide: “Next Lesson: Testing Transformations”*
