package methods

import (
	"cloud_storage/internal/utils"
	"database/sql"
	_ "github.com/lib/pq"
)

func InsertUser(file utils.File, db *sql.DB) error {
	_, err := db.Query("insert into \"file_data\" (file_name, file_data, user_id) values ($1, $2, $3)", file.Name, file.Data, file.UserId)
	return err
}
