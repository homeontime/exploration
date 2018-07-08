# Create the instance
gcloud sql instances create myflights --tier=db-n1-standard-1 --region europe-west1 --activation-policy=ALWAYS

# You'll need to set the root password at best through the web console of the newly-created instance. Failed to do it with gcloud 

# Run this on the client, if you don't know its public IP
CLIENT=$(wget -qO - http://ipecho.net/)

# Authorize a particular host. Note that this overrides other hosts.
gcloud sql instances patch myflights --authorized-networks $(wget -qO - http://ipecho.net/)

# To find the authorized networks for an instance:
gcloud sql instances describe myflights --format="value(settings.ipConfiguration.authorizedNetworks.value)"

# To find the ip address of the instance
gcloud sql instances describe myflights --format="value(ipAddresses.ipAddress)"

# To import from the file system:
# --local means from the local file system
# bts is the schema name
# the root name of the files must match the table name
mysqlimport -h 104.155.57.102 -u root -p --ignore-lines=1 --fields-terminated-by="," --local bts flights.csv-*