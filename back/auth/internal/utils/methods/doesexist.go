package methods

import (
	"cloud_storage/internal/utils"
	"database/sql"
)

func DoesExists(user utils.UserData, db *sql.DB) bool {
	var exist bool
	query := "select exists(select login, password from user_data where login=$1 and password=$2)"
	err := db.QueryRow(query, user.Login, user.Password).Scan(&exist)
	if err != nil {
		panic(err)
	}
	return exist
}
