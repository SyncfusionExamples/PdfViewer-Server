FROM microsoft/dotnet:2.1-aspnetcore-runtime AS base

RUN ln -s /lib/x86_64-linux-gnu/libdl-2.24.so /lib/x86_64-linux-gnu/libdl.so

# install System.Drawing native dependencies
RUN apt-get update && apt-get install -y --allow-unauthenticated libgdiplus libc6-dev libx11-dev
RUN ln -s libgdiplus.so gdiplus.dll

WORKDIR /app
EXPOSE 80
ENV SYNCFUSION_LICENSE_KEY=""
ENV DOCUMENT_SLIDING_EXPIRATION_TIME="10"
ENV REDIS_CACHE_CONNECTION_STRING=""
FROM microsoft/dotnet:2.1-sdk AS build
WORKDIR /source
COPY ["src/ej2-pdfviewer-server/ej2-pdfviewer-server.csproj", "./ej2-pdfviewer-server/ej2-pdfviewer-server.csproj"]
RUN dotnet restore "./ej2-pdfviewer-server/ej2-pdfviewer-server.csproj"
COPY . .
WORKDIR "/source/src"
RUN dotnet build -c Release -o /app

FROM build AS publish
RUN dotnet publish -c Release -o /app

FROM base AS final
WORKDIR /app
COPY --from=publish /app .
ENTRYPOINT ["dotnet", "ej2-pdfviewer-server.dll"]