$('.like-<%= @like.article_id %>').html("<%= j(render 'likes/btn',  article: @like.article ) %>")