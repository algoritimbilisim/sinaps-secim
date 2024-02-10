# CHON Web Sitesi Şablonu

CHON, canlılığın yapı taşı olan elementlerden (C-H-O-N) esinlenerek oluşturulmuş bir web sitesi şablonudur. Bu şablon, Laravel 8 ve Voyager admin paketi üzerine inşa edilmiştir ve Laravel bileşenlerini temel alan bir başlangıç kiti sunar.

## Kurulum

Projeyi başlatmak için `install.sh` betiğini çalıştırın. Bu betik gerekli bağımlılıkları yükler ve projeyi başlatmak için gerekli operasyonları gerçekleştirir.

```bash
./install.sh
```

## Kısayollar

Proje içinde yer alan gen.sh betiği, Laravel bileşenlerini yönetmek için kullanılabilir. Bu betikle model, controller, component gibi artisan işlemleri gerçekleştirebilirsiniz.

```bash
Kullanım: ./gen.sh [-cnt CONTROLLER_NAME] [-cmp COMPONENT_NAME]
    -cnt    Belirtilen isimde bir controller oluşturur.
    -cmp    Belirtilen isimde bir component oluşturur.
    -m      Belirtilen isimde bir model oluşturur.
    -mc     Belirtilen isimde bir model ve controller oluşturur
```

Örnek kullanım:

```bash
./gen.sh -m User
```

Bu komut, User adında bir model oluşturur.

## Katkıda Bulunma

Katkılarınızı memnuniyetle karşılıyoruz! Her türlü geri bildirim, öneri veya katkı için GitHub deposuna katkıda bulunun.
