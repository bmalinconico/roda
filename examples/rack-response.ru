require "../lib/cuba"
require "cuba/contrib"

Cuba.plugin Cuba::Mote

ITEMS = ("A".."Z").to_a

Cuba.send :remove_const, :Response
Cuba::Response = Rack::Response

Cuba.define do
  def mote_vars(content)
    { content: content }
  end

  on default do
    res.write view("home", list: ITEMS)
  end
end

run Cuba
