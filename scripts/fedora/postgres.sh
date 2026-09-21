sudo dnf install -y postgresql-server pgcli
    sudo /usr/bin/postgresql-upgrade --initdb
    sudo systemctl enable --now postgresql
    echo "enter : ( ALTER USER postgres WITH PASSWORD 'YOUR_DATABASE_PASSWORD'; ) and then enter : ( exit ) "
    sudo -iu postgres pgcli
    sudo rm -rf /var/lib/pgsql/data/pg_hba.conf
    sudo cp ~/Setup/config/postgresql-server/pg_hba.conf /var/lib/pgsql/data/
    sudo chown postgres:postgres /var/lib/pgsql/data/pg_hba.conf
    sudo systemctl restart postgresql

echo "postgres.sh : DONE" >> ~/Setup/setup-status.txt