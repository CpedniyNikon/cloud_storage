package handler

import (
	"cloud_storage/internal/utils"
	"cloud_storage/internal/utils/methods"
	"database/sql"
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
)

func (h *Handler) signIn(c *gin.Context) {
	var user utils.UserData
	var db *sql.DB
	var err error

	if err = c.ShouldBindJSON(&user); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	db, err = sql.Open("postgres", utils.ConnectionInfo)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	if exist := methods.DoesExists(user, db); exist != false {
		var userId int
		err = db.QueryRow("select user_id from user_data where login = $1 and password = $2", user.Login, user.Password).Scan(&userId)
		if err != nil {
			c.JSON(http.StatusBadRequest, gin.H{"response": err.Error()})
		} else {
			c.JSON(http.StatusOK, gin.H{"userId": userId})
		}
	} else {
		c.JSON(http.StatusBadRequest, gin.H{"response": "no such user existence"})
	}
}
