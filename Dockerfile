# Usando a imagem oficial do Golang para compilar o binário
FROM golang:1.20 AS builder

# Configura o diretório de trabalho
WORKDIR /app

# Copia o código para o contêiner
COPY main.go .

# Compila o binário de forma simples
RUN go build -o main main.go

# Utilizando uma imagem 'scratch' para a imagem final
FROM scratch
COPY --from=builder /app/main .

# Define o comando padrão para executar o binário
CMD ["./main"]