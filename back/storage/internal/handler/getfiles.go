package handler

import (
	"cloud_storage/internal/utils"
	"database/sql"
	"github.com/gin-gonic/gin"
	"log"
	"net/http"
)

func (h *Handler) getFiles(c *gin.Context) {

	var userId utils.UserId
	var db *sql.DB
	var err error

	if err = c.ShouldBindJSON(&userId); err != nil {
		c.JSON(http.StatusBadRequest, gin.H{"error": err.Error()})
		return
	}

	db, err = sql.Open("postgres", utils.ConnectionInfo)
	if err != nil {
		log.Fatal(err)
	}
	db.Close()

	query :=
		"select * from file_data where user_id=$1"
	rows, _ := db.Query(query, userId.UserId)

	var files []utils.File
	for rows.Next() {
		var fileId int
		var fileName string
		var fileData []byte
		var userId int

		err := rows.Scan(&fileId, &fileName, &fileData, &userId)
		if err != nil {
			log.Fatal(err)
		}

		files = append(files, utils.File{
			Name: fileName,
			Data: fileData,
		})
	}
	c.JSON(http.StatusOK, files)
}
