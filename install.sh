#!/bin/bash

# Renk tanımlamaları
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No Color

BLINK='\033[5m'

# .env dosyasını kopyala
cp .env.example .env

# Veritabanı oluşturulduğunu hatırlat
echo -e "${BLINK}${RED}Lütfen bu işlemlere başlamadan önce veritabanınızı oluşturun.${NC}"

# Kullanıcıya veritabanının oluşturulup oluşturulmadığını sor
echo -e "${GREEN}Veritabanınızı oluşturdunuz mu? (E/H): ${NC}"
read response

# Kullanıcının yanıtına göre işlem yap
if [ "$response" == "E" ] || [ "$response" == "e" ]; then
    # .env dosyasını düzenle
    echo -e "${GREEN}DB_HOST değerini girin (varsayılan: 127.0.0.1):${NC}"
    read db_host
    db_host=${db_host:-127.0.0.1} # Kullanıcı hiçbir değer girmezse, varsayılan olarak "127.0.0.1" kullan
    sed -i "s/DB_HOST=.*/DB_HOST=$db_host/" .env

    echo -e "${GREEN}DB_DATABASE değerini girin (varsayılan: my_database):${NC}"
    read db_database
    db_database=${db_database:-my_database} # Kullanıcı hiçbir değer girmezse, varsayılan olarak "my_database" kullan
    sed -i "s/DB_DATABASE=.*/DB_DATABASE=$db_database/" .env

    echo -e "${GREEN}DB_USERNAME değerini girin (varsayılan: root):${NC}"
    read db_username
    db_username=${db_username:-root} # Kullanıcı hiçbir değer girmezse, varsayılan olarak "root" kullan
    sed -i "s/DB_USERNAME=.*/DB_USERNAME=$db_username/" .env

    echo -e "${GREEN}DB_PASSWORD değerini girin (varsayılan: empty):${NC}"
    read -s db_password
    db_password=${db_password:-empty} # Kullanıcı hiçbir değer girmezse, varsayılan olarak "empty" kullan
    sed -i "s/DB_PASSWORD=.*/DB_PASSWORD=$db_password/" .env
    echo

    # Composer install
    echo -e "${GREEN}Composer install...${NC}"
    composer install

    # Laravel key generate
    echo -e "${GREEN}Laravel key generate...${NC}"
    php artisan key:generate

    # Laravel storage link
    echo -e "${GREEN}Laravel storage link...${NC}"
    php artisan storage:link

    # Voyager install
    echo -e "${GREEN}Voyager install...${NC}"
    php artisan voyager:install --with-dummy

    echo -e "${GREEN}Laravel proje başlatıldı.${NC}"
else
    # Hata mesajı
    echo -e "${RED}Üzgünüm, veritabanı oluşturmadan başlayamazsınız.${NC}"
fi
