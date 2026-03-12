DB="empresa.db"

# Tabela legível no terminal
sqlite3 -column -header "$DB" "SELECT * FROM clientes;"

# CSV (para importar em planilha ou outro sistema)
sqlite3 -csv -header "$DB" "SELECT * FROM clientes;" > clientes.csv

# JSON (SQLite >= 3.38)
sqlite3 -json "$DB" "SELECT * FROM clientes;"

# Só os valores, separados por pipe (padrão)
sqlite3 "$DB" "SELECT id || ' | ' || nome || ' | ' || email FROM clientes;"
