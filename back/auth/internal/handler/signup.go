package handler

import (
	"cloud_storage/internal/utils"
	"cloud_storage/internal/utils/methods"
	"database/sql"
	"fmt"
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
)

func (h *Handler) signUp(c *gin.Context) {
	var user utils.UserData
	var db *sql.DB
	if err := c.ShouldBindJSON(&user); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	db, err := sql.Open("postgres", utils.ConnectionInfo)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	if err := methods.InsertUser(user, db); err != nil {
		fmt.Println(err.Error())
		c.JSON(http.StatusBadRequest, gin.H{"response": err.Error()})
	} else {
		c.JSON(http.StatusOK, gin.H{"response": "new user added"})
	}
}
