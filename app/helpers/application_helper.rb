module ApplicationHelper
  def full_title(page_title = '')
    base_title = "岳人(たけと)"
    if page_title.empty?
      base_title
    else
      page_title + " | " + base_title
    end
  end

  def yama_horizontal_list_image(post)
    if post.image.present?
      image_tag(post.image.url, class:"box-left__picture")
    else
      image_tag("https://mgs01y1.wowma.net/pc/img/common/no_image300.gif?query=201908071342", class:"box-left__picture")
    end
  end

  def show_user_image
    if @user.image.present?
      image_tag(@user.image.url, class:"user-face")
    else
      image_tag("https://static.mercdn.net/images/member_photo_noimage_thumb.png", class:"user-face")
    end
  end

  def lists_user_image(user)
    if user.image.present?
      image_tag(user.image.url, class:"user-face")
    else
      image_tag("https://static.mercdn.net/images/member_photo_noimage_thumb.png", class:"user-face")
    end
  end

  def sp_show_user_image
    if @user.image.present?
      image_tag(@user.image.url, class:"sp-detail__user__picture")
    else
      image_tag("https://static.mercdn.net/images/member_photo_noimage_thumb.png", class:"sp-detail__user__picture")
    end
  end

  def show_follow_user_image(user)
    if user.image.present?
      image_tag(user.image.url, class:"follow-user__picture")
    else
      image_tag("https://static.mercdn.net/images/member_photo_noimage_thumb.png", class:"follow-user__picture")
    end
  end

  def sp_show_follow_user_image(user)
    if user.image.present?
      image_tag(user.image.url, class:"sp-post-box__picture")
    else
      image_tag("https://static.mercdn.net/images/member_photo_noimage_thumb.png", class:"sp-post-box__picture")
    end
  end

  def sp_index_user_image(user)
    if user.image.present?
      image_tag(user.image.url, class:"sp-post-box__picture")
    else
      image_tag("https://static.mercdn.net/images/member_photo_noimage_thumb.png", class:"sp-post-box__picture")
    end
  end

  def yama_post_list_image(post)
    if post.image.present?
      image_tag(post.image.url, class:"post-box__picture")
    else
      image_tag("https://mgs01y1.wowma.net/pc/img/common/no_image300.gif?query=201908071342", class:"post-box__picture")
    end
  end

  def ranking_list_user_image(post)
    if post.user.image.present?
      image_tag(post.user.image.url, class:"ranking-user-image")
    else
      image_tag("https://static.mercdn.net/images/member_photo_noimage_thumb.png", class:"ranking-user-image")
    end
  end

  def meshi_horizontal_list_image(meal)
    if meal.image.present?
      image_tag(meal.image.url, class:"box-left__picture")
    else
      image_tag("https://mgs01y1.wowma.net/pc/img/common/no_image300.gif?query=201908071342", class:"box-left__picture")
    end
  end

  def meshi_index_page_image(meal)
    if meal.image.present?
      image_tag(meal.image.url, class:"sp-post-box__picture")
    else
      image_tag("https://mgs01y1.wowma.net/pc/img/common/no_image300.gif?query=201908071342", class:"sp-post-box__picture")
    end
  end

  def yama_index_list_image(post)
    if post.image.present?
      image_tag(post.image.url, class:"sp-post-box__picture")
    else
      image_tag("https://mgs01y1.wowma.net/pc/img/common/no_image300.gif?query=201908071342", class:"sp-post-box__picture")
    end
  end

  def comment_user_image(comment)
    if comment.user.image.url.present?
      image_tag(comment.user.image.url, class:"comment-user__comment-picture")
    else
      image_tag("https://mgs01y1.wowma.net/pc/img/common/no_image300.gif?query=201908071342", class:"comment-user__comment-picture")
    end
  end

  def sp_comment_user_image(comment)
    if comment.user.image.url.present?
      image_tag(comment.user.image.url, class:"sp-detail__user__comment-picture")
    else
      image_tag("https://mgs01y1.wowma.net/pc/img/common/no_image300.gif?query=201908071342", class:"sp-detail__user__comment-picture")
    end
  end

  def sp_comment_image
    if @post.image.present?
      image_tag(@post.image.url, class:"sp-detail__pic-box__comment-picture")
    else
      image_tag("https://mgs01y1.wowma.net/pc/img/common/no_image300.gif?query=201908071342", class:"sp-detail__pic-box__comment-picture")
    end
  end

  def meshi_show_user_image
    if @post.user.image.present?
      image_tag(@post.user.image.url, class:"user-info__face")
    else
      image_tag("https://static.mercdn.net/images/member_photo_noimage_thumb.png", class:"user-info__face")
    end
  end

  def post_show_image
    if @post.image.present?
      image_tag(@post.image.url, class:"detail-container__picture")
    else
      image_tag("https://mgs01y1.wowma.net/pc/img/common/no_image300.gif?query=201908071342", class:"detail-container__picture")
    end
  end

  def meshi_show_image
    if @meal.image.present?
      image_tag(@meal.image.url, class:"detail-container__picture")
    else
      image_tag("https://mgs01y1.wowma.net/pc/img/common/no_image300.gif?query=201908071342", class:"detail-container__picture")
    end
  end

  def sp_meshi_show_user_image
    if @post.user.image.present?
      image_tag(@post.user.image.url, class:"sp-detail__user__picture")
    else
      image_tag("https://static.mercdn.net/images/member_photo_noimage_thumb.png", class:"sp-detail__user__picture")
    end
  end

  def sp_meshi_show_image
    if @meal.image.present?
      image_tag(@meal.image.url, class:"sp-detail__pic-box__picture")
    else
      image_tag("https://mgs01y1.wowma.net/pc/img/common/no_image300.gif?query=201908071342", class:"sp-detail__pic-box__picture")
    end
  end

  def sp_yama_show_image
    if @post.image.present?
      image_tag(@post.image.url, class:"sp-detail__pic-box__picture")
    else
      image_tag("https://mgs01y1.wowma.net/pc/img/common/no_image300.gif?query=201908071342", class:"sp-detail__pic-box__picture")
    end
  end

  def food_stuff_present?
    if @meal.food_stuff.present?
      simple_format(@meal.food_stuff)
    else
      content_tag(:h3, "未入力")
    end
  end

  def cooking_method_present?
    if @meal.cooking_method.present?
      simple_format(@meal.cooking_method)
    else
      content_tag(:h3, "未入力")
    end
  end

  def sp_header_login_image
    if user_signed_in?
      if current_user.image.url
        image_tag(current_user.image.url, class:"user-face")
      else
        image_tag("https://static.mercdn.net/images/member_photo_noimage_thumb.png", class:"user-face")
      end
    else
      image_tag("https://static.mercdn.net/images/member_photo_noimage_thumb.png", class:"user-face")
    end
  end
end
