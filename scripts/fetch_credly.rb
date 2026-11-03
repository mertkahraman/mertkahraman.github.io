# Credly profilindeki herkese açık rozetleri _data/certifications.json dosyasına yazar.
# Kullanım: ruby scripts/fetch_credly.rb
require "json"
require "net/http"

USER = ENV.fetch("CREDLY_USER", "mert-kahraman.84cbbe94")
OUT  = File.expand_path("../_data/certifications.json", __dir__)

badges = []
url = "https://www.credly.com/users/#{USER}/badges.json"
while url
  res = Net::HTTP.get_response(URI(url))
  abort "Credly isteği başarısız: HTTP #{res.code}" unless res.is_a?(Net::HTTPSuccess)
  page = JSON.parse(res.body)
  badges.concat(page["data"])
  url = page.dig("metadata", "next_page_url")
end

certs = badges
  .select { |b| b["public"] && b["state"] == "accepted" }
  .map do |b|
    t = b["badge_template"]
    {
      "name"    => t["name"],
      "issuer"  => b.dig("issuer", "entities", 0, "entity", "name"),
      "issued"  => b["issued_at_date"],
      "expires" => b["expires_at_date"],
      "image"   => t["image_url"],
      "url"     => "https://www.credly.com/badges/#{b["id"]}"
    }
  end
  .sort_by { |c| [c["issued"].to_s, c["name"]] }
  .reverse

File.write(OUT, JSON.pretty_generate(certs) + "\n")
puts "#{certs.size} sertifika yazıldı: #{OUT}"
