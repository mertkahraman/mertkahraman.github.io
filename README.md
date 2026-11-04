# Kişisel Portfolyo + Blog

[Jekyll](https://jekyllrb.com) + [Beautiful Jekyll](https://beautifuljekyll.com) teması ile,
GitHub Pages üzerinde ücretsiz yayınlanan site.
temanın güncel sürümü.)

## Yayına alma (Ruby kurmadan)

1. GitHub'da **`mertkahraman.github.io`** adında *public* bir repo oluştur.
2. Kullanıcı adı (`mertkahraman`) dosyalara zaten yazıldı
   (`_config.yml`, `_data/projects.yml`).
3. Dosyaları repoya gönder:
   ```bash
   git init
   git add .
   git commit -m "İlk sürüm"
   git branch -M main
   git remote add origin https://github.com/mertkahraman/mertkahraman.github.io.git
   git push -u origin main
   ```
4. Repo ▸ **Settings ▸ Pages** ▸ Source: *Deploy from a branch*, Branch: `main` / `(root)`.
5. 1–2 dakika sonra site `https://mertkahraman.org` adresinde açılır (alan adı `CNAME` dosyasında).
   Derleme hatalarını repo'nun **Actions** sekmesinde görebilirsin.

## İçerik ekleme

| Ne | Nerede |
|---|---|
| Yeni blog yazısı | `_posts/YYYY-AA-GG-baslik.md` (üstte `title`, `subtitle`, `tags`) |
| Yeni proje | `_data/projects.yml` içine bir kayıt (`featured: true` → ana sayfada da görünür) |
| Proje görseli | `assets/img/projects/` |
| Profil fotoğrafı | `assets/img/` içine koy, `_config.yml` ▸ `avatar` |
| Menü | `_config.yml` ▸ `navbar-links` |
| Renkler | `_config.yml` ▸ `navbar-col`, `link-col` … ve `assets/css/custom.css` |
| Google Analytics | `_config.yml` ▸ `gtag: "G-XXXX"` satırını aç |

Yazıya kapak görseli için üst bilgiye `cover-img: /assets/img/kapak.jpg` ekleyebilirsin.

## Yerelde çalıştırma (isteğe bağlı)

**Docker ile (Ruby kurmadan)** — Git Bash'te proje klasöründe:

```bash
MSYS_NO_PATHCONV=1 docker run --rm --name jekyll-site -p 4000:4000 -v "$(pwd -W):/srv/site" -v jekyll-gems:/usr/local/bundle -w /srv/site ruby:3.3 bash -c "bundle install && bundle exec jekyll serve --host 0.0.0.0 --force_polling"
```

Durdurmak için: `docker stop jekyll-site`

**Ruby ile:** [Ruby+Devkit](https://rubyinstaller.org) kur, sonra:

```bash
bundle install
bundle exec jekyll serve
```

Site `http://localhost:4000` adresinde açılır, dosyaları kaydettikçe yenilenir.

## Klasör yapısı

```
_config.yml           site ayarları, menü, tema
_data/projects.yml    proje listesi
_includes/            proje kartı şablonu
_posts/               blog yazıları
assets/               css ve görseller
index.html            ana sayfa (tanıtım + öne çıkan projeler + son yazılar)
blog/index.html       sayfalı blog listesi
projects.md, aboutme.md, tags.html
```
