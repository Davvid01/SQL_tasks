# Open the file containing the original INSERT statement
with open("wszystkie_tabele_notatnik.txt", "r") as file:
    data = file.read()

# Extract the values part of the INSERT statement
values_start = data.find("VALUES") + len("VALUES")
values_end = data.rfind(";")
values = data[values_start:values_end].strip()

# Split the values into a list of tuples
rows = values.split("),")
rows = [row.strip() + ")" for row in rows]

# Define the batch size (e.g., less than 1000 rows)
batch_size = 1000

# Create new INSERT statements with smaller batches
batches = [rows[i:i + batch_size] for i in range(0, len(rows), batch_size)]

# Write the new INSERT statements to a new file
with open("split_insert_statements.sql", "w") as output_file:
    for i, batch in enumerate(batches):
        insert_statement = f"INSERT INTO follows(follower_id, followee_id) VALUES {', '.join(batch)};\n"
        output_file.write(insert_statement)
