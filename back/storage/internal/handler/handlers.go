package handler

import (
	"github.com/gin-contrib/cors"
	"github.com/gin-gonic/gin"
)

type Handler struct {
	routes *gin.Engine
}

func NewHandler() (h *Handler) {
	return &Handler{}
}

func (h *Handler) InitAuthRoutes() *gin.Engine {
	h.routes = gin.New()
	h.routes.Use(cors.Default())

	auth := h.routes.Group("/store")
	{
		auth.POST("/up-load", h.upload)
		auth.POST("/get-files", h.getFiles)
	}
	return h.routes
}
