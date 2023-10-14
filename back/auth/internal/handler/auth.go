package handler

import (
	"cloud_storage/internal/utils"
	methods "cloud_storage/internal/utils/methods"
	"database/sql"
	"fmt"
	"github.com/gin-gonic/gin"
	_ "github.com/lib/pq"
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
	fmt.Println(user.Login)
	fmt.Println(user.Password)

	db, err := sql.Open("postgres", utils.ConnectionInfo)
	if err != nil {
		log.Fatal(err)
	}
	defer db.Close()

	if err := methods.AddUser(user, db); err != nil {
		fmt.Println(err.Error())
		c.JSON(http.StatusBadRequest, gin.H{"response": err.Error()})
	} else {
		c.JSON(http.StatusOK, gin.H{"response": "new user added"})
	}
}

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

	//TODO MAKE SHIT

}
