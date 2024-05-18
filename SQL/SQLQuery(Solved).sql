
-- To avoid any errors, check missing value / null value 
---------Corona_Virus is table Name

-- Q1. Write a code to check NULL values
       Select * from Corona_Virus Where [Country/Region] is null

--Q2. If NULL values are present, update them with zeros for all columns. 
      update Corona_Virus set [Date] = 0 where [Date] is null

-- Q3. check total number of rows
		select Count([Country/Region]) as Total_Rows from corona_Virus

-- Q4. Check what is start_date and end_date
		select Min([Date]) as Start_Date, Max([Date]) as Last_Date from Corona_Virus
		
-- Q5. Number of month present in dataset
		select Count( Distinct( DATEPART(Month, [Date]))) as Month from Corona_Virus 

-- Q6. Find monthly average for confirmed, deaths, recovered
		select DATENAME(Month,[Date]) as [Month], AVG(Confirmed) as Average_Confirmed,
		AVG(Deaths) as Average_Deaths, AVG(Recovered) as Average_Recovered
		From Corona_Virus
		Group By DATENAME(Month,[Date]) order by [Month]

-- Q7. Find most frequent value for confirmed, deaths, recovered each month 
	   select Top(1)Confirmed as Value,Count(Confirmed) as Most_Confirmed,
	   Count(Deaths) as Most_Deaths, Count(Recovered) as Most_Recovered
	   from Corona_Virus
	   Group By Confirmed


-- Q8. Find minimum values for confirmed, deaths, recovered per year
		select DATENAME(YEAR,[Date]) as [Month], Min(Deaths) as Min_Deaths,
		Min(Confirmed) as Min_Confirmed, Min(Recovered) as Min_Recovered 
		from corona_Virus	   
		Group by DATENAME(YEAR,[Date])

-- Q9. Find maximum values of confirmed, deaths, recovered per year
		select DATENAME(YEAR,[Date]) as [Month], MAX(Deaths) as Min_Deaths,
		MAX(Confirmed) as Min_Confirmed, MAX(Recovered) as Min_Recovered 
		from corona_Virus	   
		Group by DATENAME(YEAR,[Date])


-- Q10. The total number of case of confirmed, deaths, recovered each month
		select DATENAME(MONTH,[Date]) as [Month], MAX(Deaths) as Min_Deaths,
		MAX(Confirmed) as Min_Confirmed, MAX(Recovered) as Min_Recovered 
		from corona_Virus	   
		Group by DATENAME(Month,[Date])


-- Q11. Check how corona virus spread out with respect to confirmed case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
		
		select Count(Confirmed) as Total_Confirmed, AVG(Confirmed) as Average_Confirmed,
		STDEV(Confirmed) as Standerd_Dev from Corona_Virus

-- Q12. Check how corona virus spread out with respect to death case per month
--      (Eg.: total confirmed cases, their average, variance & STDEV )
		
		select Datename (Month, [Date]) as Month, Count(Deaths) as Total_Confirmed,
		Round(AVG(Deaths),0) as Average_Confirmed,
		Round(STDEV(Deaths),0) as Standerd_Dev from Corona_Virus
		Group by Datename (Month, [Date])

-- Q13. Check how corona virus spread out with respect to recovered case
--      (Eg.: total confirmed cases, their average, variance & STDEV )
		
		select Count(Recovered) as Total_Confirmed,
		Round(AVG(Recovered),0) as Average_Confirmed,
		Round(STDEV(Recovered),0) as Standerd_Dev from Corona_Virus
		
-- Q14. Find Country having highest number of the Confirmed case
		select Top(1)[Country/Region], Max(Confirmed) as Max_Confirmaed
		from Corona_Virus 
		Group by [Country/Region] order by Max(Confirmed) desc
		
-- Q15. Find Country having lowest number of the death case
		select Top(1)[Country/Region], Max(Confirmed) as Max_Confirmaed
		from Corona_Virus 
		Group by [Country/Region] order by Max(Confirmed) Asc
		

-- Q16. Find top 5 countries having highest recovered case
		select Top(5) [Country/Region], Count(Recovered) as Highest_Recovered
		from corona_Virus
		Group by [Country/Region] order by Highest_Recovered Desc
