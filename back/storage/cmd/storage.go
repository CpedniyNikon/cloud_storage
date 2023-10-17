package main

import (
	"cloud_storage/internal/handler"
	server "cloud_storage/pkg/server"
	"fmt"
	"github.com/spf13/viper"
	"log"
)

func main() {
	fmt.Println("server started")
	if err := InitConfig(); err != nil {
		log.Fatalf("error initializing configs: %s", err.Error())
	}

	handlers := handler.NewHandler()

	srv := new(server.Server)
	if err := srv.Run(viper.GetString("storage_port"), handlers.InitAuthRoutes()); err != nil {
		log.Fatal("error occurred while auth service " + err.Error())
	}
}

func InitConfig() error {
	viper.SetConfigType("yaml")
	viper.SetConfigName("config")
	viper.AddConfigPath("configs")
	return viper.ReadInConfig()
}
