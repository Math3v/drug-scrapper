require 'open-uri'
require 'nokogiri'

class Crawler
  @@url = 'http://www.sukl.sk/sk/databazy-a-servis/databazy/vyhladavanie-v-databaze-registrovanych-liekov?page_id=242&lie_nazov=&lie_kod=&atc_kod=&lie_rc=&atc_nazov=&isk_kod=0&drz_kod=&vyd_kod=0&org_kod=0&reg_typ_kod=0&in_kat=LEFT&ped_ind=ALL&ped_kontraind=ALL'
  def get_root
    puts @@url
    doc = Nokogiri::HTML(open(@@url))
    table = doc.css(".searchTable")
    table.search('tr').each do |tr|
      tr.search('td').each_with_index do |td, i|
        if i == 2
          node = td.search('a')[0]
          puts node['title']
          puts node['href']
        end
      end
    end
  end

  def get_drug_page(url)
    doc = Nokogiri::HTML(open(url))
  end
end

crawler = Crawler.new
crawler.get_root