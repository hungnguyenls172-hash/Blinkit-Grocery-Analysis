SELECT DISTINCT item_fat_content FROM blinkit_grocery_data;

UPDATE blinkit_grocery_data
SET Item_Fat_Content = 
    CASE 
        WHEN item_fat_content IN ('LF', 'low fat') THEN 'Low Fat'
        WHEN item_fat_content = 'reg' THEN 'Regular'
        ELSE item_fat_content
    END;

select 
	item_fat_content, 
	cast(sum(total_sales) as decimal (10,2)) as Total_Sales,
    cast(avg(total_sales) as decimal (10,2)) as Avg_Sales,
    count(*) as No_Of_Items,
    cast(avg(rating) as decimal (10,2)) as Avg_Rating
from blinkit_grocery_data
where outlet_establishment_year = 2020
group by item_fat_content
order by Total_Sales desc;

select 
	item_type,
    cast(sum(total_sales) as decimal (10,2)) as Total_Sales,
    cast(avg(total_sales) as decimal (10,2)) as Avg_Sales,
    count(*) as No_Of_Items,
    cast(avg(rating) as decimal (10,2)) as Avg_Rating
from blinkit_grocery_data
group by item_type
order by Total_Sales desc
limit 5;

SELECT 
    outlet_location_type,
    cast(SUM(CASE WHEN item_fat_content = 'Low Fat' THEN total_sales ELSE 0 END) as decimal (10,2)) AS Low_Fat,
    cast(SUM(CASE WHEN item_fat_content = 'Regular' THEN total_sales ELSE 0 END) as decimal (10,2)) AS Regular
FROM blinkit_grocery_data
GROUP BY outlet_location_type;

select 
	outlet_establishment_year,
    cast(sum(total_sales) as decimal (10,2)) as Total_Sales,
    cast(avg(total_sales) as decimal (10,2)) as Avg_Sales,
    count(*) as No_Of_Items,
    cast(avg(rating) as decimal (10,2)) as Avg_Rating
from blinkit_grocery_data
group by outlet_establishment_year
order by Total_Sales desc;

select 
	outlet_size,
    cast(sum(total_sales) as decimal (10,2)) as Total_Sales,
    cast((sum(total_sales) *100 / sum(sum(total_sales))  over()) as decimal (10,2)) as Sale_Percentage,
    cast(avg(total_sales) as decimal (10,2)) as Avg_Sales,
    count(*) as No_Of_Items,
    cast(avg(rating) as decimal (10,2)) as Avg_Rating
from blinkit_grocery_data
group by outlet_size
order by Total_Sales desc;

select 
	outlet_location_type,
    cast(sum(total_sales) as decimal (10,2)) as Total_Sales,
	cast((sum(total_sales) *100 / sum(sum(total_sales))  over()) as decimal (10,2)) as Sale_Percentage,
    cast(avg(total_sales) as decimal (10,2)) as Avg_Sales,
    count(*) as No_Of_Items,
    cast(avg(rating) as decimal (10,2)) as Avg_Rating
from blinkit_grocery_data
group by outlet_location_type
order by Total_Sales desc;

select 
	outlet_type,
    cast(sum(total_sales) as decimal (10,2)) as Total_Sales,
	cast((sum(total_sales) *100 / sum(sum(total_sales))  over()) as decimal (10,2)) as Sale_Percentage,
    cast(avg(total_sales) as decimal (10,2)) as Avg_Sales,
    count(*) as No_Of_Items,
    cast(avg(rating) as decimal (10,2)) as Avg_Rating
from blinkit_grocery_data
group by outlet_type
order by Total_Sales desc;