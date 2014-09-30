# http = require('http')
# request = require('request')

# apiBase = 'http://localhost:3000/api/'

# apiToken = '6406988fdd98e73c1cd38c53e74f18cdafab1e7c9a461b6a'

exports.getProduct = (productId) ->
  # constructedURL = apiBase + "products/#{productId}.json?token=#{apiToken}"
  JSON.parse('{"id":1,"name":"Ruby on Rails Tote","description":"Reiciendis exercitationem nihil qui eveniet qui quia. Tenetur minima id dolorum atque doloribus. Nostrum labore non occaecati.","price":"15.99","display_price":"$15.99 USD","available_on":"2014-08-22T10:46:56.789Z","slug":"ruby-on-rails-tote","meta_description":null,"meta_keywords":null,"shipping_category_id":1,"taxon_ids":[3,11],"total_on_hand":10,"has_variants":false,"master":{"id":1,"name":"Ruby on Rails Tote","sku":"ROR-00011","price":"15.99","weight":"0.0","height":null,"width":null,"depth":null,"is_master":true,"cost_price":"17.0","slug":"ruby-on-rails-tote","description":"Reiciendis exercitationem nihil qui eveniet qui quia. Tenetur minima id dolorum atque doloribus. Nostrum labore non occaecati.","track_inventory":true,"display_price":"$15.99 USD","options_text":"","in_stock":true,"option_values":[],"images":[{"id":21,"position":1,"attachment_content_type":"image/jpeg","attachment_file_name":"ror_tote.jpeg","type":"Spree::Image","attachment_updated_at":"2014-08-22T10:47:25.111Z","attachment_width":360,"attachment_height":360,"alt":null,"viewable_type":"Spree::Variant","viewable_id":1,"mini_url":"/spree/products/21/mini/ror_tote.jpeg?1408704445","small_url":"/spree/products/21/small/ror_tote.jpeg?1408704445","product_url":"/spree/products/21/product/ror_tote.jpeg?1408704445","large_url":"/spree/products/21/large/ror_tote.jpeg?1408704445"},{"id":22,"position":2,"attachment_content_type":"image/jpeg","attachment_file_name":"ror_tote_back.jpeg","type":"Spree::Image","attachment_updated_at":"2014-08-22T10:47:25.847Z","attachment_width":360,"attachment_height":360,"alt":null,"viewable_type":"Spree::Variant","viewable_id":1,"mini_url":"/spree/products/22/mini/ror_tote_back.jpeg?1408704445","small_url":"/spree/products/22/small/ror_tote_back.jpeg?1408704445","product_url":"/spree/products/22/product/ror_tote_back.jpeg?1408704445","large_url":"/spree/products/22/large/ror_tote_back.jpeg?1408704445"}]},"variants":[],"option_types":[],"product_properties":[{"id":25,"product_id":1,"property_id":9,"value":"Tote","property_name":"Type"},{"id":26,"product_id":1,"property_id":10,"value":"15 x 18 x 6","property_name":"Size"},{"id":27,"product_id":1,"property_id":11,"value":"Canvas","property_name":"Material"}]}')
  # options =
  #   host: "localhost"
  #   port: 3000
  #   path: "/api/products/#{productId}.json?token=#{apiToken}"
  # http.get(options, (resp) ->
  #   str = ''
  #   resp.on 'data', (chunk) ->
  #     str += chunk
  #   resp.on 'end', ->
  #     return JSON.parse(str)
  # ).on "error", (e) ->
  #   console.log "Got error: #{e.message}"
  #   return null

  # request {uri: constructedURL}, (err, response, body) ->
  #   if err?
  #     console.log "Error #{err}"
  #     return [null, response]
  #   [JSON.parse(body), response]


exports.userLikedVariant = (variantId, UserToken) ->
  console.log "oohh you liked #{variantId}"
  JSON.parse('{"status": "cool"}')

exports.userDislikedVariant = (variantId, UserToken) ->
  console.log "oohh no disliked #{variantId}"
  JSON.parse('{"status": "uncool"}')

exports.buyVariant = (variantId, UserToken) ->
  console.log "oohh you just bought #{variantId}"
  JSON.parse('{"OrderToken": "I am an orderToken"}')
