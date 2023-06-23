# SQL---Window-Functions
Explaining the most popular SQL Windows Functions using examples

After mastering basic SQL concepts such as Select, From, Where, Joins, and Group By, Order By, to mention a few. Naturally, the next step is learning more advanced concepts like Windows Functions, Common Table Expressions (CTEs), Sub Queries, Pivots, Manipulating Datetimes etc. Knowledge of these concepts is what helps while attempting medium/advanced queries on StrataScratch and LeetCode during the interview prep phase.

This post focuses on 𝐖𝐢𝐧𝐝𝐨𝐰 𝐅𝐮𝐧𝐜𝐭𝐢𝐨𝐧𝐬, the clauses, categories and use of the 10 most popular types explained with examples. The Unicorn companies dataset which was sourced from the Maven Analytics data playground was sued in demonstrating these examples.

Firstly, what are Window Functions? They are special in-built functions in SQL that return a value from a group of rows for each row. This is executed by performing calculations across a set of table rows (windows) that are somehow related to the current row. Their usage makes SQL code faster to execute and easier to understand by others.

Window Functions have a particular syntax identified by 3 clauses namely;

* Over -  Defines the portion of rows to which the window function is applied 

* Partition By - This is a sub-clause of the Over clause. It divides the rows into small partitions to which the window function applies. If this clause is not specified, then the whole result set is treated as a single partition

* Order By - Specifies the order of rows in the partition i.e. ascending or descending. 

𝐒𝐲𝐧𝐭𝐚𝐱 𝐄𝐱𝐚𝐦𝐩𝐥𝐞: Window_Function_Name() Over (Partition_By colname Order_By colname )  

Generally, there are 3 categories of Window Functions based on the kind of output they generate.

* Aggregate Function - Avg(), Count(), Min(), Max(), Sum()

* Ranking Functions - Rank(), Dense_Rank(), Row_Number(), Percent_Rank(), Ntile()

* Value Functions - Lead(), Lag(), First_Value(), Last_Value(), Nth_Value(). Sometimes, the Ranking and Value functions are grouped as 𝐀𝐧𝐚𝐥𝐲𝐭𝐢𝐜𝐚𝐥 𝐅𝐮𝐧𝐜𝐭𝐢𝐨𝐧𝐬. Examples in the attached slide are for Analytical Functions as Aggregate Functions are considered part of basic SQL syntax.

![Uploading SQL - Windows Functions.jpg…]()
