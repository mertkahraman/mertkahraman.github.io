---
title: Hava durumu uygulaması geliştirme notları
subtitle: Bir API ile ilk deneyimim
tags: [javascript, proje]
---

Bu yazıda [Projeler](/projects) sayfasındaki hava durumu uygulamasını
geliştirirken öğrendiklerimi topluyorum.

## Neler öğrendim

1. `fetch` ile API'den veri çekmek
2. Hataları kullanıcıya anlaşılır göstermek
3. Basit bir önbellek ile istek sayısını azaltmak

```js
const res = await fetch(`https://api.example.com/weather?q=${sehir}`);
const veri = await res.json();
```

Devamı sonraki yazıda.
