# Backup (dump SQL completo)
sqlite3 empresa.db .dump > backup_$(date +%Y%m%d).sql

# Restaurar
sqlite3 novo.db < backup_20260312.sql

# Cópia binária direta (mais rápido para bancos grandes)
sqlite3 empresa.db "VACUUM INTO 'empresa_backup.db';"
