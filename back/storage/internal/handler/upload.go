package handler

import (
	"cloud_storage/internal/utils"
	"database/sql"
	"github.com/gin-gonic/gin"
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
}
