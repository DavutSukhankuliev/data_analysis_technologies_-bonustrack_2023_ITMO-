# 2. Как зовут диктора курса с названием Statistics?

MATCH (S:course{name:'Statistics'})<-[:speaker]-(speaker_stat)
RETURN speaker_stat.name;

MATCH (S:course)<-[:speaker]-(speaker_stat)
WHERE S.name='Statistics'
RETURN speaker_stat.name

# 3. К упомянутому выше определению базы (т.е. к оператору CREATE) добавьте фрагмент,
указывающий на то, что Dan также является диктором курса Big Data.

MATCH (dan:person{name:'Dan'}),(bd:course{name:'Big Data'})
CREATE (dan)-[:speaker]->(bd)