import random
import pathlib
import os


def generate_random_arrows():
    return [random.randint(1, 10) for _ in range(6)]         #generate score for 6 arrows


# def calculate_total_end_score(arrows):
#     return sum(arrow for arrow in arrows if arrow is not None)    #total_score


def generate_sql_insert_statements():
    sql_statements = []
    for range_id in range(45, 51):
        print(range_id)
        for _ in range(5):                               # 5 ends per range
            arrows = generate_random_arrows()            #generate list of 6 arrows
            # total_end_score = calculate_total_end_score(arrows)
            sql = f"""
-- For RangeID: {range_id}
INSERT INTO EndScoreTable (Arrow1, Arrow2, Arrow3, Arrow4, Arrow5, Arrow6, TotalEndScore, RoundRangeID)
VALUES ({arrows[0]}, {arrows[1]}, {arrows[2]}, {arrows[3]}, {arrows[4]}, {arrows[5]}, {range_id});
        """
            sql_statements.append(sql)

    return sql_statements


def write_sql_to_file(filename, sql_statements):
    with open(filename, 'w') as file:
        for statement in sql_statements:
            file.write(statement + "\n")               #write to text file
    print(f"SQL statements written to {filename}")


# Generate SQL insert statements
generate_sql_insert_statements()
# CHANGE:
curr_path = os.getcwd() + "/enddata_hobart_pearth.txt"
print(curr_path)
# Write SQL statements to a file
write_sql_to_file(curr_path, generate_sql_insert_statements())         
