ActionButton
============

This provides helpers for creating a non-AJAX form containing a single button element.
Using a button element allows the actions to be safe, not javascript dependent,
and easily styled.

This plugin also includes a custom version of the lowpro javascript library, and
a helper for adding a unobtrusive javascript snippet to handle AJAX form
submission of the button.


Methods and Options
-------------------

* `button_tag (name, content, type, html_options)`
   * `name`: the name and id attribute of the button
   * `content`: the content inside the open/close tags
   * `type`: `submit`, `reset`, or `button`
* `action_button (name, content, url_for_options, options)`
   * `name`: the name and id attribute of the button
   * `content`: the content inside the button open/close tags
   * `url_for_options`: same as for `link_to`, and `form_for`, etc.
   * `options`:
      * accepts all normal HTML options that are generally available on `content_tag`
      * `:wrapper_tag` - this takes a symbol for the tag name to be used around the button
                         default is `:p`
      * `:form_class` - set's the class attribute for the form tag
      * `:form_id` - set's the id attribute for the form tag
* `ujs_remote_form (selector, options)`
   * `selector`: the CSS selector used to specify which element(s) to apply this observer to.
   * `options`:
      * all the standard `options_for_ajax` options used in all the `remote` Prototype helpers
      * `:confirm` - presents the user with a confirm dialog before submitting form
      * `:update` - can either be a single DOM ID specifying which element to update 
                    or a hash of `:success` and `:failure` to update different elements based on the AJAX result.


Examples
--------

**Create a delete button:**

    action_button 'delete-comment', 'Delete this Comment', comment_path(@post, comment), {:method => :delete, :number => comment.id}
    
**Produces:**

    <form action="/posts/5/comments/12" class="delete-comment-form" id="delete-comment12-form" method="post">
       <div style="margin:0;padding:0">
          <input name="_method" type="hidden" value="delete" />
       </div>
       <p>
          <button class="delete-comment" id="delete-comment12" name="delete-comment12" type="submit">Delete this Comment</button>
       </p>
    </form>
    
  
**Embed an image and use custom classes and id for easier styling:**

    action_button 'delete-comment', image_tag('icons/delete.png', :alt => 'Add a Comment'),
                                    new_comment_path(@post),
                                    { :id => "commentDel", :class => 'delComment', 
                                      :form_class => 'delComment', :form_id => "delCommentForm" }

**Produces:**    

    <form action="/posts/5/comments/12" class="delComment" id="delCommentForm12" method="post">
       <div style="margin:0;padding:0">
          <input name="_method" type="hidden" value="delete" />
       </div>
       <p>
          <button class="delComment" id="delComment12" name="delComment12" type="submit">
            <img src="/images/icons/delete.png" alt="Delete this Comment" />
          </button>
       </p>
    </form>


  

### License

Copyright (c) 2008 Brian Landau of Viget Labs, released under the MIT license
