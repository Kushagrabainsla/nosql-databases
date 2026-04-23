import json
import csv

with open('zips.json', 'r') as f, open('citylist.csv', 'w', newline='') as out:
    writer = csv.writer(out)
    # Write the header in an order we can easily use for the COPY command later
    writer.writerow(['state', 'city', 'zip', 'loc', 'pop'])
    for line in f:
        try:
            data = json.loads(line)
            # Format the list of floats for CQL syntax
            loc = f"[{data['loc'][0]}, {data['loc'][1]}]"
            writer.writerow([data['state'], data['city'], data['_id'], loc, data['pop']])
        except json.JSONDecodeError:
            pass