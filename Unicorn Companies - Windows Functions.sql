
-- First step in answering this question is converting columns to appropriate data types
Update unicorn_companies
Set Date_Joined = str_to_date(Date_Joined, "%m/%d/%Y");

-- Rank top 10 most valuable Asian companies outside China
Select Company,Industry, Country, Valuation_ $Bn,
Rank() Over(Order by Valuation_$Bn desc) as Ranking,
Dense_Rank() Over(Order by Valuation_$Bn desc) as Dense_Ranking,
Row_Number() Over(Order by Valuation_$Bn desc) as Row_No
From unicorn_companies  
Where Continent = 'Asia' and Country <> 'China'
Limit 10;

-- Select the top 5 percentile of companies funded in each continent
Select *
From (
Select company, industry, Continent, Funding_$Bn,
Percent_Rank() Over (Partition by Continent order by Funding_$Bn) as Funding_Percentile
From unicorn_companies)a
Where Funding_Percentile >= 0.95;

-- Split South American start ups into 5 buckets based on their valuation
Select Company, Industry, Country, Funding_$Bn,
Ntile(5) Over ( Order by Funding_$Bn Desc) as Funding_Group
From unicorn_companies
Where Continent = 'South America';

-- Year on Year change in No of New Unicorns
 Select Year(Date_Joined) as Year , Count(Year(Date_Joined)) as No_of_Unicorns,
 Lag(Count(Year(Date_Joined)), 1, 0) Over(Order by (Year(Date_Joined))) as Previous_Year,
 Count(Year(Date_Joined)) - Lag(Count(Year(Date_Joined)), 1, 0) Over(Order by (Year(Date_Joined))) as YonY_Change
 From unicorn_companies
 Group by 1
 Order by 1;
 
 --  Difference in Industry Funding compared to Next Industry 
 Select Industry, Round(SUM(Funding_$Bn),2) as Industry_Funding,
 Lead(Round(SUM(Funding_$Bn),2),1) Over(Order by Sum(Funding_$Bn) ) as Next_Industry,
 Round(Lead(Round(SUM(Funding_$Bn),2),1) Over(Order by Sum(Funding_$Bn) ) - Round(SUM(Funding_$Bn),2),2)as Funding_Difference
 From unicorn_companies
 Group by 1
 Order by 2;
--  
Select Industry, Count(Company) as No_of_Companies, Round(Valuation_$Bn/Funding_$Bn,2) as Avg_Returns,
First_Value(Valuation_$Bn/Funding_$Bn) Over(Order by Valuation_$Bn/Funding_$Bn Desc) as Highest_Return
From unicorn_companies
Group by 1
Order by 3 Desc;

-- List Companies with over 20X Returns stating the highest and lowest return by Industry 
Select Company, Industry, Country, Round(Valuation_$Bn/Funding_$Bn,2) as ROI,
First_Value(Company) Over (Partition By Industry Order by Valuation_$Bn/Funding_$Bn Desc) as Highest_Return,
Last_Value(Company) Over (Partition By Industry Order by Valuation_$Bn/Funding_$Bn Desc
RANGE BETWEEN UNBOUNDED PRECEDING AND UNBOUNDED FOLLOWING) as Lowest_Return
From unicorn_companies
Where (Valuation_$Bn/Funding_$Bn) >= 20
Order by Industry;

-- Find the 2nd Funded City and No of companies per city in Megacities (cites with over 10bn Funding)
Select City, Country, Count(Company) as No_of_Companies, Round(Sum(Funding_$Bn),2) as Total_Funding,
Nth_Value(City,2) Over(Order by Sum(Funding_$Bn) Desc ) as 2nd_Funded_City
From unicorn_companies
Group by City
Having Total_Funding >= 10
Order by Total_Funding Desc




 
 



