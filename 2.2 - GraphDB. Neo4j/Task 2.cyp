# Напишите запрос, который для базы Учебные курсы выведет наименования курсов.

MATCH (courses:course) RETURN courses.name

# Напишите запрос, который для базы Учебные курсы выведет имена авторов.

MATCH (courses:course)<-[:author]-(authors) RETURN authors.name

MATCH (authors:person)-[:author]->(course) RETURN authors.name