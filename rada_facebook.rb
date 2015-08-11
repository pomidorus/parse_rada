require 'koala'

oauth_access_token = 'CAACEdEose0cBAEeVDI0Kio0vuGWA7MZCs2jmeKGUlqgyAxvnqetBPc3Ua2AOgqe3uY3YZAtQZCvJaaRpMM8jDPY22uE2KVsKtgD23KdYamUhHg2qmEWUYpgkSRv3FppPWqZCEgFQg5FZCjLzbQWgiefL01Ttak8ZAwzes2tCGpgC7xQcPWLBV5mzUWUko0yj2ZASMvy3ZATd2zLMyUnZAtgjWZCZAZCs0FXZBdDcZD'
@graph = Koala::Facebook::API.new
profile = @graph.get_object("me")
feed = @graph.get_connections("me", "friends")
#feed_2 = @graph.fql_query("SELECT post_id, actor_id, target_id, message FROM stream WHERE source_id = 1423864141267644 LIMIT 10")

p @graph.inspect
p profile.inspect
p feed.inspect
#p feed_2.inspect
