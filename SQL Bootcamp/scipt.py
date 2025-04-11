with open("wszystkie_tabele_notatnik.txt", "r") as file:
    data = file.read()

values_start = data.find("VALUES") + len("VALUES")
values_end = data.rfind(";")
values = data[values_start:values_end].strip()

rows = values.split("),")
rows = [row.strip() + ")" for row in rows]

batch_size = 1000

# Create new INSERT statements with smaller batches
batches = [rows[i:i + batch_size] for i in range(0, len(rows), batch_size)]

with open("split_insert_statements.sql", "w") as output_file:
    for i, batch in enumerate(batches):
        insert_statement = f"INSERT INTO follows(follower_id, followee_id) VALUES {', '.join(batch)};\n"
        output_file.write(insert_statement)
