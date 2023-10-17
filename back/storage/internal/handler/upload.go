package handler

import (
	"cloud_storage/internal/utils"
	"cloud_storage/internal/utils/methods"
	"database/sql"
	"fmt"
	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq"
	"log"
	"net/http"
)

func (h *Handler) upload(c *gin.Context) {

	var file utils.File
	var db *sql.DB
	var err error

	if err = c.ShouldBindJSON(&file); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	db, err = sql.Open("postgres", utils.ConnectionInfo)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	if err := methods.InsertUser(file, db); err != nil {
		fmt.Println(err.Error())
		c.JSON(http.StatusBadRequest, gin.H{"response": err.Error()})
	} else {
		c.JSON(http.StatusOK, gin.H{"response": "new file added"})
	}
}
