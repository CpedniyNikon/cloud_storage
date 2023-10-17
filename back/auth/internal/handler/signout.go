package handler

import (
	"cloud_storage/internal/utils"
	"database/sql"
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
)

func (h *Handler) signOut(c *gin.Context) {
	type User struct {
		Id int `json:"userId"`
	}
	var db *sql.DB
	var user User
	var err error

	if err := c.ShouldBindJSON(&user); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}
	if db, err = sql.Open("postgres", utils.ConnectionInfo); err != nil {
		defer db.Close()
		log.Fatal(err)
	}
}
