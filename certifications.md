---
title: Sertifikalar
subtitle: Credly üzerinden doğrulanabilir rozetlerim
css: /assets/css/custom.css
---

{% assign today = site.time | date: "%Y-%m-%d" %}
<div class="project-grid cert-grid">
  {% for c in site.data.certifications %}
  <a class="project-card cert-card" href="{{ c.url }}" target="_blank" rel="noopener">
    <img class="cert-img" src="{{ c.image }}" alt="{{ c.name }}" loading="lazy">
    <div class="project-body">
      <h3>{{ c.name }}</h3>
      <p class="cert-meta">
        {{ c.issuer }} · {{ c.issued | date: site.date_format }}
        {% if c.expires %}
          <br>{% if c.expires < today %}Süresi doldu{% else %}Geçerlilik{% endif %}: {{ c.expires | date: site.date_format }}
        {% endif %}
      </p>
    </div>
  </a>
  {% endfor %}
</div>

<p>Tüm rozetler: <a href="https://www.credly.com/users/mert-kahraman.84cbbe94" target="_blank" rel="noopener">Credly profilim</a></p>
