# Сколько студентов записались (отношение :learn) на изучение курса Neural Networks?

MATCH (students:student)-[:learn]->(:course{name:'Neural Networks'})
RETURN students.name

# Выведите список студентов, записавшихся на курс NoSQL.

MATCH (students:student)-[:learn]->(:course{name:'NoSQL'})
RETURN students.name