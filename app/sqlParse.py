# Open the .sql file
sql_file = open('schema.sql','r')

# Create an empty command string
sql_command = ''

# Iterate over all lines in the sql file
for line in sql_file:
    # Ignore comented lines
    if not line.startswith('--') and line.strip('\n'):
        # Append line to the command string
        sql_command += line.strip('\n')
        
        # If the command string ends with ';', it is a full statement
        if sql_command.endswith(';'):
            # Try to execute statemente and commit it
            try:
                session.execute(text(sql_command))
                session.commit()
                # Assert in case of error
            except:
                print('Ops')

            # Finally, clear command string
            finally:
                sql_command = ''