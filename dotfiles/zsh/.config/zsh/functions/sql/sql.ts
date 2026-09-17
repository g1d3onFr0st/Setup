const DBURL = process.env.DATABASE_URL

if (DBURL) console.log(`sudo -iu postgres pgcli ${DBURL}`)
else console.log("sudo -iu postgres pgcli")
