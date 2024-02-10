#!/bin/bash
# Yardım metni
help_message() {
    echo "Kullanım: $0 [-cnt CONTROLLER_NAME] [-cmp COMPONENT_NAME]"
    echo "    -cnt    Belirtilen isimde bir controller oluşturur."
    echo "    -cmp    Belirtilen isimde bir component oluşturur."
    echo "    -m      Belirtilen isimde bir model oluşturur."
    echo "    -mc     Belirtilen isimde bir model ve controller oluşturur."
}

# Parametreleri kontrol etme
if [ $# -eq 0 ]; then
    help_message
    exit 1
fi

while [[ $# -gt 0 ]]; do
    key="$1"

    case $key in
        -cnt)
            shift
            controller_name="$1"
            php artisan make:controller "${controller_name}Controller"
            ;;
        -cmp)
            shift
            component_name="$1"
            php artisan make:component "${component_name}"
            ;;
        -m)
            shift
            model_name="$1"
            php artisan make:model "${model_name}"
            ;;
        -mc)
            shift
            model_controller_name="$1"
            php artisan make:model "${model_controller_name}"
            php artisan make:controller "${model_controller_name}Controller"
            ;;
        *)
            echo "Geçersiz parametre: $key"
            exit 1
            ;;
    esac
    shift
done
