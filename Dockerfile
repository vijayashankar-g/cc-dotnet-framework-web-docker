FROM mcr.microsoft.com/dotnet/framework/aspnet:4.8
WORKDIR /inetpub/wwwroot
COPY aspnetmvcapp/*.config ./
COPY aspnetmvcapp/target/. ./
COPY aspnetmvcapp/. ./


# FROM mcr.microsoft.com/dotnet/framework/sdk:4.8 AS build
# WORKDIR /app

# # copy csproj and restore as distinct layers
# COPY *.sln .
# COPY aspnetmvcapp/*.csproj ./aspnetmvcapp/
# COPY aspnetmvcapp/*.config ./aspnetmvcapp/
# RUN nuget restore

# # copy everything else and build app
# COPY aspnetmvcapp/. ./aspnetmvcapp/
# WORKDIR /app/aspnetmvcapp
# RUN msbuild /p:Configuration=Release
