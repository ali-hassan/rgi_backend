module JSONAPI
  class LinkBuilder

    private

    def formatted_module_path_from_class(klass)
      scopes = module_scopes_from_class(klass)

      unless scopes.empty?
        # The Main Hack: adding the #gsub
        "/#{ scopes.map(&:underscore).join('/') }/".gsub(/api\//, '')
      else
        "/"
      end
    end

  end
end