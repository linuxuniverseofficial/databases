import sqlite3

# Cria (ou abre) o banco
con = sqlite3.connect("empresa.db")
cur = con.cursor()

# ── Criar tabela ─────────────────────────────────────
cur.execute("""
    CREATE TABLE IF NOT EXISTS clientes (
        id      INTEGER PRIMARY KEY AUTOINCREMENT,
        nome    TEXT    NOT NULL,
        email   TEXT    UNIQUE NOT NULL,
        ativo   INTEGER DEFAULT 1
    )
""")
con.commit()

# ── INSERT ───────────────────────────────────────────
cur.execute(
    "INSERT INTO clientes (nome, email) VALUES (?, ?)",
    ("João Silva", "joao@exemplo.com")
)
cur.execute(
    "INSERT INTO clientes (nome, email) VALUES (?, ?)",
    ("Maria Souza", "maria@exemplo.com")
)
con.commit()

# ── SELECT ───────────────────────────────────────────
cur.execute("SELECT * FROM clientes")
for linha in cur.fetchall():
    print(linha)

# ── UPDATE ───────────────────────────────────────────
cur.execute(
    "UPDATE clientes SET email = ? WHERE id = ?",
    ("joao.novo@exemplo.com", 1)
)
con.commit()

# ── DELETE ───────────────────────────────────────────
cur.execute("DELETE FROM clientes WHERE id = ?", (2,))
con.commit()

con.close()
