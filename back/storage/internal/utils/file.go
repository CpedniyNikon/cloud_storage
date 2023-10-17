package utils

type File struct {
	Name   string `json:"name"`
	Data   []byte `json:"data"`
	UserId int    `json:"userId"`
}
