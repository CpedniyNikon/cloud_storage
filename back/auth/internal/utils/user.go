package utils

type UserData struct {
	Login    string `json:"login"`
	Password string `json:"password"`
}

type UserId struct {
	UserId int `json:"userId"`
}
