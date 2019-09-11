select 
g.goods_id as id,
g.goods_id,
g.title,
g.cat_id,
g.brand_id,
g.price,
g.is_del,
g.is_open
FROM
goods as g
where g.gmt_modified > date_add(:sql_last_value, INTERVAL 8 HOUR)
order by g.goods_id