# 🎬 Introductory Lesson — Video Script (~15 minutes)

---

## ⏱️ 00:00 – 00:30  
**[On screen: course logo, title "Introduction to ETL Testing"]**

🎙️ **Voiceover:**  
Hi! Welcome to the ETL Testing course. If you work with data, want to understand how data warehouses are structured, or plan to build a career in the data domain — you're in the right place.

---

## ⏱️ 00:30 – 03:00  
### What is ETL / DWH

**[Slide: “ETL = Extract → Transform → Load”]**

🎙️ **Voiceover:**  
ETL is the process of extracting data from various sources, transforming it into the required format, and loading it into a Data Warehouse — or DWH. It’s the heart of any analytics system.

**[Slide animation: ETL flow diagram]**

🎙️ **Voiceover:**  
In practice, this means pulling data from Excel files, databases, APIs — cleaning and shaping it — and storing it in a structure suitable for analysis.

**[Example on screen: raw input table → cleaned DWH result]**

---

## ⏱️ 03:00 – 05:00  
### Who is an ETL Tester and What Do They Do

**[Slide: “ETL Tester — the role”]**

🎙️ **Voiceover:**  
Now let’s talk about the main character of this course. An ETL tester is a specialist who ensures that the data in the warehouse is correct, properly transformed, and aligned with business rules.

They work at the intersection of business and tech: they understand what the business wants, read SQL and ETL logic, and can spot calculation bugs, data duplicates, or missing records.

**[On screen: responsibility diagram — from testing loads to validating logic]**

🎙️ **Voiceover:**  
Often, the tester is the final checkpoint before analysts build dashboards or managers make decisions based on the data.

---

## ⏱️ 05:00 – 08:30  
### Mini-Architecture of a Typical DWH

**[Slide: “Data Warehouse Structure: Landing → Staging → Target”]**

🎙️ **Voiceover:**  
Now let’s look at how a typical data warehouse is organized. It usually has three layers:

- **Landing** — a 'dirty' zone. This is where raw, untouched data lands.
- **Staging** — a processing zone. Data is cleaned, joined, filtered here.
- **Target** — the final layer. This is where clean, business-ready tables live and feed reports and dashboards.

🎙️ **Voiceover:**  
You’ll work across all these layers. Sometimes checking if data arrived, sometimes if it was aggregated correctly, or if business rules were applied.

**[On screen: simple architecture diagram + ETL flow arrows]**

---

## ⏱️ 08:30 – 13:00  
### Required Knowledge

**[Slide: “What You Need to Know to Be a Good ETL Tester”]**

🎙️ **Voiceover:**  
What should an ETL tester be able to do? Here are the key skills:

1. **SQL** — the foundation. You need to write queries, perform joins, compare data, and find issues.
2. **Understanding of business logic** — so you can tell where data should look one way, and where another.
3. **Reading documentation** — like specs, mapping rules, aggregation logic. It’s important to compare the docs with reality and ask questions when things don’t add up.

🎙️ **Voiceover:**  
This isn’t manual testing in the usual sense. You’re working with systems, data flows, and business logic — and that makes this role both challenging and rewarding.

---

## ⏱️ 13:00 – 15:00  
### What’s Next in the Course?

**[Slide: “What’s Next in the Course?”]**

🎙️ **Voiceover:**  
In the next lessons, we’ll start with the basics — how to test simple 1:1 data loads. Then move on to transformations, aggregates, window functions, SCD, real-time data loads, and lots of practice.

🎙️ **Voiceover:**  
By the end of this course, you won’t just understand the theory — you’ll know how to write test cases, find bugs, and work like a real ETL QA engineer.

