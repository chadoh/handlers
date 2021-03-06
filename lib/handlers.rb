require "action_view/template"
require "redcarpet"
require "handlers/railtie"

ActionView::Template.register_template_handler :md,
  lambda {|template| "Redcarpet.new(#{template.source.inspect}).to_html" }

module Handlers
  module MERB
    def self.erb_handler
      @@erb_handler ||= ActionView::Template.registered_template_handler(:erb)
    end

    def self.call(template)
      compiled_source = erb_handler.call(template)
      if template.formats.include? :html
        "Redcarpet.new(begin;#{compiled_source};end).to_html"
      else
        compiled_source
      end
    end
  end
end

ActionView::Template.register_template_handler :merb, Handlers::MERB
