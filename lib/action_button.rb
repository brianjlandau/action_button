# ActionButton
module ActionButton

  module Helper

    ##
    # This will add a button that will execute the given action, this is done by
    # wrapping the button in a form element. This allows destructive actions to be
    # packaged in a highly styleable element and still be "safe" by not using GET's.
    #
    # The <tt>:id</tt> and <tt>:class</tt> options set those attributes only for the button tag.
    # 
    # The button tags name attribute will be set to the <tt>name</tt> paramter followed by
    # either the <tt>:id</tt> url_for_options value or a <tt>:number</tt> option either is
    # available.
    # 
    # 
    # ==== Options
    # * <tt>url_for_options</tt> acts the same as it does in <tt>form_tag</tt> or ActionController::Base#url_for
    # * accepts all normal HTML options that are generally available on <tt>content_tag</tt>
    # * <tt>:wrapper_tag</tt> - this takes a symbol for the tag name to be used around the button
    #   * default: <tt>:p</tt>
    #   * a wrapper is needed so XHTML 1.0 Strict will validate
    # * <tt>:form_class</tt> - set's the class attribute for the form tag.
    # * <tt>:form_id</tt> - set's the id attribute for the form tag.
    # 
    # ==== Example
    #   <%= action_button 'delete_order', "Delete this Order", {:action => :delete, :id => order}, {:method => :delete} %> 
    #
    def action_button(name, content, url_for_options = {}, options = {}, *parameters_for_url)
      defaults = {:class => name}
      options = defaults.merge(options)
      wrapper_tag = options.delete(:wrapper_tag) || :p
      
      if options[:id].blank?
        id = (url_for_options[:id] || options[:number]) ? name + (url_for_options[:id] || options.delete(:number)).to_s : name
      else
        id = options[:id]
      end
      form_class = options.delete(:form_class) { |o| "#{options[:class]}-form" }
      form_id = options.delete(:form_id) { |o| "#{id}-form" }
      
      output = form_tag(url_for_options, options.merge(:class => "#{form_class}", :id => "#{form_id}"), *parameters_for_url)
      options.delete(:method)
      
      output << "\n"
      output << content_tag(wrapper_tag, button_tag(id, content, 'submit', options) )
      output << "\n</form>"
      
      return output
    end
    
    ##
    # Creates a button tag with the content passed to the content parameter inside.
    # It also sets the <tt>name</tt> attribute, and the <tt>type</tt> attribute on the tag
    # bassed on the parameters provided.
    #
    def button_tag(name, content, type, html_options = {})
      content_tag(:button, content, html_options.merge(:type => type, :name => name, :id => name))
    end
    
    ##
    # Creates javascript to create a remote form event observer with the lowpro library for all
    # elements that match the CSS selector specified.
    #
    def ujs_remote_form(selector, options = {})
      js_options = custom_remote_options(options)
      
      <<JS
  Event.addBehavior({
    '#{selector}': Remote.Form(#{js_options})
  });
JS
    end

    private

      def custom_remote_options(options = {}) # :nodoc: all
        extra_options = []

        if options[:confirm]
          confirm = options.delete(:confirm)
          extra_options << "confirm:'#{confirm}'"
        end

        if options[:update] && options[:update].is_a?(Hash)
          update  = []
          update << "success:'#{options[:update][:success]}'" if options[:update][:success]
          update << "failure:'#{options[:update][:failure]}'" if options[:update][:failure]
          update  = 'update:{' + update.join(',') + '}'
          extra_options << update
        elsif options[:update]
          update = "update:'#{options[:update]}'"
          extra_options << update
        end

        unless extra_options.empty?
          if options.empty?
            js_options = '{' + extra_options.join(', ') + '}'
          else
            extra_options = extra_options.join(', ')
            js_options = options_for_ajax(options)
            js_options = js_options.gsub(/\}$/, ", #{extra_options}}")
          end
        else
          js_options = options_for_ajax(options)
        end

        return js_options
      end
    
  end

end