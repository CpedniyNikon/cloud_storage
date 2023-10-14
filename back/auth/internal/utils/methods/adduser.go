package methods

import (
	"cloud_storage/internal/utils"
	"cloud_storage/internal/utils/errors"
	"database/sql"
)

func AddUser(user utils.UserData, db *sql.DB) error {
	var exist = DoesExists(user, db)
	if exist {
		return errors.UserAlreadyExistsError{Message: "user already exists in db"}
	}
	_, err := db.Query("insert into \"user_data\" (login, password) values ($1, $2) returning user_id", user.Login, user.Password)
	return err
}
